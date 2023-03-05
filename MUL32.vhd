library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity MUL32 is port (
				multiplicand, multiplier : in std_logic_vector(31 downto 0);
			   out_product : out std_logic_vector(63 downto 0)
);
end entity MUL32;

architecture behavioral of MUL32 is
begin
	out_product<= "0000000000000000000000000000000000000000000000000000000000000000";
end behavioral;