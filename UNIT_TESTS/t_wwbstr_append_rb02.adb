with Ada.Strings;
with CGBC.Bounded_Wide_Wide_Strings;
with Test;

procedure T_WWBstr_Append_RB02 is
  package BS renames CGBC.Bounded_Wide_Wide_Strings;

  TC : Test.Context_t;
  S1 : BS.Bounded_String (8);
  S  : constant Wide_Wide_String := "         H";
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_wwbstr_append_rb02",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BS.Append (S1, "ABCDEFG");

  -- As Append_R02 but with unusual bounds on New_Item.
  pragma Assert (S (10 .. 10) = "H");
  BS.Append
    (Source   => S1,
     New_Item => S (10 .. 10),
     Drop     => Ada.Strings.Right);
  Test.Check (TC, 2295, BS.Length (S1) = 8, "BS.Length (S1) = 8");
  Test.Check (TC, 2296, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");
  Test.Check (TC, 2297, BS.To_String (S1) = "ABCDEFGH", "BS.To_String (S1) = ""ABCDEFGH""");
end T_WWBstr_Append_RB02;
