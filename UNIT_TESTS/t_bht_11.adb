with BHT_Support;
with CGBC;
with Test;

procedure T_BHT_11 is
  package BST4 renames BHT_Support.String_Tables4;

  TC              : Test.Context_t;
  Expected_Value  : constant Natural := 23;
  Retrieved_Value : Natural;
  Exists          : Boolean;
  Inserted        : Boolean;

  use type CGBC.Count_Type;
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_bht_11",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BST4.Exclude
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1));

  Test.Check
    (Test_Context => TC,
     Test         => 40,
     Condition    => BST4.Is_Empty (BHT_Support.Map),
     Statement    => "BST4.Is_Empty (BHT_Support.Map)");

  BST4.Insert
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1),
     Element   => Expected_Value,
     Inserted  => Inserted);
  pragma Assert (Inserted);

  BST4.Exclude
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (2));

  Test.Check
    (Test_Context => TC,
     Test         => 41,
     Condition    => not BST4.Is_Empty (BHT_Support.Map),
     Statement    => "not BST4.Is_Empty (BHT_Support.Map)");

  BST4.Element
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1),
     Element   => Retrieved_Value,
     Exists    => Exists);

  Test.Check
    (Test_Context => TC,
     Test         => 43,
     Condition    => Exists,
     Statement    => "Exists");

  Test.Check
    (Test_Context => TC,
     Test         => 42,
     Condition    => Retrieved_Value = Expected_Value,
     Statement    => "Retrieved_Value = Expected_Value");

  BST4.Exclude
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1));

  -- Retrieved_Value unreferenced.
  pragma Warnings (Off);
  BST4.Element
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1),
     Element   => Retrieved_Value,
     Exists    => Exists);
  pragma Warnings (On);

  Test.Check
    (Test_Context => TC,
     Test         => 44,
     Condition    => Exists = False,
     Statement    => "Exists = False");

  Test.Check
    (Test_Context => TC,
     Test         => 45,
     Condition    => BST4.Length (BHT_Support.Map) = 0,
     Statement    => "BST4.Length (BHT_Support.Map) = 0");

end T_BHT_11;
