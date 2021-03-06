with Ada.Strings;
with CGBC.Bounded_Wide_Wide_Strings;
with Test;

procedure T_WWBstr_Append_LB03 is
  package BS renames CGBC.Bounded_Wide_Wide_Strings;

  TC : Test.Context_t;
  S1 : BS.Bounded_String (8);
  S  : constant Wide_Wide_String := "         H";
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_wwbstr_append_lb03",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BS.Append (S1, "ABCDEFGH");

  -- As Append_L03 but with unusual bounds on New_Item.
  pragma Assert (S (10 .. 10) = "H");
  BS.Append
    (Source   => S1,
     New_Item => S (10 .. 10),
     Drop     => Ada.Strings.Left);
  Test.Check (TC, 2224, BS.Length (S1) = 8, "BS.Length (S1) = 8");
  Test.Check (TC, 2225, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");
  Test.Check (TC, 2226, BS.To_String (S1) = "BCDEFGHH", "BS.To_String (S1) = ""BCDEFGHH""");

end T_WWBstr_Append_LB03;
