library ieee;
use ieee.std_logic_1164.all;

entity control_unit is 
port(
	clock, reset, stop, conFF : in std_logic;
	run, clear : out std_logic;
	IR : in std_logic_vector(31 downto 0);
	PCout, MDRout, ZHIout, ZLOout, HIout, LOout, inportOUT : out std_logic;
	Rin, Rout, Gra, Grb, Grc: out std_logic;
	HIin, LOin, CONin, PCin, IRin, Yin, Zin, MARin, MDRin, OutPortin, inportin, Cout, BAout : out std_logic;
	IncPC, and_op, or_op, add_op, sub_op, mul_op, div_op, shr_op, shl_op, shra_op, ror_op, rol_op, neg_op, not_op, read_op : out std_logic;
	readRAM, writeRAM: out std_logic
	);
	
end entity;

architecture behaviour of control_unit is
	type state is (reset_state, fetch0, fetch1, fetch2, fetch2b, load3, load4, load5, load6, load6b, load7, loadi3, loadi4, loadi5, store3, store4, store5, store6, store6b, store7, add3, add4, add5,
	addi3, addi4, addi5, or3, or4, or5, ori3, ori4, ori5, and3, and4, and5, andi3, andi4, andi5, neg3, neg4, neg5, not3, not4, not5, shr3, shr4, shr5, shl3, shl4, shl5, ror3, ror4, ror5, rol3, rol4, rol5,
	sub3, sub4, sub5, div3, div4, div5,div6, mul3, mul4, mul5,mul6, jr3, jal3, jal4, mfhi3, mflo3, branch3, branch4, branch5, branch6, branch6b, branch7, branchResult, nop3, halt3,
	delay1, delay2, delay3,delay4, delay5, delay6, delay7, delay8,delayneg, delaynot, first_reset,first_resetA, delay21, delay22, delay9, delay10, SHRA3, SHRA4, fetch3, SHRA5,in3,out3);
	
signal present_state: state; 
	
