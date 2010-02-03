with Ada.Strings;
with CGBC.Bounded_Wide_Strings;
with Test;

procedure T_WBstr_Element_01 is
  package BS renames CGBC.Bounded_Wide_Strings;

  TC    : Test.Context_t;
  S1    : BS.Bounded_String (8);
  Error : Boolean;
  E     : Wide_Character;
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_wbstr_element_01",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BS.Append (S1, "ABCD");
  pragma Assert (BS.Length (S1) = 4);

  Test.Check (TC, 1251, BS.Element (S1, 1) = 'A', "BS.Element (S1, 1) = 'A'");
  Test.Check (TC, 1252, BS.Element (S1, 2) = 'B', "BS.Element (S1, 2) = 'B'");
  Test.Check (TC, 1253, BS.Element (S1, 3) = 'C', "BS.Element (S1, 3) = 'C'");
  Test.Check (TC, 1254, BS.Element (S1, 4) = 'D', "BS.Element (S1, 4) = 'D'");

  Error := False;
  begin
    E := BS.Element (S1, 5);
    pragma Assert (not E'Valid);
  exception
    when Ada.Strings.Index_Error => Error := True;
  end;
  Test.Check (TC, 1255, Error, "Error");

end T_WBstr_Element_01;
