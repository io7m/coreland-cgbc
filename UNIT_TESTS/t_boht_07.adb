with BOHT_Support;
with Test;

procedure T_BOHT_07 is
  TC : Test.Context_t;

  package BST4 renames BOHT_Support.String_Tables4;

  First_Cursor : BST4.Cursor;
  Last_Cursor  : BST4.Cursor;
  Found_Cursor : BST4.Cursor;
  Inserted     : Boolean;
  Deleted      : Boolean;

  use type BST4.Cursor;

begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_boht_07",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BST4.Insert
    (Container => BOHT_Support.Map,
     Key       => BOHT_Support.Keys (1),
     Element   => 1,
     Inserted  => Inserted);
  pragma Assert (Inserted);

  First_Cursor := BST4.First (BOHT_Support.Map);

  Test.Check
    (Test_Context => TC,
     Test         => 419,
     Condition    => First_Cursor /= BST4.No_Element,
     Statement    => "First_Cursor /= BST4.No_Element");

  Last_Cursor := BST4.Last (BOHT_Support.Map);

  Test.Check
    (Test_Context => TC,
     Test         => 420,
     Condition    => Last_Cursor /= BST4.No_Element,
     Statement    => "Last_Cursor /= BST4.No_Element");

  Found_Cursor := BST4.Find (BOHT_Support.Map, BOHT_Support.Keys (1));

  Test.Check
    (Test_Context => TC,
     Test         => 421,
     Condition    => Found_Cursor /= BST4.No_Element,
     Statement    => "Found_Cursor /= BST4.No_Element");

  Test.Check
    (Test_Context => TC,
     Test         => 422,
     Condition    => First_Cursor = Last_Cursor,
     Statement    => "First_Cursor = Last_Cursor");

  Test.Check
    (Test_Context => TC,
     Test         => 423,
     Condition    => Last_Cursor = Found_Cursor,
     Statement    => "Last_Cursor = Found_Cursor");

  Test.Check
    (Test_Context => TC,
     Test         => 425,
     Condition    => BST4.Valid_Cursor (BOHT_Support.Map, Found_Cursor),
     Statement    => "BST4.Valid_Cursor (BOHT_Support.Map, Found_Cursor)");

  Test.Check
    (Test_Context => TC,
     Test         => 424,
     Condition    => BOHT_Support.Map.Elements (Found_Cursor) = 1,
     Statement    => "BOHT_Support.Map.Elements (Found_Cursor) = 1");

  Test.Check
    (Test_Context => TC,
     Test         => 426,
     Condition    => not BST4.Valid_Cursor (BOHT_Support.Map, BST4.No_Element),
     Statement    => "not BST4.Valid_Cursor (BOHT_Support.Map, BST4.No_Element)");

  BST4.Insert
    (Container => BOHT_Support.Map,
     Key       => BOHT_Support.Keys (2),
     Element   => 1,
     Inserted  => Inserted);
  pragma Assert (Inserted);

  First_Cursor := BST4.First (BOHT_Support.Map);
  Last_Cursor  := BST4.Last (BOHT_Support.Map);

  Test.Check
    (Test_Context => TC,
     Test         => 427,
     Condition    => First_Cursor /= BST4.No_Element,
     Statement    => "First_Cursor /= BST4.No_Element");

  Test.Check
    (Test_Context => TC,
     Test         => 428,
     Condition    => Last_Cursor /= BST4.No_Element,
     Statement    => "Last_Cursor /= BST4.No_Element");

  Test.Check
    (Test_Context => TC,
     Test         => 429,
     Condition    => First_Cursor /= Last_Cursor,
     Statement    => "First_Cursor /= Last_Cursor");

  Test.Check
    (Test_Context => TC,
     Test         => 430,
     Condition    => BST4.Valid_Cursor (BOHT_Support.Map, First_Cursor),
     Statement    => "BST4.Valid_Cursor (BOHT_Support.Map, First_Cursor)");

  Test.Check
    (Test_Context => TC,
     Test         => 431,
     Condition    => BST4.Valid_Cursor (BOHT_Support.Map, Last_Cursor),
     Statement    => "BST4.Valid_Cursor (BOHT_Support.Map, Last_Cursor)");

  BST4.Delete
    (Container => BOHT_Support.Map,
     Key       => BOHT_Support.Keys (1),
     Deleted   => Deleted);
  pragma Assert (Deleted);

  BST4.Delete
    (Container => BOHT_Support.Map,
     Key       => BOHT_Support.Keys (2),
     Deleted   => Deleted);
  pragma Assert (Deleted);

  Test.Check
    (Test_Context => TC,
     Test         => 432,
     Condition    => not BST4.Valid_Cursor (BOHT_Support.Map, First_Cursor),
     Statement    => "not BST4.Valid_Cursor (BOHT_Support.Map, First_Cursor)");

  Test.Check
    (Test_Context => TC,
     Test         => 433,
     Condition    => not BST4.Valid_Cursor (BOHT_Support.Map, Last_Cursor),
     Statement    => "not BST4.Valid_Cursor (BOHT_Support.Map, Last_Cursor)");

end T_BOHT_07;
