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
	
	process(A,B)
	variable count :integer; 
	variable Atemp, Btemp : std_logic_vector(31 downto 0);
	variable savebit: std_logic; 
	
	begin
			Atemp := A; 
			Btemp := B; 
		
			--for i in 0 to to_integer(signed(B)) loop -DOESNT WORK IT UPPER BOUND NEEDS TO BE CONSTANT DURING SYNTHESIS
				--savebit := Atemp(31);
				--Atemp := std_logic_vector(shift_left(unsigned(Atemp), 1));
				--Atemp(0) := savebit; 
				--output <= Atemp; 
			--end loop; 
		-- output <= std_logic_vector(rotate_left(unsigned(A), to_integer(signed(B))));
		--HAVE TO DO ONE AT A TIME
		case Btemp is
        when "00000000000000000000000000000001" =>
				-- savebit := Atemp(31);
				-- output <= std_logic_vector(rotate_left(unsigned(Atemp), 1)));
				-- output (0) <= savebit; 
            output(31 downto 1) <= Atemp(30 downto 0);
            output(0) <= Atemp(31);
        when "00000000000000000000000000000010" =>
            output(31 downto 2) <= Atemp(29 downto 0);
            output(1 downto 0) <= Atemp(31 downto 30);
        when "00000000000000000000000000000011" =>
            output(31 downto 3) <= Atemp(28 downto 0);
            output(2 downto 0) <= Atemp(31 downto 29);
        when "00000000000000000000000000000100" =>
            output(31 downto 4) <= Atemp(27 downto 0);
            output(3 downto 0) <= Atemp(31 downto 28);
        when "00000000000000000000000000000101" =>
            output(31 downto 5) <= Atemp(26 downto 0);
            output(4 downto 0) <= Atemp(31 downto 27);
        when "00000000000000000000000000000110" =>
            output(31 downto 6) <= Atemp(25 downto 0);
            output(5 downto 0) <= Atemp(31 downto 26);
        when "00000000000000000000000000000111" =>
            output(31 downto 7) <= Atemp(24 downto 0);
            output(6 downto 0) <= Atemp(31 downto 25);
        when "00000000000000000000000000001000" =>
            output(31 downto 8) <= Atemp(23 downto 0);
            output(7 downto 0) <= Atemp(31 downto 24);
        when "00000000000000000000000000001001" =>
            output(31 downto 9) <= Atemp(22 downto 0);
            output(8 downto 0) <= Atemp(31 downto 23);
        when "00000000000000000000000000001010" =>
            output(31 downto 10) <= Atemp(21 downto 0);
            output(9 downto 0) <= Atemp(31 downto 22);
        when "00000000000000000000000000001011" =>
            output(31 downto 11) <= Atemp(20 downto 0);
            output(10 downto 0) <= Atemp(31 downto 21);
        when "00000000000000000000000000001100" =>
            output(31 downto 12) <= Atemp(19 downto 0);
            output(11 downto 0) <= Atemp(31 downto 20);
        when "00000000000000000000000000001101" =>
            output(31 downto 13) <= Atemp(18 downto 0);
            output(12 downto 0) <= Atemp(31 downto 19);
        when "00000000000000000000000000001110" =>
            output(31 downto 14) <= Atemp(17 downto 0);
            output(13 downto 0) <= Atemp(31 downto 18);
        when "00000000000000000000000000001111" =>
            output(31 downto 15) <= Atemp(16 downto 0);
            output(14 downto 0) <= Atemp(31 downto 17);
        when "00000000000000000000000000010000" =>
            output(31 downto 16) <= Atemp(15 downto 0);
            output(15 downto 0) <= Atemp(31 downto 16);
        when "00000000000000000000000000010001" =>
            output(31 downto 17) <= Atemp(14 downto 0);
            output(16 downto 0) <= Atemp(31 downto 15);
        when "00000000000000000000000000010010" =>
            output(31 downto 18) <= Atemp(13 downto 0);
            output(17 downto 0) <= Atemp(31 downto 14);
        when "00000000000000000000000000010011" =>
            output(31 downto 19) <= Atemp(12 downto 0);
            output(18 downto 0) <= Atemp(31 downto 13);
        when "00000000000000000000000000010100" =>
            output(31 downto 20) <= Atemp(11 downto 0);
            output(19 downto 0) <= Atemp(31 downto 12);
        when "00000000000000000000000000010101" =>
            output(31 downto 21) <= Atemp(10 downto 0);
            output(20 downto 0) <= Atemp(31 downto 11);
        when "00000000000000000000000000010110" =>
            output(31 downto 22) <= Atemp(9 downto 0);
            output(21 downto 0) <= Atemp(31 downto 10);
        when "00000000000000000000000000010111" =>
            output(31 downto 23) <= Atemp(8 downto 0);
            output(22 downto 0) <= Atemp(31 downto 9);
        when "00000000000000000000000000011000" =>
            output(31 downto 24) <= Atemp(7 downto 0);
            output(23 downto 0) <= Atemp(31 downto 8);
        when "00000000000000000000000000011001" =>
            output(31 downto 25) <= Atemp(6 downto 0);
            output(24 downto 0) <= Atemp(31 downto 7);
        when "00000000000000000000000000011010" =>
            output(31 downto 26) <= Atemp(5 downto 0);
            output(25 downto 0) <= Atemp(31 downto 6);
        when "00000000000000000000000000011011" =>
            output(31 downto 27) <= Atemp(4 downto 0);
            output(26 downto 0) <= Atemp(31 downto 5);
        when "00000000000000000000000000011100" =>
            output(31 downto 28) <= Atemp(3 downto 0);
            output(27 downto 0) <= Atemp(31 downto 4);
        when "00000000000000000000000000011101" =>
            output(31 downto 29) <= Atemp(2 downto 0);
            output(28 downto 0) <= Atemp(31 downto 3);
        when "00000000000000000000000000011110" =>
            output(31 downto 30) <= Atemp(1 downto 0);
            output(29 downto 0) <= Atemp(31 downto 2);
        when "00000000000000000000000000011111" =>
            output(31) <= Atemp(0);
            output(30 downto 0) <= Atemp(31 downto 1);
        when others => 
            output <= Atemp;
    end case;
		
end process; 
end architecture behavioural;