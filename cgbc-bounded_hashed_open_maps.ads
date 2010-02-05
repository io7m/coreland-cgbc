generic
  type Key_Type     is private;
  type Element_Type is private;

  with function Hash
    (Key : in Key_Type) return Hash_Type;

  with function Equivalent_Keys
    (Left  : in Key_Type;
     Right : in Key_Type) return Boolean;

package CGBC.Bounded_Hashed_Open_Maps is
  pragma Preelaborate (CGBC.Bounded_Hashed_Open_Maps);

  subtype Cursor is Count_Type;

  type Map_Elements is array (Count_Type range <>) of Element_Type;

  type Map_Keys (Capacity : Count_Type) is private;

  type Map (Capacity : Count_Type) is tagged record
    Elements : Map_Elements (1 .. Capacity);
    Keys     : Map_Keys (Capacity);
  end record;

  No_Element : constant Cursor;

  procedure Clear (Container : in out Map);

  function Contains
    (Container : in Map;
     Key       : in Key_Type) return Boolean;

  function Find
    (Container : in Map;
     Key       : in Key_Type) return Cursor;

  function First
    (Container : in Map) return Cursor;

  function Last
    (Container : in Map) return Cursor;

  function Next
    (Container : in Map;
     Position  : in Cursor) return Cursor;

  procedure Next
    (Container : in     Map;
     Position  : in out Cursor);

  procedure Insert
    (Container : in out Map;
     Key       : in     Key_Type;
     Element   : in     Element_Type;
     Inserted  :    out Boolean);

  procedure Include
    (Container : in out Map;
     Key       : in     Key_Type;
     Element   : in     Element_Type;
     Included  :    out Boolean);

  procedure Delete
    (Container : in out Map;
     Key       : in     Key_Type;
     Deleted   :    out Boolean);

  procedure Exclude
    (Container : in out Map;
     Key       : in     Key_Type);

  function Length (Container : in Map) return Count_Type;

  function Is_Empty (Container : in Map) return Boolean;

  procedure Replace_Element
    (Container : in out Map;
     Key       : in     Key_Type;
     Element   : in     Element_Type;
     Exists    :    out Boolean);

  function Valid_Cursor
    (Container : in Map;
     Position  : in Cursor) return Boolean;

private

  type Bucket_State_Type is (Empty, Used, Deleted);

  type Bucket_Type is record
    State : Bucket_State_Type := Empty;
    Key   : Key_Type;
  end record;

  type Bucket_Table_Type is array (Count_Type range <>) of Bucket_Type;

  type Map_Keys (Capacity : Count_Type) is tagged record
    Used    : Count_Type := 0;
    Buckets : Bucket_Table_Type (1 .. Capacity);
  end record;

  No_Element : constant Cursor := 0;

end CGBC.Bounded_Hashed_Open_Maps;
