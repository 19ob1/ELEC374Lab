library ieee;
use ieee.std_logic_1164.all;

entity regZ is
port(
	inputD : in std_logic_vector (63 downto 0);
	clr, clk, enable : in std_logic;
		
	outputQ : out std_logic_vector (63 downto 0)
);
end entity regZ;

architecture synth of regZ is
begin
	regZProc : process (clr, clk) is
		begin
			if (clr) = '1') then
				inputD <= "0000000000000000000000000000000000000000000000000000000000000000";
			elsif (rising_edge(clk)) then
				if (enable = '1') then
					inputD <= outputQ;
				end if;
			end if;
		end process regZProc;
end architecture synth;