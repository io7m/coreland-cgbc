with BHT_Support;
with Test;

procedure T_BHT_07 is
  TC : Test.Context_t;

  package BST4 renames BHT_Support.String_Tables4;

  Called         : Boolean;
  Correct_Key    : Boolean;
  Correct_Value  : Boolean;
  Expected_Key   : BHT_Support.Key_Type4 := "ZZZZ";
  Expected_Value : constant Natural := 1;
  Exists         : Boolean;
  Inserted       : Boolean;

  procedure Process
    (Key  : BHT_Support.Key_Type4;
     Data : Natural) is
  begin
    Called        := True;
    Correct_Key   := Key = Expected_Key;
    Correct_Value := Data = Expected_Value;
  end Process;

  procedure Query is new BST4.Query_Element (Process);

begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_bht_07",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BST4.Insert
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1),
     Element   => Expected_Value,
     Inserted  => Inserted);
  pragma Assert (Inserted);

  Called := False;

  Query
    (Container => BHT_Support.Map,
     Key       => "BBBB",
     Exists    => Exists);

  Test.Check
    (Test_Context => TC,
     Test         => 17,
     Condition    => Called = False,
     Statement    => "Called = False");

  Test.Check
    (Test_Context => TC,
     Test         => 18,
     Condition    => Exists = False,
     Statement    => "Exists = False");

  Correct_Value := False;
  Correct_Key   := False;
  Expected_Key  := BHT_Support.Keys (1);

  Query
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1),
     Exists    => Exists);

  Test.Check
    (Test_Context => TC,
     Test         => 19,
     Condition    => Called,
     Statement    => "Called");

  Test.Check
    (Test_Context => TC,
     Test         => 20,
     Condition    => Exists,
     Statement    => "Exists");

  Test.Check
    (Test_Context => TC,
     Test         => 21,
     Condition    => Correct_Key,
     Statement    => "Correct_Key");

  Test.Check
    (Test_Context => TC,
     Test         => 23,
     Condition    => Correct_Value,
     Statement    => "Correct_Value");

end T_BHT_07;
