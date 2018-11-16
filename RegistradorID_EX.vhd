library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity RegistradorID_EX is
  port ( read_data_1 : in std_logic_vector(31 downto 0) ;
			read_data_2 : in std_logic_vector(31 downto 0) ;
			sinal_extendido : in std_logic_vector(31 downto 0) ; -- imediato
			rd : in std_logic_vector(4 downto 0) ;
			pc			 : in std_logic_vector(31 downto 0) ;
			opcode	 : in std_logic_vector(3 downto 0) ;
			clock		 : in std_logic;
			FUNCT : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
			read_data_1_out	 : out std_logic_vector(31 downto 0);
			read_data_2_out	 : out std_logic_vector(31 downto 0);
			sinal_extendido_out	 : out std_logic_vector(31 downto 0);
			rd_out : out std_logic_vector(4 downto 0) ;
			opcode_out	 : out std_logic_vector(3 downto 0); 
			pc_out	 : out std_logic_vector(31 downto 0);
			FUNCT_OUT	: OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
  ) ;
  
end RegistradorID_EX; -- RegistradorID_EX

architecture arch of RegistradorID_EX is
	begin
		process(clock)
			begin	
			if clock'Event AND clock = '0' then
				pc_out <= pc;
				read_data_1_out <= read_data_1;
				read_data_2_out <= read_data_2;
				sinal_extendido_out <= sinal_extendido;
				rd_out <= rd;
				opcode_out <= opcode;
				FUNCT_OUT <= FUNCT;
			end if;
		end process;
end architecture ; -- arch