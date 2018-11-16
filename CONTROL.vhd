LIBRARY ieee ;
	USE ieee.std_logic_1164.all;
	USE ieee.std_logic_signed.all;

ENTITY CONTROL IS
	PORT(	
			CLOCK			: IN STD_LOGIC;
			INSTRUCAO 	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			RegWrite		: OUT STD_LOGIC;
			ALUSrc		: OUT STD_LOGIC;
			ALUOp			: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
			RegDst		: OUT STD_LOGIC;
			MemWrite		: OUT STD_LOGIC;
			MemRead		: OUT STD_LOGIC;
			MemtoReg		: OUT STD_LOGIC;
			Branch 		: OUT STD_LOGIC;
			OPCODE 		: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			FUNCT 		: OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
			RD_ADDR		: OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
			RS_ADDR		: OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
			RT_ADDR		: OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
			AddSrc 		: OUT STD_LOGIC;
			Jump			: OUT STD_LOGIC;
			ImmedOrReg 	: OUT STD_LOGIC
	) ;
END ENTITY ; -- CONTROL

ARCHITECTURE arch OF CONTROL IS
BEGIN
	PROCESS (INSTRUCAO, CLOCK)
	BEGIN
		--IF Clock'EVENT AND Clock = '1' THEN		
			CASE INSTRUCAO(31 DOWNTO 28) IS -- OPCODE
				WHEN "0000" => -- TIPO R (ALUControl processa FUNCTION)
					CASE INSTRUCAO(5 DOWNTO 0) IS -- FUNCTION
						WHEN "000000" => -- add
							RegWrite	<= '1';
							ALUSrc 	<= '0';
							ALUOp		<= "010";
							RegDst 	<= '0';						
							MemWrite <= '0';
							MemRead	<= '0';
							MemtoReg	<= '0';
							Branch 	<= '0';
							AddSrc 	<= '0';
							Jump 		<= '0';
							ImmedOrReg<= '0';
							RD_ADDR <= INSTRUCAO(27 DOWNTO 23); -- rd
							RS_ADDR <= INSTRUCAO(22 DOWNTO 18); -- rs	
							RT_ADDR <= INSTRUCAO(17 DOWNTO 13); -- rt
						WHEN "000001" => -- sub
							RegWrite	<= '1';
							ALUSrc 	<= '0';
							ALUOp		<= "010";
							RegDst 	<= '0';						
							MemWrite <= '0';
							MemRead	<= '0';
							MemtoReg	<= '0';
							Branch 	<= '0';
							AddSrc 	<= '0';
							Jump 		<= '0';
							ImmedOrReg<= '0';
							RD_ADDR <= INSTRUCAO(27 DOWNTO 23); -- rd
							RS_ADDR <= INSTRUCAO(22 DOWNTO 18); -- rs	
							RT_ADDR <= INSTRUCAO(17 DOWNTO 13); -- rt
						WHEN "000010" => -- and
							RegWrite	<= '1';
							ALUSrc 	<= '0';
							ALUOp		<= "010";
							RegDst 	<= '0';						
							MemWrite <= '0';
							MemRead	<= '0';
							MemtoReg	<= '0';
							Branch 	<= '0';
							AddSrc 	<= '0';
							Jump 		<= '0';
							ImmedOrReg<= '0';
							RD_ADDR <= INSTRUCAO(27 DOWNTO 23); -- rd
							RS_ADDR <= INSTRUCAO(22 DOWNTO 18); -- rs	
							RT_ADDR <= INSTRUCAO(17 DOWNTO 13); -- rt
						WHEN "000011" => -- or
							RegWrite	<= '1';
							ALUSrc 	<= '0';
							ALUOp		<= "010";
							RegDst 	<= '0';						
							MemWrite <= '0';
							MemRead	<= '0';
							MemtoReg	<= '0';
							Branch 	<= '0';
							Branch 	<= '0';
							AddSrc 	<= '0';
							Jump 		<= '0';
							ImmedOrReg<= '0';
							RD_ADDR <= INSTRUCAO(27 DOWNTO 23); -- rd
							RS_ADDR <= INSTRUCAO(22 DOWNTO 18); -- rs	
							RT_ADDR <= INSTRUCAO(17 DOWNTO 13); -- rt
						WHEN "000100" => -- jr
							RegWrite	<= '0';
							ALUSrc 	<= '0';
							ALUOp		<= "010";
							RegDst 	<= '0';						
							MemWrite <= '0';
							MemRead	<= '0';
							MemtoReg	<= '0';
							Branch 	<= '0';
							AddSrc 	<= '0';
							Jump 		<= '1';
							ImmedOrReg<= '1';
							RS_ADDR <= INSTRUCAO(27 DOWNTO 23); -- rs	
						WHEN OTHERS =>
							NULL;
					END CASE;
					
				WHEN "0001" => -- addi
					RegWrite	<= '1';
					ALUSrc 	<= '1';
					ALUOp		<= "011";
					RegDst 	<= '0';				
					MemWrite <= '0';
					MemRead	<= '0';
					MemtoReg	<= '0';
					Branch 	<= '0';
					AddSrc 	<= '0';
					Jump 		<= '0';
					ImmedOrReg<= '0';	
					RD_ADDR <= INSTRUCAO(27 DOWNTO 23); -- rd
					RS_ADDR <= INSTRUCAO(22 DOWNTO 18); -- rs	
				WHEN "0010" => -- subi
					RegWrite	<= '1';
					ALUSrc 	<= '1';
					ALUOp		<= "011";
					RegDst 	<= '0';				
					MemWrite <= '0';
					MemRead	<= '0';
					MemtoReg	<= '0';
					Branch 	<= '0';
					AddSrc 	<= '0';
					Jump 		<= '0';
					ImmedOrReg<= '0';	
					RD_ADDR <= INSTRUCAO(27 DOWNTO 23); -- rd
					RS_ADDR <= INSTRUCAO(22 DOWNTO 18); -- rs	
				WHEN "0011" => -- andi
					RegWrite	<= '1';
					ALUSrc 	<= '1';
					ALUOp		<= "011";
					RegDst 	<= '0';				
					MemWrite <= '0';
					MemRead	<= '0';
					MemtoReg	<= '0';
					Branch 	<= '0';
					AddSrc 	<= '0';
					Jump 		<= '0';
					ImmedOrReg<= '0';	
					RD_ADDR <= INSTRUCAO(27 DOWNTO 23); -- rd
					RS_ADDR <= INSTRUCAO(22 DOWNTO 18); -- rs	
				WHEN "0100" => -- ori
					RegWrite	<= '1';
					ALUSrc 	<= '1';
					ALUOp		<= "011";
					RegDst 	<= '0';				
					MemWrite <= '0';
					MemRead	<= '0';
					MemtoReg	<= '0';
					Branch 	<= '0';
					AddSrc 	<= '0';
					Jump 		<= '0';
					ImmedOrReg<= '0';	
					RD_ADDR <= INSTRUCAO(27 DOWNTO 23); -- rd
					RS_ADDR <= INSTRUCAO(22 DOWNTO 18); -- rs	
					
				WHEN "0101" => -- lw
					RegWrite	<= '1';
					ALUSrc 	<= '1';
					ALUOp		<= "000";
					RegDst 	<= '0';				
					MemWrite <= '0';
					MemRead	<= '1';
					MemtoReg	<= '1';
					Branch 	<= '0';
					AddSrc 	<= '0';
					Jump 		<= '0';
					ImmedOrReg<= '0';	
					RD_ADDR <= INSTRUCAO(27 DOWNTO 23); -- rd
					RS_ADDR <= INSTRUCAO(22 DOWNTO 18); -- rs
					
				WHEN "0110" => -- sw
					RegWrite	<= '0';
					ALUSrc 	<= '1';
					ALUOp		<= "000";
					RegDst 	<= '0';				
					MemWrite <= '1';
					MemRead	<= '0';
					MemtoReg	<= '0';
					Branch 	<= '0';
					AddSrc 	<= '0';
					Jump 		<= '0';
					ImmedOrReg<= '0';	
					RS_ADDR <= INSTRUCAO(27 DOWNTO 23); -- rs
					RT_ADDR <= INSTRUCAO(22 DOWNTO 18); -- rt
					
				WHEN "0111" => -- branch on equal
					RegWrite	<= '0';
					ALUSrc 	<= '0';
					ALUOp		<= "001";
					RegDst 	<= '0';				
					MemWrite <= '0';
					MemRead	<= '0';
					MemtoReg	<= '0';
					Branch 	<= '1';
					AddSrc 	<= '0';
					Jump 		<= '0';
					ImmedOrReg<= '0';	
					RS_ADDR <= INSTRUCAO(27 DOWNTO 23); -- rs
					RT_ADDR <= INSTRUCAO(22 DOWNTO 18); -- rt
					
				WHEN "1000" => -- jump
					RegWrite	<= '0';
					ALUSrc 	<= '0';
					ALUOp		<= "001";
					RegDst 	<= '0';				
					MemWrite <= '0';
					MemRead	<= '0';
					MemtoReg	<= '0';
					Branch 	<= '0';
					AddSrc 	<= '1';
					Jump 		<= '1';
					ImmedOrReg<= '0';	
					
				WHEN "1111" => -- nop
					RegWrite	<= '0';
					ALUSrc 	<= '0';
					ALUOp		<= "111";
					RegDst 	<= '0';				
					MemWrite <= '0';
					MemRead	<= '0';
					MemtoReg	<= '0';
					Branch 	<= '0';
					AddSrc 	<= '0';
					Jump 		<= '0';
					ImmedOrReg<= '0';	
					
				WHEN OTHERS => 
					null;
			END CASE;
			
			OPCODE 	<= INSTRUCAO(31 DOWNTO 28);
			FUNCT 	<= INSTRUCAO(5 DOWNTO 0);
			
		--END IF;
	END PROCESS;
	
END ARCHITECTURE ; -- arch