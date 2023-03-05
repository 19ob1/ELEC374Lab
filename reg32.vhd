library ieee;
use ieee.std_logic_1164.all;

entity reg32 is 
	port(
			inputd : in std_logic_vector(31 downto 0);
			outputq : out std_logic_vector(31 downto 0);
			clk, clear, enable : in std_logic
	);
end entity;

architecture behaviour of reg32 is 
begin
reg32 : process(clk, clear)
begin
	if(clear = '1') then
		outputq <= (others => '0');
	elsif (rising_edge(clk))	then
		if(enable = '1') then
			outputq <= inputd;
		end if;
	end if;
end process;
end architecture;