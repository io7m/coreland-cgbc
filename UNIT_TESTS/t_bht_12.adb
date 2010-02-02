with BHT_Support;
with CGBC;
with Test;

procedure T_BHT_12 is
  package BST4 renames BHT_Support.String_Tables4;

  TC              : Test.Context_t;
  Expected_Value  : constant Natural := 23;
  Replaced_Value  : constant Natural := 17;
  Retrieved_Value : Natural;
  Exists          : Boolean;
  Included        : Boolean;

  use type CGBC.Count_Type;

begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_bht_12",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BST4.Include
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1),
     Element   => Expected_Value,
     Included  => Exists);

  Test.Check
    (Test_Context => TC,
     Test         => 46,
     Condition    => not BST4.Is_Empty (BHT_Support.Map),
     Statement    => "not BST4.Is_Empty (BHT_Support.Map)");

  Test.Check
    (Test_Context => TC,
     Test         => 51,
     Condition    => Exists,
     Statement    => "Exists");

  BST4.Element
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1),
     Element   => Retrieved_Value,
     Exists    => Exists);

  Test.Check
    (Test_Context => TC,
     Test         => 47,
     Condition    => Exists,
     Statement    => "Exists");

  Test.Check
    (Test_Context => TC,
     Test         => 48,
     Condition    => Retrieved_Value = Expected_Value,
     Statement    => "Retrieved_Value = Expected_Value");

  BST4.Include
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1),
     Element   => Replaced_Value,
     Included  => Included);

  Test.Check
    (Test_Context => TC,
     Test         => 49,
     Condition    => Included,
     Statement    => "Included");

  BST4.Element
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1),
     Element   => Retrieved_Value,
     Exists    => Exists);

  Test.Check
    (Test_Context => TC,
     Test         => 53,
     Condition    => Exists,
     Statement    => "Exists");

  Test.Check
    (Test_Context => TC,
     Test         => 52,
     Condition    => BST4.Length (BHT_Support.Map) = 1,
     Statement    => "BST4.Length (BHT_Support.Map) = 1");

  Test.Check
    (Test_Context => TC,
     Test         => 50,
     Condition    => Retrieved_Value = Replaced_Value,
     Statement    => "Retrieved_Value = Replaced_Value");

end T_BHT_12;
