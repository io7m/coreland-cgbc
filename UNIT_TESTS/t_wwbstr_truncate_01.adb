with CGBC.Bounded_Wide_Wide_Strings;
with Test;

procedure T_WWBstr_Truncate_01 is
  package BS renames CGBC.Bounded_Wide_Wide_Strings;

  TC : Test.Context_t;
  S1 : BS.Bounded_String (8);
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_wwbstr_truncate_01",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BS.Append (S1, "ABCD");
  pragma Assert (BS.Length (S1) = 4);

  BS.Truncate (S1);

  Test.Check (TC, 2245, BS.Length (S1) = 0, "BS.Length (S1) = 0");
  Test.Check (TC, 2246, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");
  Test.Check (TC, 2247, BS.To_String (S1) = "", "BS.To_String (S1) = """"");
end T_WWBstr_Truncate_01;
