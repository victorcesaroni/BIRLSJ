library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity EXTENSOR is
  
  port ( x : in std_logic_vector(18-1 downto 0) ;
  	     o : out std_logic_vector(32-1 downto 0)
  ) ;

end EXTENSOR; -- EXTENSOR

architecture arch of EXTENSOR is

begin
	o <= std_logic_vector(resize(signed(x),o'length));

end architecture ; -- arch