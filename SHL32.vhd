library IEEE;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity SHL32 is 
port(
			A: in std_logic_vector(31 downto 0);
			B: in std_logic_vector(31 downto 0);
			output: out std_logic_vector(31 downto 0)
);
end entity SHL32;

architecture behavioural of SHL32 is
begin	

process(A, B)
variable BTemp : integer;
begin
BTemp := to_integer(unsigned(B));
output<= std_logic_vector(shift_left(unsigned(A), BTemp));
end process; 
end architecture behavioural;


