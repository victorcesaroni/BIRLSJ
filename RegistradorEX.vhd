library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity RegistradorEX is
  port ( 	
			ALUSrc: in std_logic;
			ALUOp: in std_logic_vector(2 downto 0);
			RegDST: in std_logic;
			clock		 : in std_logic;
			AddSrc 	: in std_logic;
			ImmedOrReg: in std_logic;
			ALUSrc_out: out std_logic;
			ALUOp_out: out std_logic_vector(2 downto 0);
			RegDST_out:  out std_logic;
			AddSrc_out 	: out std_logic;
			ImmedOrReg_out : out std_logic
			
  ) ;
  
end RegistradorEX; -- uc

architecture arch of RegistradorEX is
	begin
		process(clock)
			begin	
			if clock'Event AND clock = '0' then
				ALUSrc_out <= ALUSrc;
				ALUOp_out <= ALUOp;
				RegDST_out <= RegDST;
				AddSrc_out <= AddSrc;
				ImmedOrReg_out <= ImmedOrReg;
			end if;
		end process;
end architecture ; -- arch