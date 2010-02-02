with BHT_Support;
with Test;

procedure T_BHT_10 is
  package BST4 renames BHT_Support.String_Tables4;

  TC              : Test.Context_t;
  Expected_Value  : constant Natural := 17;
  Retrieved_Value : Natural := 0;
  Exists          : Boolean;
  Inserted        : Boolean;

begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_bht_10",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

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
     Test         => 39,
     Condition    => Exists = False,
     Statement    => "Exists = False");

  BST4.Insert
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (2),
     Element   => Expected_Value,
     Inserted  => Inserted);
  pragma Assert (Inserted);

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
     Test         => 36,
     Condition    => Exists = False,
     Statement    => "Exists = False");

  BST4.Insert
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1),
     Element   => Expected_Value,
     Inserted  => Inserted);
  pragma Assert (Inserted);

  BST4.Element
    (Container => BHT_Support.Map,
     Key       => BHT_Support.Keys (1),
     Element   => Retrieved_Value,
     Exists    => Exists);

  Test.Check
    (Test_Context => TC,
     Test         => 37,
     Condition    => Exists,
     Statement    => "Exists");

  Test.Check
    (Test_Context => TC,
     Test         => 38,
     Condition    => Retrieved_Value = Expected_Value,
     Statement    => "Retrieved_Value = Expected_Value");

end T_BHT_10;
