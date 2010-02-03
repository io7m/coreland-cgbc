with Ada.Strings;

generic
  type Character_Type is (<>);
  type String_Type    is array (Positive range <>) of Character_Type;

package CGBC.Bounded_Generic_Strings is
  pragma Preelaborate (CGBC.Bounded_Generic_Strings);

  type Bounded_String (Capacity : Positive) is private;

  --
  -- Initializations
  --

  function To_Bounded_String
    (Source : in String_Type;
     Drop   : in Ada.Strings.Truncation := Ada.Strings.Error)
    return Bounded_String;

  function To_String (Source : in Bounded_String) return String_Type;

  procedure Set_Bounded_String
    (Target :    out Bounded_String;
     Source : in     String_Type;
     Drop   : in     Ada.Strings.Truncation := Ada.Strings.Error);

  --
  -- Append
  --

  function Append
    (Source   : in Bounded_String;
     New_Item : in Bounded_String;
     Drop     : in Ada.Strings.Truncation := Ada.Strings.Error) return Bounded_String;

  function Append
    (Source   : in Bounded_String;
     New_Item : in String_Type;
     Drop     : in Ada.Strings.Truncation := Ada.Strings.Error) return Bounded_String;

  function Append
    (Source   : in String_Type;
     New_Item : in Bounded_String;
     Drop     : in Ada.Strings.Truncation := Ada.Strings.Error) return Bounded_String;

  function Append
    (Source   : in Bounded_String;
     New_Item : in Character_Type;
     Drop     : in Ada.Strings.Truncation := Ada.Strings.Error) return Bounded_String;

  procedure Append
    (Source   : in out Bounded_String;
     New_Item : in     Bounded_String;
     Drop     : in     Ada.Strings.Truncation := Ada.Strings.Error);

  procedure Append
    (Source   : in out Bounded_String;
     New_Item : in     String_Type;
     Drop     : in     Ada.Strings.Truncation := Ada.Strings.Error);

  --
  -- Truncate
  --

  procedure Truncate (Target : out Bounded_String);

  --
  -- Access
  --

  function Element
    (Source : in Bounded_String;
     Index  : in Positive) return Character_Type;

  procedure Replace_Element
    (Source : in out Bounded_String;
     Index  : in     Positive;
     By     : in     Character_Type);

  function Slice
    (Source : in Bounded_String;
     Low    : in Positive;
     High   : in Positive) return String_Type;

  function Bounded_Slice
    (Source : in Bounded_String;
     Low    : in Positive;
     High   : in Positive) return Bounded_String;

  --
  -- Lengths
  --

  function Length (Source : in Bounded_String) return Natural;

  function Maximum_Length (Source : in Bounded_String) return Natural;

  --
  -- Comparison
  --

  function Equivalent
    (Left  : in Bounded_String;
     Right : in Bounded_String) return Boolean;

  function "="
    (Left  : in Bounded_String;
     Right : in Bounded_String) return Boolean
    renames Equivalent;

private

  type Bounded_String (Capacity : Positive) is record
    Data      : String_Type (1 .. Capacity);
    Data_Size : Natural := Capacity;
    Data_Used : Natural := 0;
  end record;

end CGBC.Bounded_Generic_Strings;
