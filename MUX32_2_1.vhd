library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

ENTITY MUX32_2_1 IS
	PORT(	ENTRADA_0 	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			ENTRADA_1 	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			CONTROLE 	: IN STD_LOGIC;
			SAIDA 		: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)		
	) ;
END ENTITY ; -- MUX

ARCHITECTURE arch OF MUX32_2_1 IS
BEGIN
	PROCESS (CONTROLE, ENTRADA_0, ENTRADA_1)
		BEGIN
		CASE CONTROLE IS
			WHEN '0' => SAIDA <= ENTRADA_0;
			WHEN '1' => SAIDA <= ENTRADA_1;
		END CASE;
	END PROCESS;
END ARCHITECTURE ; -- arch