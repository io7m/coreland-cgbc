with BHT_Support;
with Test;

procedure T_BHT_15 is
  package BST4 renames BHT_Support.String_Tables4;

  TC       : Test.Context_t;
  Calls    : Natural;
  Deleted  : Boolean;
  Inserted : Boolean;

  pragma Warnings (Off);
  procedure Process (Key : in BHT_Support.Key_Type4) is
  pragma Warnings (On);
  begin
    Calls := Calls + 1;
  end Process;

  procedure Query_All is new BST4.Query_All_Keys (Process);

begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_bht_15",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  Calls := 0;

  Query_All (BHT_Support.Map);

  Test.Check
    (Test_Context => TC,
     Test         => 62,
     Condition    => Calls = 0,
     Statement    => "Calls = 0");

  BST4.Insert
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1),
     Element   => 1,
     Inserted  => Inserted);
  pragma Assert (Inserted);

  Calls := 0;

  Query_All (BHT_Support.Map);

  Test.Check
    (Test_Context => TC,
     Test         => 63,
     Condition    => Calls = 1,
     Statement    => "Calls = 1");

  BST4.Insert
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (2),
     Element   => 2,
     Inserted  => Inserted);
  pragma Assert (Inserted);

  Calls := 0;

  Query_All (BHT_Support.Map);

  Test.Check
    (Test_Context => TC,
     Test         => 64,
     Condition    => Calls = 2,
     Statement    => "Calls = 2");

  BST4.Delete
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1),
     Deleted   => Deleted);
  pragma Assert (Deleted);

  Calls := 0;

  Query_All (BHT_Support.Map);

  Test.Check
    (Test_Context => TC,
     Test         => 65,
     Condition    => Calls = 1,
     Statement    => "Calls = 1");

end T_BHT_15;
