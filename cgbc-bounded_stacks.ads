generic
  type Element_Type is private;

package CGBC.Bounded_Stacks is
  pragma Preelaborate (CGBC.Bounded_Stacks);

  type Stack (Capacity : Count_Type) is tagged private;

  procedure Clear (Container : in out Stack);

  procedure Push
    (Container : in out Stack;
     New_Item  : in     Element_Type;
     Overflow  :    out Boolean);

  procedure Pop
    (Container : in out Stack;
     Item      :    out Element_Type;
     Underflow :    out Boolean);

  function Length (Container : in Stack) return Count_Type;

  function Is_Empty (Container : in Stack) return Boolean;

  generic
    with procedure Process
      (Element : in Element_Type);

  procedure Peek
    (Container : in     Stack;
     Underflow :    out Boolean);

private

  type Element_Array_Type is array (Count_Type range <>) of Element_Type;

  type Stack (Capacity : Count_Type) is tagged record
    Used     : Count_Type := 0;
    Elements : Element_Array_Type (1 .. Capacity);
  end record;

end CGBC.Bounded_Stacks;
