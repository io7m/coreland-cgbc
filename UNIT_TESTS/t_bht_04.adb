with BHT_Support;
with Test;

procedure T_BHT_04 is
  package BST4 renames BHT_Support.String_Tables4;

  TC       : Test.Context_t;
  Inserted : Boolean;
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_bht_04",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BST4.Insert
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1),
     Element   => 1,
     Inserted  => Inserted);
  pragma Assert (Inserted);
  BST4.Insert
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (2),
     Element   => 2,
     Inserted  => Inserted);
  pragma Assert (Inserted);
  BST4.Insert
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (3),
     Element   => 3,
     Inserted  => Inserted);
  pragma Assert (Inserted);
  BST4.Insert
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (4),
     Element   => 4,
     Inserted  => Inserted);
  pragma Assert (Inserted);

  BST4.Insert
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (5),
     Element   => 5,
     Inserted  => Inserted);

  Test.Check
    (Test_Context => TC,
     Test         => 8,
     Condition    => Inserted = False,
     Statement    => "Inserted = False");

end T_BHT_04;
