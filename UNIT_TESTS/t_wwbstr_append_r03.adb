with Ada.Strings;
with CGBC.Bounded_Wide_Wide_Strings;
with Test;

procedure T_WWBstr_Append_R03 is
  package BS renames CGBC.Bounded_Wide_Wide_Strings;

  TC : Test.Context_t;
  S1 : BS.Bounded_String (8);
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_wwbstr_append_r03",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BS.Append (S1, "ABCDEFGH");

  -- Right truncated to nothing.
  BS.Append
    (Source   => S1,
     New_Item => "H",
     Drop     => Ada.Strings.Right);
  Test.Check (TC, 2289, BS.Length (S1) = 8, "BS.Length (S1) = 8");
  Test.Check (TC, 2290, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");
  Test.Check (TC, 2291, BS.To_String (S1) = "ABCDEFGH", "BS.To_String (S1) = ""ABCDEFGH""");
end T_WWBstr_Append_R03;
