with CGBC;
with BHT_Support;
with Test;

procedure T_BHT_02 is
  package BST4 renames BHT_Support.String_Tables4;

  TC       : Test.Context_t;
  Inserted : Boolean;

  use type CGBC.Count_Type;
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_bht_02",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BST4.Insert
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1),
     Element   => 1,
     Inserted  => Inserted);

  Test.Check
    (Test_Context => TC,
     Test         => 2,
     Condition    => Inserted,
     Statement    => "Inserted");

  Test.Check
    (Test_Context => TC,
     Test         => 3,
     Condition    => BST4.Contains (BHT_Support.Map, BHT_Support.Keys (1)),
     Statement    => "BST4.Contains (BHT_Support.Map, BHT_Support.Keys (1))");

  Test.Check
    (Test_Context => TC,
     Test         => 4,
     Condition    => BST4.Length (BHT_Support.Map) = 1,
     Statement    => "BST4.Length (BHT_Support.Map) = 1");

  Test.Check
    (Test_Context => TC,
     Test         => 34,
     Condition    => not BST4.Is_Empty (BHT_Support.Map),
     Statement    => "not BST4.Is_Empty (BHT_Support.Map)");

  BST4.Clear (BHT_Support.Map);

  Test.Check
    (Test_Context => TC,
     Test         => 5,
     Condition    => BST4.Length (BHT_Support.Map) = 0,
     Statement    => "BST4.Length (BHT_Support.Map) = 0");

  Test.Check
    (Test_Context => TC,
     Test         => 35,
     Condition    => BST4.Is_Empty (BHT_Support.Map),
     Statement    => "BST4.Is_Empty (BHT_Support.Map)");

  Test.Check
    (Test_Context => TC,
     Test         => 6,
     Condition    => BST4.Contains (BHT_Support.Map, BHT_Support.Keys (1)) = False,
     Statement    => "BST4.Contains (BHT_Support.Map, BHT_Support.Keys (1)) = False");

end T_BHT_02;
