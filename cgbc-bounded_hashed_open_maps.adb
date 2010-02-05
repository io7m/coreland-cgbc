package body CGBC.Bounded_Hashed_Open_Maps is

  procedure Find_Index
    (Key_Table : in     Map_Keys;
     Key       : in     Key_Type;
     Found     :    out Boolean;
     Index     :    out Count_Type);

  --
  -- Clear
  --

  procedure Clear (Container : in out Map) is
  begin
    for Index in Container.Keys.Buckets'Range loop
      Container.Keys.Buckets (Index).State := Empty;
    end loop;

    Container.Keys.Used := 0;
  end Clear;

  --
  -- Contains
  --

  function Contains
    (Container : in Map;
     Key       : in Key_Type) return Boolean
  is
    Found : Boolean;
    Index : Count_Type;
  begin
    Found := False;
    if Container.Keys.Used > 0 then
      Find_Index
        (Key_Table => Container.Keys,
         Key       => Key,
         Found     => Found,
         Index     => Index);
    end if;
    return Found;
  end Contains;

  --
  -- Delete
  --

  procedure Delete
    (Container : in out Map;
     Key       : in     Key_Type;
     Deleted   :    out Boolean)
  is
    Index : Count_Type;
    Found : Boolean;
  begin
    Deleted := False;
    if Container.Keys.Used > 0 then
      Find_Index
        (Key_Table => Container.Keys,
         Key       => Key,
         Found     => Found,
         Index     => Index);
      if Found then
        pragma Assert
          ((Index >= Container.Keys.Buckets'First) and
           (Index <= Container.Keys.Buckets'Last));
        declare
          Current_Bucket : Bucket_Type renames Container.Keys.Buckets (Index);
        begin
          pragma Assert (Current_Bucket.State = Used);
          Current_Bucket.State := Bounded_Hashed_Open_Maps.Deleted;
          Container.Keys.Used  := Container.Keys.Used - 1;
          Deleted              := True;
        end;
      end if;
    end if;
  end Delete;

  --
  -- Exclude
  --

  procedure Exclude
    (Container : in out Map;
     Key       : in     Key_Type)
  is
    Deleted : Boolean;
  begin
    -- Deleted is unused.
    pragma Warnings (Off);
    Delete
      (Container => Container,
       Key       => Key,
       Deleted   => Deleted);
    pragma Warnings (On);
  end Exclude;

  --
  -- Find
  --

  function Find
    (Container : in Map;
     Key       : in Key_Type) return Cursor
  is
    C     : Cursor := No_Element;
    Found : Boolean;
    Index : Count_Type;
  begin
    if Container.Keys.Used > 0 then
      Find_Index
        (Key_Table => Container.Keys,
         Key       => Key,
         Found     => Found,
         Index     => Index);
      if Found then
        C := Cursor (Index);
      end if;
    end if;

    return C;
  end Find;

  --
  -- Find_Index
  --

  procedure Find_Index
    (Key_Table : in     Map_Keys;
     Key       : in     Key_Type;
     Found     :    out Boolean;
     Index     :    out Count_Type)
  is
    Hash_Value : Hash_Type;
  begin
    Found      := False;
    Hash_Value := Hash (Key);
    Index      := Count_Type (Hash_Value mod Hash_Type (Key_Table.Buckets'Last)) + 1;

    pragma Assert
      ((Index >= Key_Table.Buckets'First) and
       (Index <= Key_Table.Buckets'Last));

    for Attempt in Key_Table.Buckets'Range loop
      declare
        Current_Bucket : Bucket_Type renames Key_Table.Buckets (Index);
      begin
        case Current_Bucket.State is
          when Empty =>
            Found := False;
            exit;
          when Used =>
            Found := Equivalent_Keys
              (Left  => Current_Bucket.Key,
               Right => Key);
            if Found then
              exit;
            end if;
          when Deleted =>
            if Current_Bucket.Key = Key then
              exit;
            end if;
        end case;
      end;

      -- Simple linear probing.
      if Index /= Key_Table.Buckets'Last then
        Index := Index + 1;
      else
        Index := Key_Table.Buckets'First;
      end if;
    end loop;
  end Find_Index;

  --
  -- First
  --

  function First (Container : in Map) return Cursor is
    C : Cursor;
  begin
    C := No_Element;

    if Container.Keys.Used > 0 then
      for Index in Container.Keys.Buckets'Range loop
        if Container.Keys.Buckets (Index).State = Used then
          C := Index;
          exit;
        end if;
      end loop;
    end if;

    return C;
  end First;

  --
  -- Next
  --

  function Next
    (Container : in Map;
     Position  : in Cursor) return Cursor
  is
    C : Cursor := No_Element;
  begin
    if Valid_Cursor (Container, Position) then
      for Index in Count_Type (Position + 1) .. Container.Capacity loop
        if Container.Keys.Buckets (Index).State = Used then
          C := Index;
          exit;
        end if;
      end loop;
    end if;

    return C;
  end Next;

  procedure Next
    (Container : in     Map;
     Position  : in out Cursor) is
  begin
    Position := Next (Container, Position);
  end Next;

  --
  -- Include
  --

  procedure Include
    (Container : in out Map;
     Key       : in     Key_Type;
     Element   : in     Element_Type;
     Included  :    out Boolean) is
  begin
    if Contains (Container, Key) then
      Replace_Element
        (Container => Container,
         Key       => Key,
         Element   => Element,
         Exists    => Included);
      pragma Assert (Included);
    else
      Insert
        (Container => Container,
         Key       => Key,
         Element   => Element,
         Inserted  => Included);
    end if;
  end Include;

  --
  -- Insert.
  --

  procedure Insert
    (Container : in out Map;
     Key       : in     Key_Type;
     Element   : in     Element_Type;
     Inserted  :    out Boolean)
  is
    Index : Count_Type;
    Found : Boolean;
  begin
    if Container.Keys.Used = Container.Capacity then
      Inserted := False;
    else
      Find_Index
        (Key_Table => Container.Keys,
         Key       => Key,
         Found     => Found,
         Index     => Index);
      pragma Assert
        ((Index >= Container.Keys.Buckets'First) and
         (Index <= Container.Keys.Buckets'Last));
      if Found then
        Inserted := False;
      else
        declare
          Current_Bucket : Bucket_Type renames Container.Keys.Buckets (Index);
        begin
          pragma Assert (Current_Bucket.State /= Used);
          Current_Bucket.Key         := Key;
          Current_Bucket.State       := Used;
          Container.Elements (Index) := Element;
          Container.Keys.Used        := Container.Keys.Used + 1;
          Inserted                   := True;
        end;
      end if;
    end if;
  end Insert;

  --
  -- Is_Empty
  --

  function Is_Empty (Container : in Map) return Boolean is
  begin
    return Length (Container) = 0;
  end Is_Empty;

  --
  -- Last
  --

  function Last (Container : in Map) return Cursor is
    C : Cursor := No_Element;
  begin
    if Container.Keys.Used > 0 then
      for Index in reverse Container.Keys.Buckets'Range loop
        if Container.Keys.Buckets (Index).State = Used then
          C := Index;
          exit;
        end if;
      end loop;
    end if;

    return C;
  end Last;

  --
  -- Length
  --

  function Length (Container : in Map) return Count_Type is
  begin
    return Container.Keys.Used;
  end Length;

  --
  -- Replace_Element
  --

  procedure Replace_Element
    (Container : in out Map;
     Key       : in     Key_Type;
     Element   : in     Element_Type;
     Exists    :    out Boolean)
  is
    Index : Count_Type;
  begin
    Exists := False;
    if Container.Keys.Used > 0 then
      Find_Index
        (Key_Table => Container.Keys,
         Key       => Key,
         Found     => Exists,
         Index     => Index);
      pragma Assert
        ((Index >= Container.Keys.Buckets'First) and
         (Index <= Container.Keys.Buckets'Last));
      if Exists then
        pragma Assert (Container.Keys.Buckets (Index).State = Used);
        Container.Elements (Index) := Element;
      end if;
    end if;
  end Replace_Element;

  --
  -- Valid_Cursor
  --

  function Valid_Cursor
    (Container : in Map;
     Position  : in Cursor) return Boolean is
  begin
    if Position >= Container.Keys.Buckets'First and
       Position <= Container.Capacity then
      pragma Assert (Position /= No_Element);
      return Container.Keys.Buckets (Position).State = Used;
    else
      return False;
    end if;
  end Valid_Cursor;

end CGBC.Bounded_Hashed_Open_Maps;
