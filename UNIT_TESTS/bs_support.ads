with CGBC.Bounded_Stacks;

package BS_Support is

  package Natural_Stacks is new CGBC.Bounded_Stacks
    (Element_Type => Natural);

  Stack : Natural_Stacks.Stack (4);

end BS_Support;
