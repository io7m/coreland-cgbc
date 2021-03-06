with Ada.Strings;
with CGBC.Bounded_Strings;
with Test;

procedure T_Bstr_Element_01 is
  package BS renames CGBC.Bounded_Strings;

  TC    : Test.Context_t;
  S1    : BS.Bounded_String (8);
  Error : Boolean;
  E     : Character;
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_bstr_element_01",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BS.Append (S1, "ABCD");
  pragma Assert (BS.Length (S1) = 4);

  Test.Check (TC, 251, BS.Element (S1, 1) = 'A', "BS.Element (S1, 1) = 'A'");
  Test.Check (TC, 252, BS.Element (S1, 2) = 'B', "BS.Element (S1, 2) = 'B'");
  Test.Check (TC, 253, BS.Element (S1, 3) = 'C', "BS.Element (S1, 3) = 'C'");
  Test.Check (TC, 254, BS.Element (S1, 4) = 'D', "BS.Element (S1, 4) = 'D'");

  Error := False;
  begin
    E := BS.Element (S1, 5);
    pragma Assert (not E'Valid);
  exception
    when Ada.Strings.Index_Error => Error := True;
  end;
  Test.Check (TC, 255, Error, "Error");

end T_Bstr_Element_01;
