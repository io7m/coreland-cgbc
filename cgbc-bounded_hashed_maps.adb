package body CGBC.Bounded_Hashed_Maps is

  procedure Find_Index
    (Container : in     Map;
     Key       : in     Key_Type;
     Found     :    out Boolean;
     Index     :    out Count_Type);

  --
  -- Clear
  --

  procedure Clear (Container : in out Map) is
  begin
    for Index in Container.Buckets'Range loop
      Container.Buckets (Index).State := Empty;
    end loop;

    Container.Used := 0;
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
    if Container.Used > 0 then
      Find_Index
        (Container => Container,
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
    if Container.Used > 0 then
      Find_Index
        (Container => Container,
         Key   => Key,
         Found => Found,
         Index => Index);
      if Found then
        pragma Assert
          ((Index >= Container.Buckets'First) and
           (Index <= Container.Buckets'Last));
        declare
          Current_Bucket : Bucket_Type renames Container.Buckets (Index);
        begin
          pragma Assert (Current_Bucket.State = Used);
          Current_Bucket.State := Bounded_Hashed_Maps.Deleted;
          Container.Used       := Container.Used - 1;
          Deleted              := True;
        end;
      end if;
    end if;
  end Delete;

  --
  -- Element
  --

  procedure Element
    (Container : in     Map;
     Key       : in     Key_Type;
     Element   :    out Element_Type;
     Exists    :    out Boolean)
  is
    Index : Count_Type;
  begin
    Exists := False;
    if Container.Used > 0 then
      Find_Index
        (Container => Container,
         Key       => Key,
         Found     => Exists,
         Index     => Index);
      if Exists then
        pragma Assert
          ((Index >= Container.Buckets'First) and
           (Index <= Container.Buckets'Last));
        pragma Assert (Container.Buckets (Index).State = Used);
        Element := Container.Buckets (Index).Data;
      end if;
    end if;
  end Element;

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
  -- Find_Index
  --

  procedure Find_Index
    (Container : in     Map;
     Key       : in     Key_Type;
     Found     :    out Boolean;
     Index     :    out Count_Type)
  is
    Hash_Value : Hash_Type;
  begin
    Found      := False;
    Hash_Value := Hash (Key);
    Index      := Count_Type (Hash_Value mod Hash_Type (Container.Capacity)) + 1;

    pragma Assert
      ((Index >= Container.Buckets'First) and (Index <= Container.Buckets'Last));

    for Attempt in Container.Buckets'Range loop
      declare
        Current_Bucket : Bucket_Type renames Container.Buckets (Index);
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
      if Index /= Container.Capacity then
        Index := Index + 1;
      else
        Index := Container.Buckets'First;
      end if;
    end loop;
  end Find_Index;

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
    if Container.Used = Container.Capacity then
      Inserted := False;
    else
      Find_Index
        (Container => Container,
         Key       => Key,
         Found     => Found,
         Index     => Index);
      pragma Assert
        ((Index >= Container.Buckets'First) and
         (Index <= Container.Buckets'Last));
      if Found then
        Inserted := False;
      else
        declare
          Current_Bucket : Bucket_Type renames Container.Buckets (Index);
        begin
          pragma Assert (Current_Bucket.State /= Used);
          Current_Bucket.Key   := Key;
          Current_Bucket.Data  := Element;
          Current_Bucket.State := Used;
          Container.Used       := Container.Used + 1;
          Inserted             := True;
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
  -- Length
  --

  function Length (Container : in Map) return Count_Type is
  begin
    return Container.Used;
  end Length;

  --
  -- Modify_All_Elements
  --

  procedure Modify_All_Elements (Container : in out Map) is
  begin
    for Index in Container.Buckets'Range loop
      declare
        Current_Bucket : Bucket_Type renames Container.Buckets (Index);
      begin
        if Current_Bucket.State = Used then
          Process
            (Key     => Current_Bucket.Key,
             Element => Current_Bucket.Data);
        end if;
      end;
    end loop;
  end Modify_All_Elements;

  --
  -- Modify_Element
  --

  procedure Modify_Element
    (Container : in out Map;
     Key       : in     Key_Type;
     Exists    :    out Boolean)
  is
    Index : Count_Type;
  begin
    Exists := False;
    if Container.Used > 0 then
      Find_Index
        (Container => Container,
         Key       => Key,
         Found     => Exists,
         Index     => Index);
      pragma Assert
        ((Index >= Container.Buckets'First) and
         (Index <= Container.Buckets'Last));
      if Exists then
        pragma Assert (Container.Buckets (Index).State = Used);
        Process
          (Key     => Container.Buckets (Index).Key,
           Element => Container.Buckets (Index).Data);
      end if;
    end if;
  end Modify_Element;

  --
  -- Query_All_Elements
  --

  procedure Query_All_Elements (Container : in Map) is
  begin
    for Index in Container.Buckets'Range loop
      declare
        Current_Bucket : Bucket_Type renames Container.Buckets (Index);
      begin
        if Current_Bucket.State = Used then
          Process
            (Key     => Current_Bucket.Key,
             Element => Current_Bucket.Data);
        end if;
      end;
    end loop;
  end Query_All_Elements;

  --
  -- Query_All_Keys
  --

  procedure Query_All_Keys (Container : in Map) is
  begin
    for Index in Container.Buckets'Range loop
      declare
        Current_Bucket : Bucket_Type renames Container.Buckets (Index);
      begin
        if Current_Bucket.State = Used then
          Process (Current_Bucket.Key);
        end if;
      end;
    end loop;
  end Query_All_Keys;

  --
  -- Query_Element
  --

  procedure Query_Element
    (Container : in     Map;
     Key       : in     Key_Type;
     Exists    :    out Boolean)
  is
    Index : Count_Type;
  begin
    Exists := False;
    if Container.Used > 0 then
      Find_Index
        (Container => Container,
         Key       => Key,
         Found     => Exists,
         Index     => Index);
      pragma Assert
        ((Index >= Container.Buckets'First) and
         (Index <= Container.Buckets'Last));
      if Exists then
        pragma Assert (Container.Buckets (Index).State = Used);
        Process
          (Key     => Container.Buckets (Index).Key,
           Element => Container.Buckets (Index).Data);
      end if;
    end if;
  end Query_Element;

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
    if Container.Used > 0 then
      Find_Index
        (Container => Container,
         Key       => Key,
         Found     => Exists,
         Index     => Index);
      pragma Assert
        ((Index >= Container.Buckets'First) and
         (Index <= Container.Buckets'Last));
      if Exists then
        pragma Assert (Container.Buckets (Index).State = Used);
        Container.Buckets (Index).Data := Element;
      end if;
    end if;
  end Replace_Element;

end CGBC.Bounded_Hashed_Maps;
