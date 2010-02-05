package body BOHT_Support is

  function Hash4 (Key : in Key_Type4) return CGBC.Hash_Type is
    use type CGBC.Hash_Type;

    H : CGBC.Hash_Type := 5381;
    C : CGBC.Hash_Type;
  begin
    for Index in Key'Range loop
      C := Character'Pos (Key (Index));
      H := ((H * 32) + H) xor C;
    end loop;

    return H;
  end Hash4;

end BOHT_Support;
