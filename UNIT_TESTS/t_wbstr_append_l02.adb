with Ada.Strings;
with CGBC.Bounded_Wide_Strings;
with Test;

procedure T_WBstr_Append_L02 is
  package BS renames CGBC.Bounded_Wide_Strings;

  TC : Test.Context_t;
  S1 : BS.Bounded_String (8);
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_wbstr_append_l02",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BS.Append (S1, "ABCDEFG");

  -- Does not require truncation.
  BS.Append
    (Source   => S1,
     New_Item => "H",
     Drop     => Ada.Strings.Left);

  Test.Check (TC, 1212, BS.Length (S1) = 8, "BS.Length (S1) = 8");
  Test.Check (TC, 1213, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");
  Test.Check (TC, 1214, BS.To_String (S1) = "ABCDEFGH", "BS.To_String (S1) = ""ABCDEFGH""");

end T_WBstr_Append_L02;
