with Ada.Strings;
with CGBC.Bounded_Wide_Strings;
with Test;

procedure T_WBstr_Append_RB03 is
  package BS renames CGBC.Bounded_Wide_Strings;

  TC : Test.Context_t;
  S1 : BS.Bounded_String (8);
  S  : constant Wide_String := "          H";
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_wbstr_append_rb03",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BS.Append (S1, "ABCDEFGH");

  -- As Append_R03 but with unusual bounds on New_Item.
  pragma Assert (S (11 .. 11) = "H");
  BS.Append
    (Source   => S1,
     New_Item => S (11 .. 11),
     Drop     => Ada.Strings.Right);
  Test.Check (TC, 1298, BS.Length (S1) = 8, "BS.Length (S1) = 8");
  Test.Check (TC, 1299, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");
  Test.Check (TC, 1300, BS.To_String (S1) = "ABCDEFGH", "BS.To_String (S1) = ""ABCDEFGH""");
end T_WBstr_Append_RB03;
