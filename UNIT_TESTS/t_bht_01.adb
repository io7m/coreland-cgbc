with BHT_Support;
with CGBC;
with Test;

procedure T_BHT_01 is
  TC : Test.Context_t;

  package BST4 renames BHT_Support.String_Tables4;

  use type CGBC.Count_Type;

begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_bht_01",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");
  Test.Check
    (Test_Context => TC,
     Test         => 1,
     Condition    => BST4.Length (BHT_Support.Map) = 0,
     Statement    => "BST4.Length (BHT_Support.Map) = 0");
end T_BHT_01;
