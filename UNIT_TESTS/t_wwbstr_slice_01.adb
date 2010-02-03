with Ada.Strings;
with CGBC.Bounded_Wide_Wide_Strings;
with Test;

procedure T_WWBstr_Slice_01 is
  package BS renames CGBC.Bounded_Wide_Wide_Strings;

  TC    : Test.Context_t;
  S1    : BS.Bounded_String (8);
  Error : Boolean;
  S     : Wide_Wide_String (1 .. 4);
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_wwbstr_slice_01",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BS.Append (S1, "ABCD");

  Test.Check (TC, 2275, BS.Slice (S1, 1, 2) = "AB", "BS.Slice (S1, 1, 2) = ""AB""");
  Test.Check (TC, 2276, BS.Slice (S1, 1, 4) = "ABCD", "BS.Slice (S1, 1, 4) = ""ABCD""");
  Test.Check (TC, 2277, BS.Slice (S1, 2, 3) = "BC", "BS.Slice (S1, 2, 3) = ""BC""");

  begin
    Error := False;
    S     := BS.Slice (S1, 1, 5);
    pragma Assert (S (1)'Valid);
  exception
    when Ada.Strings.Index_Error => Error := True;
  end;
  Test.Check (TC, 2278, Error, "Error");

end T_WWBstr_Slice_01;
