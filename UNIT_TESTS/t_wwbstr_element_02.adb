with Ada.Strings;
with CGBC.Bounded_Wide_Wide_Strings;
with Test;

procedure T_WWBstr_Element_02 is
  package BS renames CGBC.Bounded_Wide_Wide_Strings;

  TC    : Test.Context_t;
  S1    : BS.Bounded_String (8);
  Error : Boolean;
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_wwbstr_element_02",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BS.Append (S1, "ABCD");
  pragma Assert (BS.Length (S1) = 4);

  BS.Replace_Element
    (Source => S1,
     Index  => 1,
     By     => '0');

  Test.Check (TC, 2256, BS.Element (S1, 1) = '0', "BS.Element (S1, 1) = '0'");
  Test.Check (TC, 2257, BS.Element (S1, 2) = 'B', "BS.Element (S1, 2) = 'B'");
  Test.Check (TC, 2258, BS.Element (S1, 3) = 'C', "BS.Element (S1, 3) = 'C'");
  Test.Check (TC, 2259, BS.Element (S1, 4) = 'D', "BS.Element (S1, 4) = 'D'");
  Test.Check (TC, 2260, BS.Length (S1) = 4, "BS.Length (S1) = 4");
  Test.Check (TC, 2261, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");

  BS.Replace_Element
    (Source => S1,
     Index  => 2,
     By     => '1');

  Test.Check (TC, 2262, BS.Element (S1, 1) = '0', "BS.Element (S1, 1) = '0'");
  Test.Check (TC, 2263, BS.Element (S1, 2) = '1', "BS.Element (S1, 2) = '1'");
  Test.Check (TC, 2264, BS.Element (S1, 3) = 'C', "BS.Element (S1, 3) = 'C'");
  Test.Check (TC, 2265, BS.Element (S1, 4) = 'D', "BS.Element (S1, 4) = 'D'");

  BS.Replace_Element
    (Source => S1,
     Index  => 3,
     By     => '2');

  Test.Check (TC, 2266, BS.Element (S1, 1) = '0', "BS.Element (S1, 1) = '0'");
  Test.Check (TC, 2267, BS.Element (S1, 2) = '1', "BS.Element (S1, 2) = '1'");
  Test.Check (TC, 2268, BS.Element (S1, 3) = '2', "BS.Element (S1, 3) = '2'");
  Test.Check (TC, 2269, BS.Element (S1, 4) = 'D', "BS.Element (S1, 4) = 'D'");

  BS.Replace_Element
    (Source => S1,
     Index  => 4,
     By     => '3');

  Test.Check (TC, 2270, BS.Element (S1, 1) = '0', "BS.Element (S1, 1) = '0'");
  Test.Check (TC, 2271, BS.Element (S1, 2) = '1', "BS.Element (S1, 2) = '1'");
  Test.Check (TC, 2272, BS.Element (S1, 3) = '2', "BS.Element (S1, 3) = '2'");
  Test.Check (TC, 2273, BS.Element (S1, 4) = '3', "BS.Element (S1, 4) = '3'");

  Error := False;
  begin
    BS.Replace_Element (S1, 5, 'A');
  exception
    when Ada.Strings.Index_Error => Error := True;
  end;
  Test.Check (TC, 2274, Error, "Error");

end T_WWBstr_Element_02;
