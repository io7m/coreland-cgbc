with BHT_Support;
with Test;

procedure T_BHT_14 is
  package BST4 renames BHT_Support.String_Tables4;

  TC       : Test.Context_t;
  Calls    : Natural;
  Deleted  : Boolean;
  Inserted : Boolean;

  procedure Process
    (Key  : in     BHT_Support.Key_Type4;
     Data : in out Natural) is
  begin
    Calls := Calls + 1;
  end Process;

  procedure Modify_All is new BST4.Modify_All_Elements (Process);

begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_bht_14",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  Calls := 0;

  Modify_All (BHT_Support.Map);

  Test.Check
    (Test_Context => TC,
     Test         => 58,
     Condition    => Calls = 0,
     Statement    => "Calls = 0");

  BST4.Insert
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1),
     Element   => 1,
     Inserted  => Inserted);
  pragma Assert (Inserted);

  Calls := 0;

  Modify_All (BHT_Support.Map);

  Test.Check
    (Test_Context => TC,
     Test         => 59,
     Condition    => Calls = 1,
     Statement    => "Calls = 1");

  BST4.Insert
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (2),
     Element   => 2,
     Inserted  => Inserted);
  pragma Assert (Inserted);

  Calls := 0;

  Modify_All (BHT_Support.Map);

  Test.Check
    (Test_Context => TC,
     Test         => 60,
     Condition    => Calls = 2,
     Statement    => "Calls = 2");

  BST4.Delete
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1),
     Deleted   => Deleted);
  pragma Assert (Deleted);

  Calls := 0;

  Modify_All (BHT_Support.Map);

  Test.Check
    (Test_Context => TC,
     Test         => 61,
     Condition    => Calls = 1,
     Statement    => "Calls = 1");

end T_BHT_14;
