with Ada.Strings;
with CGBC.Bounded_Strings;
with Test;

procedure T_Bstr_Init_02 is
  package BS renames CGBC.Bounded_Strings;

  TC     : Test.Context_t;
  S1     : BS.Bounded_String (8);
  Caught : Boolean;
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_bstr_init_02",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BS.Set_Bounded_String
    (Target => S1,
     Source => "ABCD");
  Test.Check (TC, 234, BS.Length (S1) = 4, "BS.Length (S1) = 4");
  Test.Check (TC, 235, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");

  BS.Set_Bounded_String
    (Target => S1,
     Source => "ABCDEFGH");
  Test.Check (TC, 236, BS.Length (S1) = 8, "BS.Length (S1) = 8");
  Test.Check (TC, 237, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");

  begin
    Caught := False;
    BS.Set_Bounded_String
      (Target => S1,
       Source => "ABCDEFGHI",
       Drop   => Ada.Strings.Error);
  exception
    when Ada.Strings.Length_Error => Caught := True;
  end;
  Test.Check (TC, 238, Caught, "Caught");

  BS.Set_Bounded_String
    (Target => S1,
     Source => "ABCDEFGHI",
     Drop   => Ada.Strings.Right);
  Test.Check (TC, 239, BS.Length (S1) = 8, "BS.Length (S1) = 8");
  Test.Check (TC, 240, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");
  Test.Check (TC, 241, BS.To_String (S1) = "ABCDEFGH", "BS.To_String (S1) = ""ABCDEFGH""");

  BS.Set_Bounded_String
    (Target => S1,
     Source => "ABCDEFGHI",
     Drop   => Ada.Strings.Left);
  Test.Check (TC, 242, BS.Length (S1) = 8, "BS.Length (S1) = 8");
  Test.Check (TC, 243, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");
  Test.Check (TC, 244, BS.To_String (S1) = "BCDEFGHI", "BS.To_String (S1) = ""BCDEFGHI""");

end T_Bstr_Init_02;
