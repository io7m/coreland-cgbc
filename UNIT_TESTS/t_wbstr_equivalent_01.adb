with CGBC.Bounded_Wide_Strings;
with Test;

procedure T_WBstr_Equivalent_01 is
  package BS renames CGBC.Bounded_Wide_Strings;

  TC : Test.Context_t;
  S1 : BS.Bounded_String (8);
  S2 : BS.Bounded_String (8);
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_wbstr_equivalent_01",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BS.Append (S1, "ABCD");
  pragma Assert (BS.Length (S1) = 4);
  BS.Append (S2, "ABCD");
  pragma Assert (BS.Length (S2) = 4);

  Test.Check (TC, 1248, BS.Equivalent (S1, S2), "BS.Equivalent (S1, S2)");

  BS.Truncate (S2);
  Test.Check (TC, 1249, not BS.Equivalent (S1, S2), "not BS.Equivalent (S1, S2)");

  BS.Append (S2, "ABCD");
  pragma Assert (BS.Length (S2) = 4);

  BS.Replace_Element (S2, 1, '0');
  pragma Assert (BS.Length (S2) = 4);

  Test.Check (TC, 1250, not BS.Equivalent (S1, S2), "not BS.Equivalent (S1, S2)");
end T_WBstr_Equivalent_01;
