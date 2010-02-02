with BS_Support;
with CGBC;
with Test;

procedure T_BS_01 is
  package BS renames BS_Support.Natural_Stacks;

  TC : Test.Context_t;

  use type CGBC.Count_Type;
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_bs_01",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");
  Test.Check
    (Test_Context => TC,
     Test         => 100,
     Condition    => BS.Length (BS_Support.Stack) = 0,
     Statement    => "BS.Length (BS_Support.Stack) = 0");
  Test.Check
    (Test_Context => TC,
     Test         => 101,
     Condition    => BS.Is_Empty (BS_Support.Stack),
     Statement    => "BS.Is_Empty (BS_Support.Stack)");
end T_BS_01;
