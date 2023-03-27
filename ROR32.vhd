library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity ROR32 is
	port( A: in std_logic_vector(31 downto 0);
			B: in std_logic_vector(31 downto 0);
			output: out std_logic_vector(31 downto 0));
end entity ROR32;

architecture behavioural of ROR32 is
begin	
	

	output<= std_logic_vector(rotate_right(unsigned(A), to_integer(signed(B))));
			
		
			--output <= "00000000000000000000000000000000";
			--for i in 0 to to_integer(signed(B)) loop -DOESNT WORK IT UPPER BOUND NEEDS TO BE CONSTANT DURING SYNTHESIS
				--savebit := Atemp(0);
				--Atemp := std_logic_vector(shift_right(unsigned(Atemp), 1));
				--Atemp(31) := savebit; 
				--output <= Atemp; 
			--end loop; 
		-- output <= std_logic_vector(rotate_right(unsigned(A), to_integer(signed(B))));
		--HAVE TO DO ONE AT A TIME
		
				
       
 
end architecture behavioural;