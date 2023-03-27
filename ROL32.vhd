library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity ROL32 is
	port( A: in std_logic_vector(31 downto 0);
			B: in std_logic_vector(31 downto 0);
			output: out std_logic_vector(31 downto 0));
end entity ROL32;

architecture behavioural of ROL32 is
begin	
	output <= std_logic_vector(rotate_left(unsigned(A), to_integer(signed(B))));
	
		
			--for i in 0 to to_integer(signed(B)) loop -DOESNT WORK IT UPPER BOUND NEEDS TO BE CONSTANT DURING SYNTHESIS
				--savebit := Atemp(31);
				--Atemp := std_logic_vector(shift_left(unsigned(Atemp), 1));
				--Atemp(0) := savebit; 
				--output <= Atemp; 
			--end loop; 
		-- output <= std_logic_vector(rotate_left(unsigned(A), to_integer(signed(B))));
		--HAVE TO DO ONE AT A TIME
end architecture behavioural;