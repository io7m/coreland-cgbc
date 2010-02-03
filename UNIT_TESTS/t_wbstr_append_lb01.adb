with Ada.Strings;
with CGBC.Bounded_Wide_Strings;
with Test;

procedure T_WBstr_Append_LB01 is
  package BS renames CGBC.Bounded_Wide_Strings;

  TC : Test.Context_t;
  S1 : BS.Bounded_String (8);
  S  : constant Wide_String := "        012345678      ";
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_wbstr_append_lb01",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BS.Append (S1, "ABCD");

  pragma Assert (S (9 .. 17) = "012345678");
  BS.Append
    (Source   => S1,
     New_Item => S (9 .. 17),
     Drop     => Ada.Strings.Left);

  Test.Check (TC, 1218, BS.Length (S1) = 8, "BS.Length (S1) = 8");
  Test.Check (TC, 1219, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");
  Test.Check (TC, 1220, BS.To_String (S1) = "12345678", "BS.To_String (S1) = ""12345678""");
end T_WBstr_Append_LB01;
