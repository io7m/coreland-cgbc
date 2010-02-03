with Ada.Strings;
with CGBC.Bounded_Strings;
with Test;

procedure T_Bstr_Append_RB01 is
  package BS renames CGBC.Bounded_Strings;

  TC : Test.Context_t;
  S1 : BS.Bounded_String (8);
  S  : constant String := "    012345678    ";
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_bstr_append_rb01",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BS.Append (S1, "ABCD");

  -- As Append_RB01 but with unusual bounds on New_Item.
  pragma Assert (S (5 .. 13) = "012345678");
  BS.Append
    (Source   => S1,
     New_Item => S (5 .. 13), -- "012345678"
     Drop     => Ada.Strings.Right);
  Test.Check (TC, 292, BS.Length (S1) = 8, "BS.Length (S1) = 8");
  Test.Check (TC, 293, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");
  Test.Check (TC, 294, BS.To_String (S1) = "ABCD0123", "BS.To_String (S1) = ""ABCD0123""");
end T_Bstr_Append_RB01;
