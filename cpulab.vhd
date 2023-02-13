library ieee;
use ieee.std_logic_1164.all;

entity my_logic is
	port(	a,b, clk : in std_logic;
			f	: out std_logic);
end entity;

architecture synth of my_logic is

signal c : std_logic_vector(1 downto 0);


component genReg32 is
port(
	inputD : in std_logic_vector (31 downto 0);
	clr, clk, enable : in std_logic;
		
	outputQ : out std_logic_vector (31 downto 0)
);
end component;

begin

	my_reg : genReg32 port map(inputD => a, clr => b, clk => c);

	my_sync : process (clk)
		c(0) <= a;
		c(1) <= b;
		
		f <= (a AND b) OR (a AND NOT b);
	end process

end architecture;