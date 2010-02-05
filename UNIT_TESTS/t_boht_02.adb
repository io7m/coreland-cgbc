with CGBC;
with BOHT_Support;
with Test;

procedure T_BOHT_02 is
  package BST4 renames BOHT_Support.String_Tables4;

  TC       : Test.Context_t;
  Inserted : Boolean;

  use type CGBC.Count_Type;
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_boht_02",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BST4.Insert
    (Container => BOHT_Support.Map,
     Key       => BOHT_Support.Keys (1),
     Element   => 1,
     Inserted  => Inserted);

  Test.Check
    (Test_Context => TC,
     Test         => 401,
     Condition    => Inserted,
     Statement    => "Inserted");

  Test.Check
    (Test_Context => TC,
     Test         => 402,
     Condition    => BST4.Contains (BOHT_Support.Map, BOHT_Support.Keys (1)),
     Statement    => "BST4.Contains (BOHT_Support.Map, BOHT_Support.Keys (1))");

  Test.Check
    (Test_Context => TC,
     Test         => 403,
     Condition    => BST4.Length (BOHT_Support.Map) = 1,
     Statement    => "BST4.Length (BOHT_Support.Map) = 1");

  Test.Check
    (Test_Context => TC,
     Test         => 404,
     Condition    => not BST4.Is_Empty (BOHT_Support.Map),
     Statement    => "not BST4.Is_Empty (BOHT_Support.Map)");

  BST4.Clear (BOHT_Support.Map);

  Test.Check
    (Test_Context => TC,
     Test         => 405,
     Condition    => BST4.Length (BOHT_Support.Map) = 0,
     Statement    => "BST4.Length (BOHT_Support.Map) = 0");

  Test.Check
    (Test_Context => TC,
     Test         => 406,
     Condition    => BST4.Is_Empty (BOHT_Support.Map),
     Statement    => "BST4.Is_Empty (BOHT_Support.Map)");

  Test.Check
    (Test_Context => TC,
     Test         => 407,
     Condition    => BST4.Contains (BOHT_Support.Map, BOHT_Support.Keys (1)) = False,
     Statement    => "BST4.Contains (BOHT_Support.Map, BOHT_Support.Keys (1)) = False");

end T_BOHT_02;
