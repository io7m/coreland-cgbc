package body CGBC.Bounded_Generic_Strings is

  procedure Append_Base
    (Left  : in out Bounded_String;
     Right : in     String_Type;
     Drop  : in     Ada.Strings.Truncation);

  procedure Check_Slice
    (Source : in Bounded_String;
     Low    : in Positive;
     High   : in Positive);

  --
  -- Append
  --

  function Append
    (Source   : in Bounded_String;
     New_Item : in Bounded_String;
     Drop     : in Ada.Strings.Truncation := Ada.Strings.Error) return Bounded_String
  is
    Temp : Bounded_String (Source.Data_Size) := Source;
  begin
    Append_Base
      (Left  => Temp,
       Right => New_Item.Data (1 .. New_Item.Data_Used),
       Drop  => Drop);
    return Temp;
  end Append;

  function Append
    (Source   : in Bounded_String;
     New_Item : in String_Type;
     Drop     : in Ada.Strings.Truncation := Ada.Strings.Error) return Bounded_String
  is
    Temp : Bounded_String (Source.Data_Size) := Source;
  begin
    Append_Base
      (Left  => Temp,
       Right => New_Item,
       Drop  => Drop);
    return Temp;
  end Append;

  function Append
    (Source   : in String_Type;
     New_Item : in Bounded_String;
     Drop     : in Ada.Strings.Truncation := Ada.Strings.Error) return Bounded_String
  is
    Temp : Bounded_String (Source'Last);
  begin
    Temp.Data (1 .. Source'Length) := Source (Source'First .. Source'Last);

    Append_Base
      (Left  => Temp,
       Right => New_Item.Data (1 .. New_Item.Data_Used),
       Drop  => Drop);

    return Temp;
  end Append;

  function Append
    (Source   : in Bounded_String;
     New_Item : in Character_Type;
     Drop     : in Ada.Strings.Truncation := Ada.Strings.Error) return Bounded_String
  is
    Temp_L : Bounded_String (Source.Data_Size) := Source;
    Temp_R : String_Type (1 .. 1);
  begin
    Temp_R (1) := New_Item;

    Append_Base
      (Left  => Temp_L,
       Right => Temp_R,
       Drop  => Drop);

    return Temp_L;
  end Append;

  procedure Append
    (Source   : in out Bounded_String;
     New_Item : in     Bounded_String;
     Drop     : in     Ada.Strings.Truncation := Ada.Strings.Error) is
  begin
    Append_Base
      (Left  => Source,
       Right => New_Item.Data (1 .. New_Item.Data_Used),
       Drop  => Drop);
  end Append;

  procedure Append
    (Source   : in out Bounded_String;
     New_Item : in     String_Type;
     Drop     : in     Ada.Strings.Truncation := Ada.Strings.Error) is
  begin
    Append_Base
      (Left  => Source,
       Right => New_Item,
       Drop  => Drop);
  end Append;

  --
  -- Append_Base
  --

  procedure Append_Base
    (Left  : in out Bounded_String;
     Right : in     String_Type;
     Drop  : in     Ada.Strings.Truncation)
  is
    Result_Length : Natural;
  begin
    -- Right does not require truncation of any kind?
    if Left.Data_Used + Right'Length <= Left.Data_Size then
      Result_Length                                   := Left.Data_Used + Right'Length;
      Left.Data (Left.Data_Used + 1 .. Result_Length) := Right (Right'First .. Right'Last);
      Left.Data_Used                                  := Result_Length;
    else
      case Drop is
        when Ada.Strings.Error => raise Ada.Strings.Length_Error;
        when Ada.Strings.Right =>
          declare
            Right_High : constant Natural := Right'First + ((Left.Data_Size - Left.Data_Used) - 1);
            Left_Low   : constant Natural := Left.Data_Used + 1;
          begin
            Left.Data (Left_Low .. Left.Data_Size) := Right (Right'First .. Right_High);
          end;
        when Ada.Strings.Left =>
          -- String length is greater than or equal to maximum possible size?
          if Right'Length >= Left.Data_Size then
            declare
              Right_Low : constant Natural := (Right'Last - Left.Data_Size) + 1;
            begin
              Left.Data (1 .. Left.Data_Size) := Right (Right_Low .. Right'Last);
            end;
          else
            declare
              Left_High : constant Natural := Left.Data_Size - Right'Length;
              Left_Low  : constant Natural := (Left.Data_Size - Left_High) + 1;
            begin
              Left.Data (1 .. Left_High) := Left.Data (Left_Low .. Left.Data_Used);
              Left.Data (Left_High + 1 .. Left.Data_Size) := Right (Right'First .. Right'Last);
            end;
          end if;
      end case;
      Left.Data_Used := Left.Data_Size;
    end if;
  end Append_Base;

  --
  -- Bounded_Slice
  --

  function Bounded_Slice
    (Source : in Bounded_String;
     Low    : in Positive;
     High   : in Positive) return Bounded_String is
  begin
    Check_Slice (Source, Low, High);
    return To_Bounded_String (Source.Data (Low .. High));
  end Bounded_Slice;

  --
  -- Check_Index
  --

  procedure Check_Index
    (Source : in Bounded_String;
     Index  : in Positive) is
  begin
    if Index > Source.Data_Used then
      raise Ada.Strings.Index_Error;
    end if;
  end Check_Index;

  --
  -- Check_Slice
  --

  procedure Check_Slice
    (Source : in Bounded_String;
     Low    : in Positive;
     High   : in Positive) is
  begin
    if Low > Length (Source) + 1 or High > Length (Source) then
      raise Ada.Strings.Index_Error;
    end if;
  end Check_Slice;

  --
  -- Element
  --

  function Element
    (Source : in Bounded_String;
     Index  : in Positive) return Character_Type is
  begin
    Check_Index (Source, Index);
    return Source.Data (Index);
  end Element;

  --
  -- Equivalent
  --

  function Equivalent
    (Left  : in Bounded_String;
     Right : in Bounded_String) return Boolean is
  begin
    if Left.Data_Used /= Right.Data_Used then
      return False;
    end if;

    return
      Left.Data  (1 .. Left.Data_Used) =
      Right.Data (1 .. Right.Data_Used);
  end Equivalent;

  --
  -- Length
  --

  function Length (Source : in Bounded_String) return Natural is
  begin
    return Source.Data_Used;
  end Length;

  --
  -- Maximum_Length
  --

  function Maximum_Length (Source : in Bounded_String) return Natural is
  begin
    return Source.Data_Size;
  end Maximum_Length;

  --
  -- Replace_Element
  --

  procedure Replace_Element
    (Source : in out Bounded_String;
     Index  : in     Positive;
     By     : in     Character_Type) is
  begin
    Check_Index (Source, Index);
    Source.Data (Index) := By;
  end Replace_Element;

  --
  -- Set_Bounded_String
  --

  procedure Set_Bounded_String
    (Target :    out Bounded_String;
     Source : in     String_Type;
     Drop   : in     Ada.Strings.Truncation := Ada.Strings.Error) is
  begin
    Truncate (Target);
    Append_Base
      (Left  => Target,
       Right => Source,
       Drop  => Drop);
  end Set_Bounded_String;

  --
  -- Slice
  --

  function Slice
    (Source : in Bounded_String;
     Low    : in Positive;
     High   : in Positive) return String_Type is
  begin
    Check_Slice (Source, Low, High);
    return Source.Data (Low .. High);
  end Slice;

  --
  -- To_Bounded_String
  --

  function To_Bounded_String
    (Source : in String_Type;
     Drop   : in Ada.Strings.Truncation := Ada.Strings.Error) return Bounded_String
  is
    Temp : Bounded_String (Source'Length);
  begin
    Append_Base
      (Left  => Temp,
       Right => Source,
       Drop  => Drop);
    return Temp;
  end To_Bounded_String;

  --
  -- To_String
  --

  function To_String (Source : in Bounded_String) return String_Type is
  begin
    return Source.Data (1 .. Source.Data_Used);
  end To_String;

  --
  -- Truncate
  --

  procedure Truncate (Target : out Bounded_String) is
  begin
    Target.Data_Used := 0;
  end Truncate;

end CGBC.Bounded_Generic_Strings;
