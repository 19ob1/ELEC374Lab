library ieee;
use ieee.std_logic_1164.all;


entity MARreg is 
	port(
			inputd : in std_logic_vector(31 downto 0);
			outputq : out std_logic_vector(8 downto 0);
			clear, clk, enable : in std_logic
	);
end entity;

architecture behaviour of MARreg is 
begin
process(clk, clear)
begin
	if(clear = '1') then
		outputq <= (others => '0');
	elsif (clk'event and clk = '1')	then
		if(enable = '1') then
			outputq <= inputd(8 downto 0);
		end if;
	end if;
end process;
end architecture;