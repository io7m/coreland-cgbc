with Ada.Strings;
with CGBC.Bounded_Wide_Wide_Strings;
with Test;

procedure T_WWBstr_Init_02 is
  package BS renames CGBC.Bounded_Wide_Wide_Strings;

  TC     : Test.Context_t;
  S1     : BS.Bounded_String (8);
  Caught : Boolean;
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_wwbstr_init_02",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BS.Set_Bounded_String
    (Target => S1,
     Source => "ABCD");
  Test.Check (TC, 2234, BS.Length (S1) = 4, "BS.Length (S1) = 4");
  Test.Check (TC, 2235, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");

  BS.Set_Bounded_String
    (Target => S1,
     Source => "ABCDEFGH");
  Test.Check (TC, 2236, BS.Length (S1) = 8, "BS.Length (S1) = 8");
  Test.Check (TC, 2237, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");

  begin
    Caught := False;
    BS.Set_Bounded_String
      (Target => S1,
       Source => "ABCDEFGHI",
       Drop   => Ada.Strings.Error);
  exception
    when Ada.Strings.Length_Error => Caught := True;
  end;
  Test.Check (TC, 2238, Caught, "Caught");

  BS.Set_Bounded_String
    (Target => S1,
     Source => "ABCDEFGHI",
     Drop   => Ada.Strings.Right);
  Test.Check (TC, 2239, BS.Length (S1) = 8, "BS.Length (S1) = 8");
  Test.Check (TC, 2240, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");
  Test.Check (TC, 2241, BS.To_String (S1) = "ABCDEFGH", "BS.To_String (S1) = ""ABCDEFGH""");

  BS.Set_Bounded_String
    (Target => S1,
     Source => "ABCDEFGHI",
     Drop   => Ada.Strings.Left);
  Test.Check (TC, 2242, BS.Length (S1) = 8, "BS.Length (S1) = 8");
  Test.Check (TC, 2243, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");
  Test.Check (TC, 2244, BS.To_String (S1) = "BCDEFGHI", "BS.To_String (S1) = ""BCDEFGHI""");

end T_WWBstr_Init_02;
