with BOHT_Support;
with Test;

procedure T_BOHT_03 is
  package BST4 renames BOHT_Support.String_Tables4;

  TC       : Test.Context_t;
  Inserted : Boolean;

begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_boht_03",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BST4.Insert
    (Container => BOHT_Support.Map,
     Key       => BOHT_Support.Keys (1),
     Element   => 1,
     Inserted  => Inserted);
  pragma Assert (Inserted);

  BST4.Insert
    (Container => BOHT_Support.Map,
     Key       => BOHT_Support.Keys (1),
     Element   => 1,
     Inserted  => Inserted);

  Test.Check
    (Test_Context => TC,
     Test         => 408,
     Condition    => Inserted = False,
     Statement    => "Inserted = False");

end T_BOHT_03;
