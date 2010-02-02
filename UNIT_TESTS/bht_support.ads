with CGBC.Bounded_Hashed_Maps;

package BHT_Support is

  subtype Key_Type4 is String (1 .. 4);

  Keys : constant array (1 .. 5) of Key_Type4 :=
    ("AAAA", "BBBB", "CCCC", "DDDD", "EEEE");

  function Hash4 (Key : in Key_Type4) return CGBC.Hash_Type;

  package String_Tables4 is new CGBC.Bounded_Hashed_Maps
    (Key_Type        => Key_Type4,
     Element_Type    => Natural,
     Hash            => Hash4,
     Equivalent_Keys => "=");

  Map : String_Tables4.Map (4);

end BHT_Support;
