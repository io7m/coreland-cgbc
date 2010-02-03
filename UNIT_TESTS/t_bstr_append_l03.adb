with Ada.Strings;
with CGBC.Bounded_Strings;
with Test;

procedure T_Bstr_Append_L03 is
  package BS renames CGBC.Bounded_Strings;

  TC : Test.Context_t;
  S1 : BS.Bounded_String (8);
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_bstr_append_l03",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BS.Append (S1, "ABCDEFGH");

  -- Requires truncation and Right'Length < Left.Data_Size.
  BS.Append
    (Source   => S1,
     New_Item => "H",
     Drop     => Ada.Strings.Left);

  Test.Check (TC, 215, BS.Length (S1) = 8, "BS.Length (S1) = 8");
  Test.Check (TC, 216, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");
  Test.Check (TC, 217, BS.To_String (S1) = "BCDEFGHH", "BS.To_String (S1) = ""BCDEFGHH""");

end T_Bstr_Append_L03;
