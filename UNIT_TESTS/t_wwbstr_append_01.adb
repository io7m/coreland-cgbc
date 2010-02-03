with CGBC.Bounded_Wide_Wide_Strings;
with Test;

procedure T_WWBstr_Append_01 is
  package BS renames CGBC.Bounded_Wide_Wide_Strings;

  TC : Test.Context_t;
  S1 : BS.Bounded_String (8);
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_wwbstr_append_01",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BS.Append (S1, "ABCD");

  Test.Check (TC, 2200, BS.Length (S1) = 4, "BS.Length (S1) = 4");
  Test.Check (TC, 2201, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");

  BS.Append (S1, "EFGH");

  Test.Check (TC, 2202, BS.Length (S1) = 8, "BS.Length (S1) = 8");
  Test.Check (TC, 2203, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");
  Test.Check (TC, 2204, BS.To_String (S1) = "ABCDEFGH", "BS.To_String (S1) = ""ABCDEFGH""");
end T_WWBstr_Append_01;
