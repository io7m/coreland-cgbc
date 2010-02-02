package body CGBC.Bounded_Stacks is

  --
  -- Clear
  --

  procedure Clear (Container : in out Stack) is
  begin
    Container.Used := 0;
  end Clear;

  --
  -- Is_Empty
  --

  function Is_Empty (Container : in Stack) return Boolean is
  begin
    return Container.Used = 0;
  end Is_Empty;

  --
  -- Length
  --

  function Length (Container : in Stack) return Count_Type is
  begin
    return Container.Used;
  end Length;

  --
  -- Peek
  --

  procedure Peek
    (Container : in     Stack;
     Underflow :    out Boolean) is
  begin
    if Container.Used > 0 then
      Underflow := False;
      Process (Container.Elements (Container.Used));
    else
      Underflow := True;
    end if;
  end Peek;

  --
  -- Pop
  --

  procedure Pop
    (Container : in out Stack;
     Item      :    out Element_Type;
     Underflow :    out Boolean) is
  begin
    if Container.Used > 0 then
      Item           := Container.Elements (Container.Used);
      Container.Used := Container.Used - 1;
      Underflow      := False;
    else
      Underflow      := True;
    end if;
  end Pop;

  --
  -- Push
  --

  procedure Push
    (Container : in out Stack;
     New_Item  : in     Element_Type;
     Overflow  :    out Boolean) is
  begin
    if Container.Used < Container.Capacity then
      Container.Used                      := Container.Used + 1;
      Container.Elements (Container.Used) := New_Item;
      Overflow                            := False;
    else
      Overflow                            := True;
    end if;
  end Push;

end CGBC.Bounded_Stacks;
