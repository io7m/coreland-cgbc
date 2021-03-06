with CGBC.Bounded_Wide_Strings;
with Test;

procedure T_WBstr_Append_01 is
  package BS renames CGBC.Bounded_Wide_Strings;

  TC : Test.Context_t;
  S1 : BS.Bounded_String (8);
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_wbstr_append_01",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BS.Append (S1, "ABCD");

  Test.Check (TC, 1200, BS.Length (S1) = 4, "BS.Length (S1) = 4");
  Test.Check (TC, 1201, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");

  BS.Append (S1, "EFGH");

  Test.Check (TC, 1202, BS.Length (S1) = 8, "BS.Length (S1) = 8");
  Test.Check (TC, 1203, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");
  Test.Check (TC, 1204, BS.To_String (S1) = "ABCDEFGH", "BS.To_String (S1) = ""ABCDEFGH""");
end T_WBstr_Append_01;
