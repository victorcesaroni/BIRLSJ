LIBRARY ieee ;
	USE ieee.std_logic_1164.all;
	USE ieee.std_logic_signed.all;

ENTITY ALU IS
	PORT(	ALU_0 		: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			ALU_1 		: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			ALUOP 		: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			RESULT 		: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			ZERO 			: OUT STD_LOGIC
	) ;
END ENTITY ; -- ALU

ARCHITECTURE arch OF ALU IS
	SIGNAL AND_RESULT : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL OR_RESULT  : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL ADD_RESULT : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL SUB_RESULT : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL ZERO_RESULT: STD_LOGIC;

BEGIN
	AND_RESULT 	<= ALU_0 AND ALU_1;
	OR_RESULT 	<= ALU_0 OR ALU_1;
	ADD_RESULT	<= ALU_0 + ALU_1;
	SUB_RESULT	<= ALU_0 - ALU_1;
	
	PROCESS (ALUOP, ALU_0, ALU_1, AND_RESULT, OR_RESULT, ADD_RESULT, SUB_RESULT)
		BEGIN
		CASE ALUOP IS
			WHEN "000" => 
				RESULT <= AND_RESULT;
			WHEN "001" =>
				RESULT <= OR_RESULT;
			WHEN "010" => 
				RESULT <= ADD_RESULT;
			WHEN "011" => 
				RESULT <= SUB_RESULT;
			WHEN OTHERS => 
				NULL;
		END CASE;
		
		IF SUB_RESULT = "00000000000000000000000000000000" THEN
			ZERO_RESULT <= '1';
		ELSE 
			ZERO_RESULT <= '0';
		END IF;
	END PROCESS;
	
	ZERO <= ZERO_RESULT;
END ARCHITECTURE ; -- arch