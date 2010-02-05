with BOHT_Support;
with CGBC;
with Test;

procedure T_BOHT_01 is
  TC : Test.Context_t;

  package BST4 renames BOHT_Support.String_Tables4;

  use type CGBC.Count_Type;

begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_boht_01",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");
  Test.Check
    (Test_Context => TC,
     Test         => 400,
     Condition    => BST4.Length (BOHT_Support.Map) = 0,
     Statement    => "BST4.Length (BOHT_Support.Map) = 0");
end T_BOHT_01;