begin
process(clock, reset)
begin
	if(reset='1') then
		present_state <= first_reset;
	elsif(clock'event and clock = '1') then
		case present_state is 
			when first_reset => 
				Present_state <= first_resetA; 
			when first_resetA => 
				Present_state <= reset_state; 
			
			when reset_state =>
				present_state <= fetch0;
			when fetch0 =>
				present_state <= fetch1;
			when fetch1 =>
				present_state <= delay21;
			when delay21 =>
				present_state <= delay22;
			when delay22 =>
				present_state <= fetch2;
			when fetch2 => present_state <= fetch3;
			when fetch3 =>
				case IR(31 downto 27) is
					when "00000" =>
						present_state <= load3;
					when "00001" =>
						present_state <= loadi3;
					when "00010" => 
						present_state <= store3;
					when "00011" =>
						present_state <= add3;
					when "00100" =>
						present_state <= sub3;
					when "00101" =>
						present_state <= and3;
					when "00110" =>
						present_state <= or3;
					when "00111" =>
						present_state <= shr3;
					when "01000" =>
						present_state <= shra3;
					when "01001" =>
						present_state <= shl3;
					when "01010" =>
						present_state <= ror3;
					when "01011" =>
						present_state <= rol3;
					when "01100" =>
						present_state <= addi3;
					when "01101" => 
						present_state <= andi3;
					when "01110" =>
						present_state <= ori3;
					when "01111" =>
						present_state <= mul3;
					when "10000" =>
						present_state <= div3;
					when "10001" =>
						present_state <= neg3;
					when "10010" =>
						present_state <= not3;
					when "10011" =>
						present_state <= branch3;
					when "10100" => 
						present_state <= jr3;
					when "10101" =>
						present_state <= jal3;
					when "10110" =>
						present_state <= in3;
					when "10111" =>
						present_state <= out3;
					when "11000" =>
						present_state <= mfhi3;
					when "11001" =>
						present_state <= mflo3;
					when "11010" =>
						present_state <= nop3;
					when "11011" =>
						present_state <= halt3;
					when others =>
				end case;
				
			when load3 =>
					present_state <= load4;
				when load4 =>
					present_state <= load5;
				when load5 =>
					present_state <= load6;
				when load6 =>
					present_state <= load6b;
				when load6b =>
					present_state <= delay1;
				when delay1 => present_state <= delay2;
				when delay2 => present_state <= load7;				
				when load7 =>
					present_state <= reset_state;
					
				when loadi3 =>
					present_state <= loadi4;
				when loadi4 =>
					present_state <= loadi5;
				when loadi5 =>
					present_state <= reset_state;
				
				when store3 =>
					present_state <= store4;
				when store4 =>
					present_state <= store5;
				when store5 =>
					present_state <= store6;
				when store6 =>
					present_state <= store6b;
				when store6b =>
					present_state <= delay3;
				when delay3 =>
					present_state <= delay4;
				when delay4 =>
					present_state <= store7;
				when store7 =>
					present_state <= reset_state;
				
				when add3 => 
					present_state <= add4;
				when add4 =>
					present_state <= add5;
				when add5 =>
					present_state <= reset_state;
				
				when addi3 =>
					present_state <= addi4;
				when addi4 =>
					present_state <= delay5;
				when delay5 =>
					present_state <= addi5;
				when addi5 =>
					present_state <= reset_state;
					
				when and3 =>
					present_state <= and4;
				when and4 =>
					present_state <= and5;
				when and5 =>
					present_state <= reset_state;
				
				when andi3 =>
					present_state <= andi4;
				when andi4 =>
					present_state <= delay6;
				when delay6 =>
					present_state <= andi5;
				when andi5 =>
					present_state <= reset_state;
			
				when or3 =>
					present_state <= or4;
				when or4 =>
					present_state <= or5;
				when or5 =>
					present_state <= reset_state;
				
				when ori3 =>
					present_state <= ori4;
				when ori4 =>
					present_state <= delay7;
				when delay7 => present_state <= ori5;
				when ori5 =>
					present_state <= reset_state;
			
				when neg3 =>
					present_state <= neg4;
				when neg4 =>present_state <= delayneg;
				when delayneg =>
					present_state <= neg5;
				when neg5 =>
					present_state <= reset_state;
				
				when ror3 =>
					present_state <= ror4;
				when ror4 =>
					present_state <= ror5;
				when ror5 =>
					present_state <= reset_state;
				
				when rol3 =>
					present_state <= rol4;
				when rol4 =>
					present_state <= rol5;
				when rol5 =>
					present_state <= reset_state;
				
				when shr3 =>
					present_state <= shr4;
				when shr4 =>
					present_state <= shr5;
				when shr5 =>
					present_state <= reset_state;
				
				when shl3 =>
					present_state <= shl4;
				when shl4 =>
					present_state <= shl5;
				when shl5 =>
					present_state <= reset_state;
				
				when sub3 =>
					present_state <= sub4;
				when sub4 =>
					present_state <= sub5;
				when sub5 =>
					present_state <= reset_state;
				
				when div3 =>
					present_state <= div4;
				when div4 =>
					present_state <= div5;
				when div5 =>
					present_state <= div6;
				when div6 =>
					present_state <= reset_state;
					
				when mul3 =>
					present_state <= mul4;
				when mul4 =>
					present_state <= mul5;
				when mul5 =>
					present_state <= mul6; 
				when mul6 => present_state <= reset_state;
								
				when mfhi3 =>
					present_state <= reset_state;
				
				when mflo3 =>
					present_state <= reset_state;
				
				when branch3 =>
					present_state <= delay8;
				when delay8 =>
					present_state <= delay9;
				when delay9 =>
					present_state <= branch4;
				when branch4 =>
					present_state <= delay10;
				when delay10 =>
					present_state <= branch5;
				when branch5 =>
					present_state <= branch6;
				when branch6 =>
					present_state <= reset_state;
					
				when jr3 => present_state <= reset_state;
				when jal3 => present_state <= jal4;
				when jal4=> present_state <= reset_state;

				when others =>
				
			end case;
		end if;
	end process;
	
	
	process(present_state)
		begin
			
		case present_state is
			when first_reset =>
				clear <= '1';
				run <= '1';
				
			when reset_state =>
				Gra <= '0'; Grb <= '0';	Grc <= '0'; Rin <= '0'; Rout <= '0';
				HIin <= '0'; LOin <= '0'; CONin <= '0'; PCin <= '0'; IRin <= '0';
				Yin <= '0'; Zin <= '0'; MARin <= '0'; MDRin <= '0'; OutPortin <= '0'; Cout <= '0'; BAout <= '0';
				PCout <= '0'; HIout <= '0'; LOout <= '0'; MDRout <= '0'; ZHIout <= '0'; ZLOout <= '0';
				and_op<= '0'; or_op<= '0'; add_op<= '0'; sub_op<= '0'; mul_op<= '0'; div_op<= '0'; shr_op<= '0';
				shl_op<= '0'; ror_op<= '0'; rol_op<= '0'; neg_op<= '0'; not_op<= '0'; inportOUT <= '0';
				IncPC <= '0'; clear <= '0'; readRam <= '0'; writeRAM <= '0'; shra_op <= '0';
			
			when fetch0 =>
				PCout <= '1', '0' after 25 ns;
				MARin <= '1', '0' after 25 ns;
				IncPC <= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when fetch1 =>
				ZLOout <= '1', '0' after 75 ns;
				PCin <= '1', '0' after 75 ns; 
				read_op<= '1' after 41 ns, '0' after 75 ns;
				readRAM <= '1', '0' after 75 ns;
				MDRin <= '1' after 41 ns, '0' after 75 ns;
				
			when fetch2 =>
				MDRout <= '1', '0' after 25 ns;   
				IRin <= '1', '0' after 25 ns;
							
			when load3 =>
				Grb <= '1', '0' after 25 ns;
				BAout <= '1', '0' after 25 ns;
				Yin <= '1', '0' after 25 ns;
			when load4 =>
				Cout <= '1', '0' after 25 ns;
				add_op<= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when load5 =>
				ZLOout <= '1', '0' after 20 ns;   
				MARin <= '1', '0' after 25 ns;
			when load6b =>
				read_op <= '1' after 41 ns, '0' after 85 ns;
				MDRin <= '1' after 41 ns, '0' after 85 ns;
				readRAM <= '1', '0' after 75 ns;
			when load7 =>
				MDRout <= '1' after 2 ns, '0' after 25 ns;
				Gra <= '1', '0' after 25 ns;
				Rin <= '1', '0' after 25 ns;
				
			when loadi3 =>
				Grb <= '1', '0' after 25 ns;
				BAout <= '1', '0' after 25 ns;
				Yin <= '1', '0' after 25 ns;
			when loadi4 =>
				Cout <= '1', '0' after 25 ns;
				add_op<= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when loadi5 =>
				ZLOout <= '1', '0' after 40 ns;   
				Gra <= '1', '0' after 40 ns; 
				Rin <= '1', '0' after 40 ns; 
				
			when andi3 =>
				Grb <= '1', '0' after 25 ns;
				BAout <= '1', '0' after 25 ns;
				Yin <= '1', '0' after 25 ns;
			when andi4 =>
				Cout <= '1', '0' after 25 ns;
				add_op<= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when andi5 => 
				ZLOout <= '1', '0' after 40 ns;   
				Gra <= '1', '0' after 40 ns; 
				Rin <= '1', '0' after 40 ns; 
				
			when addi3 =>
				Grb <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				Yin <= '1', '0' after 25 ns;
			when addi4 => 
				Cout <= '1', '0' after 25 ns;
				add_op <= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when addi5 =>
				ZLOout <= '1', '0' after 40 ns;   
				Gra <= '1', '0' after 40 ns; 
				Rin <= '1', '0' after 40 ns; 
			
			when ori3 =>
				Grb <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				Yin <= '1', '0' after 25 ns;
			when ori4 =>
				Cout <= '1', '0' after 25 ns;
				or_op <= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when ori5 =>
				ZLOout <= '1', '0' after 40 ns;   
				Gra <= '1', '0' after 40 ns; 
				Rin <= '1', '0' after 40 ns; 
		
			when store3 =>
				Grb <= '1', '0' after 25 ns;
				BAout <= '1' , '0' after 25 ns;
				Yin <= '1', '0' after 25 ns;
			when store4 =>
				Cout <= '1', '0' after 25 ns;
				add_op<= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when store5 =>
				ZLOout <= '1', '0' after 20 ns;
				MARin <= '1', '0' after 25 ns;
			when store6 =>
				Rout <= '1', '0' after 25 ns;
				MDRin <= '1', '0' after 25 ns; 
				Gra <= '1', '0' after 25 ns; 
			when store6b =>
				MDRout <= '1', '0' after 25 ns;
				writeRAM<= '1', '0' after 25 ns;
			when store7 =>
			   read_op <= '1' after 41 ns, '0' after 85 ns;
				MDRin <= '1' after 41 ns, '0' after 85 ns;
				readRAM <= '1', '0' after 75 ns;
			
			
			when branch3 =>
				Gra <= '1'  , '0' after 65 ns;
				Rout <= '1' , '0' after 65 ns;
				CONin <= '1' after 5 ns,'0' after 65 ns;
			when branch4 =>
				PCout <= '1', '0' after 25 ns;
				Yin <= '1', '0' after 25 ns;
			when branch5 =>
				Cout <= '1', '0' after 25 ns;
				add_op<= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when branch6 =>
				ZLOout <= '1';   
				if (conFF = '1') then PCin <= '1'; else PCin <= '0'; end if; 
	
			when jr3 =>
				Gra <= '1', '0' after 30 ns;
				Rout <= '1', '0' after 30 ns;
				PCin <= '1', '0' after 30 ns;
				
			when jal3 => 
				PCout <= '1', '0' after 25 ns;
				Grb <= '1', '0' after 25 ns;
				Rin <= '1', '0' after 25 ns;
			when jal4 => 
				Rout <= '1', '0' after 30 ns;
				Gra <= '1', '0' after 30 ns;
				PCin <= '1', '0' after 30 ns;
			
			when mfhi3 =>
				HIout <= '1', '0' after 30 ns;
				Gra <= '1', '0' after 30 ns;
				Rin <= '1', '0' after 30 ns;
			
			when mflo3 =>
				Gra <= '1', '0' after 30 ns;
				LOout <= '1', '0' after 30 ns;
				Rin <= '1', '0' after 30 ns;
				
			when in3 =>
				Gra <= '1', '0' after 30 ns;
				inportOUT <= '1', '0' after 30 ns;
				Rin <= '1', '0' after 30 ns;
				
			when out3 =>
				Gra <= '1', '0' after 30 ns;
				OutPortin<= '1', '0' after 30 ns;
				Rout <= '1', '0' after 30 ns;
				
				
			when sub3 => 
				Rout <= '1', '0' after 30 ns;
				Grb <= '1', '0' after 30 ns;
			   Yin <= '1', '0' after 30 ns;
			when sub4 => 
				Rout <= '1', '0' after 30 ns;
				Grc <= '1', '0' after 30 ns;
				sub_op <= '1', '0' after 30 ns;
			   Zin <= '1', '0' after 30 ns;
			when sub5 => 
				ZlOout <= '1', '0' after 30 ns;
				Rin <= '1', '0' after 30 ns;
				Gra <= '1', '0' after 30 ns;
				
			when add3 => 
				Rout <= '1', '0' after 30 ns;
				Grb <= '1', '0' after 30 ns;
			   Yin <= '1', '0' after 30 ns;
			when add4 => 
				Rout <= '1', '0' after 30 ns;
				Grc <= '1', '0' after 30 ns;
				add_op <= '1', '0' after 30 ns;
			   Zin <= '1', '0' after 30 ns;
			when add5 => 
				ZlOout <= '1', '0' after 30 ns;
				Rin <= '1', '0' after 30 ns;
				Gra <= '1', '0' after 30 ns;
				
			when or3 => 
				Rout <= '1', '0' after 30 ns;
				Grb <= '1', '0' after 30 ns;
			   Yin <= '1', '0' after 30 ns;
			when or4 => 
				Rout <= '1', '0' after 30 ns;
				Grc <= '1', '0' after 30 ns;
				or_op <= '1', '0' after 30 ns;
			   Zin <= '1', '0' after 30 ns;
			when or5 => 
				ZlOout <= '1', '0' after 30 ns;
				Rin <= '1', '0' after 30 ns;
				Gra <= '1', '0' after 30 ns;
			
			when and3 => 
				Rout <= '1', '0' after 30 ns;
				Grb <= '1', '0' after 30 ns;
			   Yin <= '1', '0' after 30 ns;
			when and4 => 
				Rout <= '1', '0' after 30 ns;
				Grc <= '1', '0' after 30 ns;
				and_op <= '1', '0' after 30 ns;
			   Zin <= '1', '0' after 30 ns;
			when and5 => 
				ZlOout <= '1', '0' after 30 ns;
				Rin <= '1', '0' after 30 ns;
				Gra <= '1', '0' after 30 ns;
			
			when mul3 => 
				Rout <= '1', '0' after 30 ns;
				Grb <= '1', '0' after 30 ns;
			   Yin <= '1', '0' after 30 ns;
			when mul4 => 
				Rout <= '1', '0' after 30 ns;
				Grb <= '1', '0' after 30 ns;
				mul_op <= '1', '0' after 30 ns;
			   Zin <= '1', '0' after 30 ns;
			when mul5 => 
				ZlOout <= '1', '0' after 30 ns;
				LOin <= '1', '0' after 30 ns;
			when mul6 => 
				ZHIout<= '1', '0' after 30 ns;
				HIin <= '1', '0' after 30 ns;
				
			when div3 => 
				Rout <= '1', '0' after 30 ns;
				Grb <= '1', '0' after 30 ns;
			   Yin <= '1', '0' after 30 ns;
			when div4 => 
				Rout <= '1', '0' after 30 ns;
				Grb <= '1', '0' after 30 ns;
				div_op <= '1', '0' after 30 ns;
			   Zin <= '1', '0' after 30 ns;
			when div5 => 
				ZlOout <=  '1', '0' after 30 ns;
				LOin<=  '1', '0' after 30 ns;
			when div6 => 
				ZHIout<= '1', '0' after 30 ns;
				HIin <=  '1', '0' after 30 ns;
			
			when not3 =>
				Rout <= '1', '0' after 30 ns;
				Grb <= '1', '0' after 30 ns;
				not_op <= '1', '0' after 30 ns;
			   Zin <= '1', '0' after 30 ns;
			when not4 => 
				ZlOout <=  '1', '0' after 35 ns;
				Gra <=  '1', '0' after 35 ns;
				Rin <=  '1', '0' after 35 ns;	
				
			when neg3 =>
				Rout <= '1', '0' after 30 ns;
				Grb <= '1', '0' after 30 ns;
				neg_op <= '1', '0' after 30 ns;
			   Zin <= '1', '0' after 30 ns;
			when neg4 => 
				ZlOout <=  '1', '0' after 35 ns;
				Gra <=  '1', '0' after 35 ns;
				Rin <=  '1', '0' after 35 ns;	
			
			when shr3 =>
				Rout <= '1', '0' after 30 ns;
				Grb <= '1', '0' after 30 ns;
				Yin <= '1', '0' after 30 ns;
			when shr4 => 
				Rout <= '1', '0' after 30 ns;
				Grc <= '1', '0' after 30 ns;
				shr_op <= '1', '0' after 30 ns;
				Zin <= '1', '0' after 30 ns;	
			when shr5 => 
				ZlOout <= '1', '0' after 30 ns;
				Gra <= '1', '0' after 30 ns;
				Rin <= '1', '0' after 30 ns;	
				
			when shra3 =>
				Rout <= '1', '0' after 30 ns;
				Grb <= '1', '0' after 30 ns;
				Yin <= '1', '0' after 30 ns;
			when shra4 => 
				Rout <= '1', '0' after 30 ns;
				Grc <= '1', '0' after 30 ns;
				shra_op <= '1', '0' after 30 ns;
				Zin <= '1', '0' after 30 ns;	
			when shra5 => 
				ZlOout <= '1', '0' after 30 ns;
				Gra <= '1', '0' after 30 ns;
				Rin <= '1', '0' after 30 ns;
			 
			 when shl3 =>
				Rout <= '1', '0' after 30 ns;
				Grb <= '1', '0' after 30 ns;
				Yin <= '1', '0' after 30 ns;
			when shl4 => 
				Rout <= '1', '0' after 30 ns;
				Grc <= '1', '0' after 30 ns;
				shl_op <= '1', '0' after 30 ns;
				Zin <= '1', '0' after 30 ns;	
			when shl5 => 
				ZlOout <= '1' after 5 ns, '0' after 30 ns;
				Gra <= '1', '0' after 30 ns;
				Rin <= '1', '0' after 30 ns;
				
			when rol3 =>
				Rout <= '1', '0' after 30 ns;
				Grb <= '1', '0' after 30 ns;
				Yin <= '1', '0' after 30 ns;
			when rol4 => 
				Rout <= '1', '0' after 30 ns;
				Grc <= '1', '0' after 30 ns;
				rol_op <= '1', '0' after 30 ns;
				Zin <= '1', '0' after 30 ns;	
			when rol5 => 
				ZlOout <= '1', '0' after 30 ns;
				Gra <= '1', '0' after 30 ns;
				Rin <= '1', '0' after 30 ns;
				
			when ror3 =>
				Rout <= '1', '0' after 30 ns;
				Grb <= '1', '0' after 30 ns;
				Yin <= '1', '0' after 30 ns;
			when ror4 => 
				Rout <= '1', '0' after 30 ns;
				Grc <= '1', '0' after 30 ns;
				ror_op <= '1', '0' after 30 ns;
				Zin <= '1', '0' after 30 ns;	
			when ror5 => 
				ZlOout <= '1', '0' after 30 ns;
				Rin <= '1', '0' after 30 ns;
				Gra <= '1', '0' after 30 ns;
			when nop3 => 
			when halt3 => 
				run <= '0';

			when others =>
		end case;
	end process;
end architecture;
				
				