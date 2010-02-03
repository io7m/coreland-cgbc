with BHT_Support;
with Test;

procedure T_BHT_09 is
  TC : Test.Context_t;

  package BST4 renames BHT_Support.String_Tables4;

  Correct_Value  : Boolean;
  Exists         : Boolean;
  Original_Value : constant Natural := 1;
  Changed_Value  : constant Natural := 13;
  Inserted       : Boolean;

  pragma Warnings (Off);
  procedure Process
    (Key  : BHT_Support.Key_Type4;
     Data : Natural) is
  pragma Warnings (On);
  begin
    Correct_Value := Data = Changed_Value;
  end Process;

  procedure Query is new BST4.Query_Element (Process);
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_bht_09",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BST4.Insert
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1),
     Element   => Original_Value,
     Inserted  => Inserted);
  pragma Assert (Inserted);

  BST4.Replace_Element
    (Container => BHT_Support.Map,
     Key       => "BBBB",
     Element   => 0,
     Exists    => Exists);

  Test.Check
    (Test_Context => TC,
     Test         => 30,
     Condition    => Exists = False,
     Statement    => "Exists = False");

  BST4.Replace_Element
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1),
     Element   => Changed_Value,
     Exists    => Exists);

  Test.Check
    (Test_Context => TC,
     Test         => 31,
     Condition    => Exists,
     Statement    => "Exists");

  Correct_Value := False;

  Query
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1),
     Exists    => Exists);

  Test.Check
    (Test_Context => TC,
     Test         => 32,
     Condition    => Exists,
     Statement    => "Exists");

  Test.Check
    (Test_Context => TC,
     Test         => 33,
     Condition    => Correct_Value,
     Statement    => "Correct_Value");

end T_BHT_09;
