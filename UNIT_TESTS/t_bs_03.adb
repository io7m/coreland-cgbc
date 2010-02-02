with BS_Support;
with CGBC;
with Test;

procedure T_BS_03 is
  package BS renames BS_Support.Natural_Stacks;

  TC             : Test.Context_t;
  Overflow       : Boolean;
  Underflow      : Boolean;
  Correct_Value  : Boolean;
  Expected_Value : Natural;
  Called         : Boolean;

  procedure Process
    (Element : in Natural) is
  begin
    Called        := True;
    Correct_Value := Expected_Value = Element;
  end Process;

  procedure Peek is new BS.Peek (Process);

  use type CGBC.Count_Type;
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_bs_03",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  Expected_Value := 17;

  BS.Push
    (Container => BS_Support.Stack,
     New_Item  => Expected_Value,
     Overflow  => Overflow);
  pragma Assert (Overflow = False);

  Called := False;

  Peek (BS_Support.Stack, Underflow);

  Test.Check
    (Test_Context => TC,
     Test         => 115,
     Condition    => Called,
     Statement    => "Called");

  Test.Check
    (Test_Context => TC,
     Test         => 116,
     Condition    => Correct_Value,
     Statement    => "Correct_Value");

  Test.Check
    (Test_Context => TC,
     Test         => 119,
     Condition    => Underflow = False,
     Statement    => "Underflow = False");

  BS.Clear (BS_Support.Stack);
  pragma Assert (BS.Is_Empty (BS_Support.Stack));

  Called := False;

  Peek (BS_Support.Stack, Underflow);

  Test.Check
    (Test_Context => TC,
     Test         => 117,
     Condition    => Underflow,
     Statement    => "Underflow");

  Test.Check
    (Test_Context => TC,
     Test         => 118,
     Condition    => Called = False,
     Statement    => "Called = False");

end T_BS_03;
