with Ada.Strings;
with CGBC.Bounded_Strings;
with Test;

procedure T_Bstr_Element_02 is
  package BS renames CGBC.Bounded_Strings;

  TC    : Test.Context_t;
  S1    : BS.Bounded_String (8);
  Error : Boolean;
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_bstr_element_02",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BS.Append (S1, "ABCD");
  pragma Assert (BS.Length (S1) = 4);

  BS.Replace_Element
    (Source => S1,
     Index  => 1,
     By     => '0');

  Test.Check (TC, 256, BS.Element (S1, 1) = '0', "BS.Element (S1, 1) = '0'");
  Test.Check (TC, 257, BS.Element (S1, 2) = 'B', "BS.Element (S1, 2) = 'B'");
  Test.Check (TC, 258, BS.Element (S1, 3) = 'C', "BS.Element (S1, 3) = 'C'");
  Test.Check (TC, 259, BS.Element (S1, 4) = 'D', "BS.Element (S1, 4) = 'D'");
  Test.Check (TC, 260, BS.Length (S1) = 4, "BS.Length (S1) = 4");
  Test.Check (TC, 261, BS.Maximum_Length (S1) = 8, "BS.Maximum_Length (S1) = 8");

  BS.Replace_Element
    (Source => S1,
     Index  => 2,
     By     => '1');

  Test.Check (TC, 262, BS.Element (S1, 1) = '0', "BS.Element (S1, 1) = '0'");
  Test.Check (TC, 263, BS.Element (S1, 2) = '1', "BS.Element (S1, 2) = '1'");
  Test.Check (TC, 264, BS.Element (S1, 3) = 'C', "BS.Element (S1, 3) = 'C'");
  Test.Check (TC, 265, BS.Element (S1, 4) = 'D', "BS.Element (S1, 4) = 'D'");

  BS.Replace_Element
    (Source => S1,
     Index  => 3,
     By     => '2');

  Test.Check (TC, 266, BS.Element (S1, 1) = '0', "BS.Element (S1, 1) = '0'");
  Test.Check (TC, 267, BS.Element (S1, 2) = '1', "BS.Element (S1, 2) = '1'");
  Test.Check (TC, 268, BS.Element (S1, 3) = '2', "BS.Element (S1, 3) = '2'");
  Test.Check (TC, 269, BS.Element (S1, 4) = 'D', "BS.Element (S1, 4) = 'D'");

  BS.Replace_Element
    (Source => S1,
     Index  => 4,
     By     => '3');

  Test.Check (TC, 270, BS.Element (S1, 1) = '0', "BS.Element (S1, 1) = '0'");
  Test.Check (TC, 271, BS.Element (S1, 2) = '1', "BS.Element (S1, 2) = '1'");
  Test.Check (TC, 272, BS.Element (S1, 3) = '2', "BS.Element (S1, 3) = '2'");
  Test.Check (TC, 273, BS.Element (S1, 4) = '3', "BS.Element (S1, 4) = '3'");

  Error := False;
  begin
    BS.Replace_Element (S1, 5, 'A');
  exception
    when Ada.Strings.Index_Error => Error := True;
  end;
  Test.Check (TC, 274, Error, "Error");

end T_Bstr_Element_02;
