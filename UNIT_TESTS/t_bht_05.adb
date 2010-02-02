with BHT_Support;
with CGBC;
with Test;

procedure T_BHT_05 is
  package BST4 renames BHT_Support.String_Tables4;

  use type CGBC.Count_Type;

  TC       : Test.Context_t;
  Deleted  : Boolean;
  Inserted : Boolean;
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_bht_05",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BST4.Delete
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1),
     Deleted   => Deleted);

  Test.Check
    (Test_Context => TC,
     Test         => 9,
     Condition    => Deleted = False,
     Statement    => "Deleted = False");

  Test.Check
    (Test_Context => TC,
     Test         => 10,
     Condition    => BST4.Length (BHT_Support.Map) = 0,
     Statement    => "BST4.Length (BHT_Support.Map) = 0");

  BST4.Insert
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1),
     Element   => 1,
     Inserted  => Inserted);
  pragma Assert (Inserted);

  BST4.Delete
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (2),
     Deleted   => Deleted);

  Test.Check
    (Test_Context => TC,
     Test         => 11,
     Condition    => Deleted = False,
     Statement    => "Deleted = False");

  BST4.Delete
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1),
     Deleted   => Deleted);

  Test.Check
    (Test_Context => TC,
     Test         => 12,
     Condition    => Deleted,
     Statement    => "Deleted");

  Test.Check
    (Test_Context => TC,
     Test         => 13,
     Condition    => BST4.Length (BHT_Support.Map) = 0,
     Statement    => "BST4.Length (BHT_Support.Map) = 0");

  Test.Check
    (Test_Context => TC,
     Test         => 14,
     Condition    => BST4.Contains (BHT_Support.Map, BHT_Support.Keys (1)) = False,
     Statement    => "BST4.Contains (BHT_Support.Map, BHT_Support.Keys (1)) = False");

end T_BHT_05;
