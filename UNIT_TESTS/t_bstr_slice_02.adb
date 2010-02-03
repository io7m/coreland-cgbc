with Ada.Strings;
with CGBC.Bounded_Strings;
with Test;

procedure T_Bstr_Slice_02 is
  package BS renames CGBC.Bounded_Strings;

  TC    : Test.Context_t;
  S1    : BS.Bounded_String (8);
  Error : Boolean;
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_bstr_slice_02",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BS.Append (S1, "ABCD");

  declare
    BSS : constant BS.Bounded_String := BS.Bounded_Slice (S1, 1, 2);
  begin
    Test.Check (TC, 279, BS.To_String (BSS) = "AB", "BS.To_String (BSS) = ""AB""");
  end;

  declare
    BSS : constant BS.Bounded_String := BS.Bounded_Slice (S1, 1, 4);
  begin
    Test.Check (TC, 280, BS.To_String (BSS) = "ABCD", "BS.To_String (BSS) = ""ABCD""");
  end;

  declare
    BSS : constant BS.Bounded_String := BS.Bounded_Slice (S1, 2, 3);
  begin
    Test.Check (TC, 281, BS.To_String (BSS) = "BC", "BS.To_String (BSS) = ""BC""");
  end;

  Error := False;
  begin
    declare
      BSS : constant BS.Bounded_String := BS.Bounded_Slice (S1, 1, 5);
    begin
      pragma Assert (BS.Length (BSS) = 0);
      null;
    end;
  exception
    when Ada.Strings.Index_Error => Error := True;
  end;
  Test.Check (TC, 282, Error, "Error");

end T_Bstr_Slice_02;
