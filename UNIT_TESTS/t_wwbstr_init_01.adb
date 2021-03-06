with CGBC.Bounded_Wide_Wide_Strings;
with Test;

procedure T_WWBstr_Init_01 is
  package BS renames CGBC.Bounded_Wide_Wide_Strings;

  TC : Test.Context_t;
  S1 : BS.Bounded_String (8);
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_wwbstr_init_01",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  -- "Referenced before value"
  pragma Warnings (Off);
  Test.Check (TC, 2227, BS.To_String (S1) = "", "BS.To_String (S1) = """"");
  pragma Warnings (On);
  Test.Check (TC, 2228, BS.Length (S1) = 0, "BS.Length (S1) = 0");
  Test.Check (TC, 2229, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");

  BS.Append (S1, "ABCD");
  Test.Check (TC, 2230, BS.Length (S1) = 4, "BS.Length (S1) = 4");
  Test.Check (TC, 2231, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");

  declare
    S2 : constant BS.Bounded_String := BS.To_Bounded_String ("ABCD");
  begin
    Test.Check (TC, 2232, BS.Equivalent (S1, S2), "BS.Equivalent (S1, S2)");
    Test.Check (TC, 2233, BS.To_String (S2) = "ABCD", "BS.To_String (S2) = ""ABCD""");
  end;

end T_WWBstr_Init_01;
