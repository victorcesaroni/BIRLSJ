library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity RegistradorMEM is
  port ( 	
			MemWrite: in std_logic;
			MemRead: in std_logic;
			Branch: in std_logic;
			clock		 : in std_logic;
			Jump			: in std_logic;
			MemWrite_out: out std_logic;
			MemRead_out: out std_logic;
			Branch_out:  out std_logic;
			Jump_out		: out std_logic
			
  ) ;
  
end RegistradorMEM; -- uc

architecture arch of RegistradorMEM is
	begin
		process(clock)
			begin	
			if clock'Event AND clock = '0' then
				MemWrite_out <= MemWrite;
				MemRead_out <= MemRead;
				Branch_out <= Branch;
				Jump_out <= Jump;
			end if;
		end process;
end architecture ; -- arch