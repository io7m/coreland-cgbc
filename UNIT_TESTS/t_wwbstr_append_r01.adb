with Ada.Strings;
with CGBC.Bounded_Wide_Wide_Strings;
with Test;

procedure T_WWBstr_Append_R01 is
  package BS renames CGBC.Bounded_Wide_Wide_Strings;

  TC : Test.Context_t;
  S1 : BS.Bounded_String (8);
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_wwbstr_append_r01",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BS.Append (S1, "ABCD");

  -- Right requires truncation.
  BS.Append
    (Source   => S1,
     New_Item => "012345678",
     Drop     => Ada.Strings.Right);
  Test.Check (TC, 2283, BS.Length (S1) = 8, "BS.Length (S1) = 8");
  Test.Check (TC, 2284, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");
  Test.Check (TC, 2285, BS.To_String (S1) = "ABCD0123", "BS.To_String (S1) = ""ABCD0123""");
end T_WWBstr_Append_R01;
