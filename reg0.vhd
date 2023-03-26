library ieee;
use ieee.std_logic_1164.all;

entity reg0 is
	port(
			inputd : in std_logic_vector(31 downto 0);
			outputq : out std_logic_vector(31 downto 0);
			clear, clk, enable : in std_logic;
			BAout : in std_logic
	);
end entity reg0;

architecture behaviour of reg0 is
begin
process(clk, clear, BAout)
begin
	if(clear = '1') then
		outputq <= (others => '0');
	elsif(BAout = '1') then
		outputq <= (others => '0');
	elsif (clk'event and clk = '1')	then
		if(enable = '1') then
			outputq <= inputd;
		end if;
	end if;
end process;
end architecture behaviour;