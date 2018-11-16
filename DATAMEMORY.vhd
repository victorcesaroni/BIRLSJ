-- OBS: memread só ta de enfeite...


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DATAMEMORY is
generic (N : integer := 32;
		M : integer := 64);  -- 256 KB
		
port(	clock, 
		memwrite, 
		memread:	in std_logic;
		address: 			in std_logic_vector(N-1 downto 0);
		writedata:			in std_logic_vector(N-1 downto 0);
		readdata:			out std_logic_vector(N-1 downto 0);
		
		DBG_MEM0		: out std_logic_vector(N-1 downto 0);
		DBG_MEM1		: out std_logic_vector(N-1 downto 0);
		DBG_MEM2		: out std_logic_vector(N-1 downto 0);
		DBG_MEM3		: out std_logic_vector(N-1 downto 0);
		DBG_MEM4		: out std_logic_vector(N-1 downto 0);
		DBG_MEM5		: out std_logic_vector(N-1 downto 0);
		DBG_MEM6		: out std_logic_vector(N-1 downto 0);
		DBG_MEM7		: out std_logic_vector(N-1 downto 0)
	);
end DATAMEMORY;

architecture behaviour of DATAMEMORY is	
	type memory_array is array (0 to M-1) of std_logic_vector(N-1 downto 0);
	signal memory : memory_array;
	signal r : std_logic_vector(N-1 downto 0);
begin
	process(clock)
	begin
		if(clock'event and clock='0') then
			if(memwrite = '1') then
				memory(to_integer(unsigned(address))) <= writedata;
			end if;
		end if;
		r <=  memory(to_integer(unsigned(address)));
	end process;
	
	readdata <= r;
	
	DBG_MEM0 <= memory(0);
	DBG_MEM1 <= memory(1);
	DBG_MEM2 <= memory(2);
	DBG_MEM3 <= memory(3);
	DBG_MEM4 <= memory(4);
	DBG_MEM5 <= memory(5);
	DBG_MEM6 <= memory(6);
	DBG_MEM7 <= memory(7);
end behaviour;