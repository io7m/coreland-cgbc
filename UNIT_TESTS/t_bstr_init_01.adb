with CGBC.Bounded_Strings;
with Test;

procedure T_Bstr_Init_01 is
  package BS renames CGBC.Bounded_Strings;

  TC : Test.Context_t;
  S1 : BS.Bounded_String (8);
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_bstr_init_01",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  -- "Referenced before value"
  pragma Warnings (Off);
  Test.Check (TC, 227, BS.To_String (S1) = "", "BS.To_String (S1) = """"");
  pragma Warnings (On);
  Test.Check (TC, 228, BS.Length (S1) = 0, "BS.Length (S1) = 0");
  Test.Check (TC, 229, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");

  BS.Append (S1, "ABCD");
  Test.Check (TC, 230, BS.Length (S1) = 4, "BS.Length (S1) = 4");
  Test.Check (TC, 231, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");

  declare
    S2 : constant BS.Bounded_String := BS.To_Bounded_String ("ABCD");
  begin
    Test.Check (TC, 232, BS.Equivalent (S1, S2), "BS.Equivalent (S1, S2)");
    Test.Check (TC, 233, BS.To_String (S2) = "ABCD", "BS.To_String (S2) = ""ABCD""");
  end;

end T_Bstr_Init_01;
