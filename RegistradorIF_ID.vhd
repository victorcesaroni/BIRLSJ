library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity RegistradorIF_ID is
  port ( clock		 : in std_logic;
			instrucao : in std_logic_vector(31 downto 0) ;
			pc			 : in std_logic_vector(31 downto 0) ;			
			pc_out	 : out std_logic_vector(31 downto 0);
  	     instrucao_out : out std_logic_vector(31 downto 0)
  ) ;
  
end RegistradorIF_ID; -- RegistradorIF_ID

architecture arch of RegistradorIF_ID is
	begin
		process(clock)
			begin	
			if clock'Event AND clock = '0' then
				pc_out <= pc;
				instrucao_out <= instrucao;
			end if;
		end process;
end architecture ; -- arch