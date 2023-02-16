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

component encoder32to5 is
	port(
		encoderInput: in std_logic_vector(31 downto 0);
		s_out: out std_logic_vector(4 downto 0);
	);
end component;

component busMux is
	port(
		r0In, r1In, r2In, r3In, r4In, r5In,
		r6In, r7In, r8In, r9In, r10In, r11In, 
		r12In, r13In, r14In, r15In, HIIn, LOIn,
		ZHighIn, ZLowIn, PCIn, MDRIn, portIn, CIn : in std_logic_vector(31 downto 0);
		sel : in std_logic_vector(4 downto 0);
		busMuxOut : out std_logic_vector (31 downto 0);
	);
end component

component MDR is
	port(
		BusMuxOut, MdataIn: in std_logic_vector(31 downto 0);
		ReadIn, Clr, Clk, MDRIn: in std_logic;
		MDROut: out std_logic_vector(31 downto 0)
	);
end component MDR;

begin

	my_reg : genReg32 port map(inputD => a, clr => b, clk => c);

	my_sync : process (clk)
		c(0) <= a;
		c(1) <= b;
		
		f <= (a AND b) OR (a AND NOT b);
	end process

end architecture;