with BS_Support;
with CGBC;
with Test;

procedure T_BS_02 is
  package BS renames BS_Support.Natural_Stacks;

  TC        : Test.Context_t;
  Overflow  : Boolean;
  Underflow : Boolean;
  Value     : Natural;

  use type CGBC.Count_Type;
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_bs_02",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BS.Push
    (Container => BS_Support.Stack,
     New_Item  => 1,
     Overflow  => Overflow);

  Test.Check
    (Test_Context => TC,
     Test         => 102,
     Condition    => BS.Length (BS_Support.Stack) = 1,
     Statement    => "BS.Length (BS_Support.Stack) = 1");

  Test.Check
    (Test_Context => TC,
     Test         => 103,
     Condition    => not BS.Is_Empty (BS_Support.Stack),
     Statement    => "not BS.Is_Empty (BS_Support.Stack)");

  Test.Check
    (Test_Context => TC,
     Test         => 104,
     Condition    => Overflow = False,
     Statement    => "Overflow = False");

  BS.Push (BS_Support.Stack, 2, Overflow);
  pragma Assert (Overflow = False);
  BS.Push (BS_Support.Stack, 3, Overflow);
  pragma Assert (Overflow = False);
  BS.Push (BS_Support.Stack, 4, Overflow);
  pragma Assert (Overflow = False);

  Test.Check
    (Test_Context => TC,
     Test         => 105,
     Condition    => BS.Length (BS_Support.Stack) = 4,
     Statement    => "BS.Length (BS_Support.Stack) = 4");

  BS.Push
    (Container => BS_Support.Stack,
     New_Item  => 5,
     Overflow  => Overflow);

  Test.Check
    (Test_Context => TC,
     Test         => 106,
     Condition    => Overflow,
     Statement    => "Overflow");

  Test.Check
    (Test_Context => TC,
     Test         => 107,
     Condition    => BS.Length (BS_Support.Stack) = 4,
     Statement    => "BS.Length (BS_Support.Stack) = 4");

  BS.Pop
    (Container => BS_Support.Stack,
     Item      => Value,
     Underflow => Underflow);

  Test.Check
    (Test_Context => TC,
     Test         => 113,
     Condition    => Value = 4,
     Statement    => "Value = 4");

  Test.Check
    (Test_Context => TC,
     Test         => 108,
     Condition    => BS.Length (BS_Support.Stack) = 3,
     Statement    => "BS.Length (BS_Support.Stack) = 3");

  Test.Check
    (Test_Context => TC,
     Test         => 109,
     Condition    => Underflow = False,
     Statement    => "Underflow = False");

  BS.Pop (BS_Support.Stack, Value, Underflow);
  pragma Assert (Underflow = False);
  pragma Assert (Value = 3);
  BS.Pop (BS_Support.Stack, Value, Underflow);
  pragma Assert (Underflow = False);
  pragma Assert (Value = 2);
  BS.Pop (BS_Support.Stack, Value, Underflow);
  pragma Assert (Underflow = False);
  pragma Assert (Value = 1);

  -- Value unreferenced
  pragma Warnings (Off);
  BS.Pop
    (Container => BS_Support.Stack,
     Item      => Value,
     Underflow => Underflow);
  pragma Warnings (On);

  Test.Check
    (Test_Context => TC,
     Test         => 110,
     Condition    => BS.Length (BS_Support.Stack) = 0,
     Statement    => "BS.Length (BS_Support.Stack) = 0");

  Test.Check
    (Test_Context => TC,
     Test         => 111,
     Condition    => BS.Is_Empty (BS_Support.Stack),
     Statement    => "BS.Is_Empty (BS_Support.Stack)");

  Test.Check
    (Test_Context => TC,
     Test         => 112,
     Condition    => Underflow,
     Statement    => "Underflow");

  BS.Push (BS_Support.Stack, 1, Overflow);
  pragma Assert (Overflow = False);
  BS.Push (BS_Support.Stack, 2, Overflow);
  pragma Assert (Overflow = False);
  BS.Push (BS_Support.Stack, 3, Overflow);
  pragma Assert (Overflow = False);
  pragma Assert (BS.Length (BS_Support.Stack) = 3);

  BS.Clear (BS_Support.Stack);

  Test.Check
    (Test_Context => TC,
     Test         => 114,
     Condition    => BS.Is_Empty (BS_Support.Stack),
     Statement    => "BS.Is_Empty (BS_Support.Stack)");

end T_BS_02;
