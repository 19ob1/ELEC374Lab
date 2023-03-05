library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std;
use ieee.std_logic_signed.all;
library work;

entity NEG32 is
	port(
		Areg : in std_logic_vector(31 downto 0);
		Z : out std_logic_vector(31 downto 0)
	);
end entity;


architecture behaviour of NEG32 is

signal result : std_logic_vector(31 downto 0);

begin
negate: process(Areg, result)
begin
	for i in 0 to 31 loop
		if Areg(i) = '0' then
			result(i) <= '1';
		else 
			result(i) <= '0'; 
		end if;
	end loop;
	
	Z <= result + '1'; 
end process;
end architecture;