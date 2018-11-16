library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity RegistradorWB is
  port ( 	
			MemToReg: in std_logic;
			RegWrite: in std_logic;
			clock		 : in std_logic;
			MemToReg_out: out std_logic;
			RegWrite_out:  out std_logic
			
  ) ;
  
end RegistradorWB; -- uc

architecture arch of RegistradorWB is
	begin
		process(clock)
			begin	
			if clock'Event AND clock = '0' then
				MemToReg_out <= MemToReg;
				RegWrite_out <= RegWrite;
			end if;
		end process;
end architecture ; -- arch