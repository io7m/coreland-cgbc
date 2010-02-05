with BOHT_Support;
with CGBC;
with Test;

procedure T_BOHT_05 is
  package BST4 renames BOHT_Support.String_Tables4;

  use type CGBC.Count_Type;

  TC       : Test.Context_t;
  Deleted  : Boolean;
  Inserted : Boolean;
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_boht_05",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BST4.Delete
    (Container => BOHT_Support.Map,
     Key       => BOHT_Support.Keys (1),
     Deleted   => Deleted);

  Test.Check
    (Test_Context => TC,
     Test         => 410,
     Condition    => Deleted = False,
     Statement    => "Deleted = False");

  Test.Check
    (Test_Context => TC,
     Test         => 411,
     Condition    => BST4.Length (BOHT_Support.Map) = 0,
     Statement    => "BST4.Length (BOHT_Support.Map) = 0");

  BST4.Insert
    (Container => BOHT_Support.Map,
     Key       => BOHT_Support.Keys (1),
     Element   => 1,
     Inserted  => Inserted);
  pragma Assert (Inserted);

  BST4.Delete
    (Container => BOHT_Support.Map,
     Key       => BOHT_Support.Keys (2),
     Deleted   => Deleted);

  Test.Check
    (Test_Context => TC,
     Test         => 412,
     Condition    => Deleted = False,
     Statement    => "Deleted = False");

  BST4.Delete
    (Container => BOHT_Support.Map,
     Key       => BOHT_Support.Keys (1),
     Deleted   => Deleted);

  Test.Check
    (Test_Context => TC,
     Test         => 413,
     Condition    => Deleted,
     Statement    => "Deleted");

  Test.Check
    (Test_Context => TC,
     Test         => 414,
     Condition    => BST4.Length (BOHT_Support.Map) = 0,
     Statement    => "BST4.Length (BOHT_Support.Map) = 0");

  Test.Check
    (Test_Context => TC,
     Test         => 415,
     Condition    => BST4.Contains (BOHT_Support.Map, BOHT_Support.Keys (1)) = False,
     Statement    => "BST4.Contains (BOHT_Support.Map, BOHT_Support.Keys (1)) = False");

end T_BOHT_05;
