library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity RegistradorMEM_WB is
  port ( 	
			read_data	:in std_logic_vector(31 downto 0);
			address 	:in std_logic_vector(31 downto 0); -- conferir o tamanho
			saida_mux_RegDST:in std_logic_vector(4 downto 0);
			clock		 : in std_logic;
			read_data_out	:out std_logic_vector(31 downto 0);
			address_out 	:out std_logic_vector(31 downto 0);
			saida_mux_RegDST_out:out std_logic_vector(4 downto 0)
  ) ;
  
end RegistradorMEM_WB; -- uc

architecture arch of RegistradorMEM_WB is
	begin
		process(clock)
			begin	
			if clock'Event AND clock = '0' then
				read_data_out <= read_data;
				address_out <= address;
				saida_mux_RegDST_out <= saida_mux_RegDST;
			end if;
		end process;
end architecture ; -- arch