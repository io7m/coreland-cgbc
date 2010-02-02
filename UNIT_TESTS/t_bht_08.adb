with BHT_Support;
with Test;

procedure T_BHT_08 is
  TC : Test.Context_t;

  package BST4 renames BHT_Support.String_Tables4;

  Called         : Boolean;
  Correct_Value  : Boolean;
  Correct_Key    : Boolean;
  Expected_Key   : BHT_Support.Key_Type4 := "ZZZZ";
  Exists         : Boolean;
  Expected_Value : constant Natural := 1;
  Changed_Value  : constant Natural := 13;
  Inserted       : Boolean;

  procedure Process
    (Key  : in     BHT_Support.Key_Type4;
     Data : in out Natural) is
  begin
    Called        := True;
    Correct_Key   := Key = Expected_Key;
    Correct_Value := Data = Expected_Value;
    Data          := Changed_Value;
  end Process;

  procedure Modify is new BST4.Modify_Element (Process);

begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_bht_08",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BST4.Insert
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1),
     Element   => Expected_Value,
     Inserted  => Inserted);
  pragma Assert (Inserted);

  Called := False;

  Modify
    (Container => BHT_Support.Map,
     Key       => "BBBB",
     Exists    => Exists);

  Test.Check
    (Test_Context => TC,
     Test         => 24,
     Condition    => Called = False,
     Statement    => "Called = False");

  Test.Check
    (Test_Context => TC,
     Test         => 25,
     Condition    => Exists = False,
     Statement    => "Exists = False");

  Correct_Value := False;
  Correct_Key   := False;
  Expected_Key  := BHT_Support.Keys (1);

  Modify
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1),
     Exists    => Exists);

  Test.Check
    (Test_Context => TC,
     Test         => 26,
     Condition    => Called,
     Statement    => "Called");

  Test.Check
    (Test_Context => TC,
     Test         => 27,
     Condition    => Exists,
     Statement    => "Exists");

  Test.Check
    (Test_Context => TC,
     Test         => 28,
     Condition    => Correct_Key,
     Statement    => "Correct_Key");

  Test.Check
    (Test_Context => TC,
     Test         => 29,
     Condition    => Correct_Value,
     Statement    => "Correct_Value");

end T_BHT_08;
