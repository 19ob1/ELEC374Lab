library IEEE;
use IEEE.std_logic_1164.all;


entity encoder32to5 is port(
      in0, in1, in2, in3, in4 , in5, in6 , in7 , in8 , in9, in10, in11, in12, 
		in13, in14, in15, inHi,inLo, inZhigh, inZlow, inPc, inMdr, inport, inC: in std_logic;
		
		output: out std_logic_vector(4 downto 0)
);

end entity; 

architecture behaviour of encoder32to5 is 
begin

output <= 
						"00000" when in0 = '1' else 
						"00001" when in1 = '1' else
						"00010" when in2 = '1' else
						"00011" when in3 = '1' else
						"00100" when in4 = '1' else
						"00101" when in5 = '1' else
						"00110" when in6 = '1' else
						"00111" when in7 = '1' else
						"01000" when in8 = '1' else
						"01001" when in9 = '1' else
						"01010" when in10 = '1' else
						"01011" when in11 = '1' else
						"01100" when in12 = '1' else
						"01101" when in13 = '1' else
						"01110" when in14 = '1' else
						"01111" when in15 = '1' else
						"10000" when inHi = '1' else
						"10001" when inLo = '1' else
						"10010" when inZhigh = '1' else
						"10011" when inZlow = '1' else
						"10100" when inPc = '1' else
						"10101" when inMdr = '1' else
						"10110" when inport = '1' else
						"10111" when inC = '1' else
						"11000"; 
end architecture;





			