library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity RegistradorEX_MEM is
  port ( 	
			saidasomador	:in std_logic_vector(31 downto 0);
			sinalZero	:in std_logic;
			ALUResult	:in std_logic_vector(31 downto 0);
			read_data_2 : in std_logic_vector(31 downto 0);
			saida_mux_RegDST:in std_logic_vector(4 downto 0);
			clock		 : in std_logic;
			saidasomador_out	:out std_logic_vector(31 downto 0);
			sinalZero_out	:out std_logic;
			ALUResult_out	:out std_logic_vector(31 downto 0);
			read_data_2_out :out std_logic_vector(31 downto 0);
			saida_mux_RegDST_out:out std_logic_vector(4 downto 0)
  ) ;
  
end RegistradorEX_MEM; -- uc

architecture arch of RegistradorEX_MEM is
	begin
		process(clock)
			begin	
			if clock'Event AND clock = '0' then
				saidasomador_out <= saidasomador;
				sinalZero_out <= sinalZero;
				ALUResult_out <= ALUResult;
				read_data_2_out <= read_data_2;
				saida_mux_RegDST_out <= saida_mux_RegDST;
			end if;
		end process;
end architecture ; -- arch