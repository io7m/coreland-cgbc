with Ada.Strings;
with CGBC.Bounded_Strings;
with Test;

procedure T_Bstr_Append_LB02 is
  package BS renames CGBC.Bounded_Strings;

  TC : Test.Context_t;
  S1 : BS.Bounded_String (8);
  S  : constant String := "         H";
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_bstr_append_lb02",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BS.Append (S1, "ABCDEFG");

  -- As Append_L02 but with unusual bounds on New_Item.
  pragma Assert (S (10 .. 10) = "H");
  BS.Append
    (Source   => S1,
     New_Item => S (10 .. 10),
     Drop     => Ada.Strings.Left);

  Test.Check (TC, 221, BS.Length (S1) = 8, "BS.Length (S1) = 8");
  Test.Check (TC, 222, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");
  Test.Check (TC, 223, BS.To_String (S1) = "ABCDEFGH", "BS.To_String (S1) = ""ABCDEFGH""");
end T_Bstr_Append_LB02;
