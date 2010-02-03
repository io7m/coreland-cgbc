with Ada.Strings;
with CGBC.Bounded_Wide_Wide_Strings;
with Test;

procedure T_WWBstr_Append_E01 is
  package BS renames CGBC.Bounded_Wide_Wide_Strings;
  TC     : Test.Context_t;
  S1     : BS.Bounded_String (8);
  Caught : Boolean;
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_wwbstr_append_e01",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BS.Append (S1, "ABCD");
  pragma Assert (BS.Length (S1) = 4);

  begin
    Caught := False;
    BS.Append
      (Source   => S1,
       New_Item => "012345678",
       Drop     => Ada.Strings.Error);
  exception
    when Ada.Strings.Length_Error => Caught := True;
  end;
  Test.Check (TC, 2205, Caught, "Caught");
  Test.Check (TC, 2206, BS.Length (S1) = 4, "BS.Length (S1) = 4");
  Test.Check (TC, 2207, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");
  Test.Check (TC, 2208, BS.To_String (S1) = "ABCD", "BS.To_String (S1) = ""ABCD""");

end T_WWBstr_Append_E01;
