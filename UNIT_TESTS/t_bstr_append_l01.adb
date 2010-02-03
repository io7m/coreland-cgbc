with Ada.Strings;
with CGBC.Bounded_Strings;
with Test;

procedure T_Bstr_Append_L01 is
  package BS renames CGBC.Bounded_Strings;

  TC : Test.Context_t;
  S1 : BS.Bounded_String (8);
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_bstr_append_l01",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BS.Append (S1, "ABCD");

  -- Requires truncation and Right'Length >= Left.Data_Size
  BS.Append
    (Source   => S1,
     New_Item => "012345678",
     Drop     => Ada.Strings.Left);

  Test.Check (TC, 209, BS.Length (S1) = 8, "BS.Length (S1) = 8");
  Test.Check (TC, 210, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");
  Test.Check (TC, 211, BS.To_String (S1) = "12345678", "BS.To_String (S1) = ""12345678""");
end T_Bstr_Append_L01;
