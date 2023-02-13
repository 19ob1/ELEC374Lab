library ieee;
use ieee.std_logic_1164.all;

entity genReg32 is
port(
	inputD : in std_logic_vector (31 downto 0);
	clr, clk, enable : in std_logic;
		
	outputQ : out std_logic_vector (31 downto 0)
);
end entity genReg32;

architecture synth of genReg32 is
begin
	genReg32Proc : process (clr, clk) is
		begin
			if (clr) = '1') then
				inputD <= "00000000000000000000000000000000";
			elsif (rising_edge(clk)) then
				if (enable = '1') then
					inputD <= outputQ;
				end if;
			end if;
		end process genReg32Proc;
end architecture synth;