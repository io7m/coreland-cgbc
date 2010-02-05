with BOHT_Support;
with CGBC.Bounded_Hashed_Maps;
with CGBC;
with Test;

procedure T_BOHT_06 is
  TC : Test.Context_t;

  use type CGBC.Hash_Type;

  --
  -- Deliberately hash all keys to the first index, to
  -- invoke linear probing.
  --

  pragma Warnings (Off);
  function First_Index_Hash (Key : in BOHT_Support.Key_Type4)
    return CGBC.Hash_Type is
  pragma Warnings (On);
  begin
    return 1;
  end First_Index_Hash;

  package BST4 is new CGBC.Bounded_Hashed_Maps
    (Key_Type        => BOHT_Support.Key_Type4,
     Element_Type    => Natural,
     Hash            => First_Index_Hash,
     Equivalent_Keys => "=");

  Map      : BST4.Map (4);
  Deleted  : Boolean;
  Inserted : Boolean;

begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "t_boht_06",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  BST4.Insert (Map, "AAAA", 1, Inserted);
  pragma Assert (Inserted);
  BST4.Insert (Map, "BBBB", 2, Inserted);
  pragma Assert (Inserted);
  BST4.Insert (Map, "CCCC", 3, Inserted);
  pragma Assert (Inserted);

  BST4.Delete (Map, "BBBB", Deleted);
  pragma Assert (Deleted);

  Test.Check
    (Test_Context => TC,
     Test         => 416,
     Condition    => BST4.Contains (Map, "AAAA"),
     Statement    => "BST4.Contains (Map, ""AAAA"")");

  Test.Check
    (Test_Context => TC,
     Test         => 417,
     Condition    => BST4.Contains (Map, "CCCC"),
     Statement    => "BST4.Contains (Map, ""CCCC"")");

  Test.Check
    (Test_Context => TC,
     Test         => 418,
     Condition    => not BST4.Contains (Map, "BBBB"),
     Statement    => "not BST4.Contains (Map, ""BBBB"")");

end T_BOHT_06;
