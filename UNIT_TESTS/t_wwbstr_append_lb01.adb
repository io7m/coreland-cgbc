with Ada.Strings;
with CGBC.Bounded_Wide_Wide_Strings;
with Test;

procedure T_WWBstr_Append_LB01 is
  package BS renames CGBC.Bounded_Wide_Wide_Strings;

  TC : Test.Context_t;
  S1 : BS.Bounded_String (8);
  S  : constant Wide_Wide_String := "        012345678      ";
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_wwbstr_append_lb01",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BS.Append (S1, "ABCD");

  pragma Assert (S (9 .. 17) = "012345678");
  BS.Append
    (Source   => S1,
     New_Item => S (9 .. 17),
     Drop     => Ada.Strings.Left);

  Test.Check (TC, 2218, BS.Length (S1) = 8, "BS.Length (S1) = 8");
  Test.Check (TC, 2219, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");
  Test.Check (TC, 2220, BS.To_String (S1) = "12345678", "BS.To_String (S1) = ""12345678""");
end T_WWBstr_Append_LB01;
