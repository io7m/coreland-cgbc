generic
  type Key_Type     is private;
  type Element_Type is private;

  with function Hash
    (Key : in Key_Type) return Hash_Type;

  with function Equivalent_Keys
    (Left  : in Key_Type;
     Right : in Key_Type) return Boolean;

package CGBC.Bounded_Hashed_Maps is
  pragma Preelaborate (CGBC.Bounded_Hashed_Maps);

  type Map (Capacity : Count_Type) is tagged private;

  procedure Clear (Container : in out Map);

  function Contains
    (Container : in Map;
     Key       : in Key_Type) return Boolean;

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

  procedure Element
    (Container : in     Map;
     Key       : in     Key_Type;
     Element   :    out Element_Type;
     Exists    :    out Boolean);

  procedure Exclude
    (Container : in out Map;
     Key       : in     Key_Type);

  function Length (Container : in Map) return Count_Type;

  function Is_Empty (Container : in Map) return Boolean;

  generic
    with procedure Process
      (Key     : in Key_Type;
       Element : in Element_Type);

  procedure Query_Element
    (Container : in     Map;
     Key       : in     Key_Type;
     Exists    :    out Boolean);

  generic
    with procedure Process
      (Key     : in Key_Type;
       Element : in Element_Type);

  procedure Query_All_Elements (Container : in Map);

  procedure Replace_Element
    (Container : in out Map;
     Key       : in     Key_Type;
     Element   : in     Element_Type;
     Exists    :    out Boolean);

  generic
    with procedure Process
      (Key     : in     Key_Type;
       Element : in out Element_Type);

  procedure Modify_Element
    (Container : in out Map;
     Key       : in     Key_Type;
     Exists    :    out Boolean);

  generic
    with procedure Process
      (Key     : in     Key_Type;
       Element : in out Element_Type);

  procedure Modify_All_Elements
    (Container : in out Map);

private

  type Bucket_State_Type is (Empty, Used, Deleted);

  type Bucket_Type is record
    State : Bucket_State_Type := Empty;
    Data  : Element_Type;
    Key   : Key_Type;
  end record;

  type Bucket_Table_Type is array (Count_Type range <>) of Bucket_Type;

  type Map (Capacity : Count_Type) is tagged record
    Used    : Count_Type := 0;
    Buckets : Bucket_Table_Type (1 .. Capacity);
  end record;

end CGBC.Bounded_Hashed_Maps;
