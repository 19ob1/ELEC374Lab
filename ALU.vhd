library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
library work;


entity ALU is
port(
	Ain : in std_logic_vector(31 downto 0);
	Bin : in std_logic_vector(31 downto 0);
	and_op : in std_logic;
	or_op: in std_logic;
	not_op : in std_logic;
	add_op : in std_logic;
	sub_op: in std_logic;
	shr_op : in std_logic;
	ror_op : in std_logic;
	shl_op : in std_logic;
	rol_op : in std_logic;
	neg_op : in std_logic;
	mult_op: in std_logic;
	div_op: in std_logic;
	incPc: in std_logic; 
	shra_op: in std_logic; 
	Zreg : out std_logic_vector(63 downto 0)
);
end entity ALU;

architecture behavioural of ALU is

component AND32 is port(
		A, B : in std_logic_vector(31 downto 0);
		Z : out std_logic_vector(31 downto 0)
		);
end component; 

component OR32 is port(
		A, B : in std_logic_vector(31 downto 0);
		Z : out std_logic_vector(31 downto 0)
		);
end component; 

component NOT32 is port(
		A : in std_logic_vector(31 downto 0);
		Z : out std_logic_vector(31 downto 0)
		);
end component; 

component ADD32 is
	port(
		A, B : in std_logic_vector(31 downto 0);
		result : out std_logic_vector(31 downto 0)
		);
		
end component;

component NEG32 is
	port(
		Areg : in std_logic_vector(31 downto 0);
		Z : out std_logic_vector(31 downto 0)
	);
end component;

component SUB32 is
port(
		A : in std_logic_vector(31 downto 0);
		B : in std_logic_vector(31 downto 0);
		output : out std_logic_vector(31 downto 0)
	);
end component;

component SHR32 is
port(
		A: in std_logic_vector(31 downto 0);
		B : in std_logic_vector(31 downto 0);
		output: out std_logic_vector(31 downto 0)
		);
end component;


component SHRA32 is
port(
		A: in std_logic_vector(31 downto 0);
		B : in std_logic_vector(31 downto 0);
		output: out std_logic_vector(31 downto 0)
		);
end component;

component SHL32 is
port(A: in std_logic_vector(31 downto 0);
			B: in std_logic_vector(31 downto 0);
			output: out std_logic_vector(31 downto 0));
end component;

component ROR32 is
	port(A: in std_logic_vector(31 downto 0);
			B: in std_logic_vector(31 downto 0);
			output: out std_logic_vector(31 downto 0));
end component;

component ROL32 is
	port(A: in std_logic_vector(31 downto 0);
			B: in std_logic_vector(31 downto 0);
			output: out std_logic_vector(31 downto 0));
end component;

component MUL32 is
	port(multiplicand, multiplier: in std_logic_vector(31 downto 0);
			out_product: out std_logic_vector(63 downto 0));
end component;

component DIV32 is 
	port(dividend, divisor: in std_logic_vector(31 downto 0);
			quotient: out std_logic_vector(63 downto 0));
end component;

-- define internal signals
signal add_result : std_logic_vector(31 downto 0);
signal or_result : std_logic_vector(31 downto 0);
signal not_result : std_logic_vector(31 downto 0);
signal neg_result: std_logic_vector(31 downto 0);
signal and_result : std_logic_vector(31 downto 0);
signal sub_result : std_logic_vector(31 downto 0);
signal shr_result : std_logic_vector(31 downto 0);
signal shl_result : std_logic_vector(31 downto 0);
signal shra_result : std_logic_vector(31 downto 0);
signal ror_result : std_logic_vector(31 downto 0);
signal rol_result : std_logic_vector(31 downto 0);
signal mul_result : std_logic_vector(63 downto 0);
signal div_result : std_logic_vector(63 downto 0);
signal pc_result : std_logic_vector(31 downto 0);


-- map components
begin

andoperation: AND32 port map(A=> Ain, B => Bin, Z => and_result);
oroperation:  OR32 port map(A=> Ain, B => Bin, Z => or_result);
notoperation: NOT32 port map(A=> Ain, Z => not_result);
addition : ADD32 port map(A => Ain, B => Bin, result => add_result);
negation:  NEG32 port map(Areg => Ain, Z => neg_result);
substraction: SUB32 port map(A => Ain, B => Bin, output => sub_result);
shiftA: SHRA32 port map(A => Ain, B => Bin, output => shra_result);
shifttoright: SHR32 port map(A => Ain, B => Bin, output => shr_result);
shiftoleft: SHL32 port map(A => Ain, B => Bin, output => shl_result);
rotateright: ROR32 port map(A => Ain, B => Bin, output => ror_result);
rotateleft: ROL32 port map(A => Ain, B => Bin, output => rol_result);
multiplication: MUL32 port map(multiplicand => Ain, multiplier => Bin, out_product => mul_result);
division: DIV32 port map(dividend => Ain, divisor => Bin, quotient => div_result);
incrementPC : ADD32  port map(A => x"00000001", B => Bin, result => pc_result);


ALU: process(Ain, Bin, and_op, or_op, not_op, add_op, sub_op, shr_op, ror_op, shl_op, rol_op, neg_op, mult_op, div_op, incPC, shra_op,
				 add_result,and_result, or_result, not_result, sub_result, neg_result, pc_result, shra_result, shr_result, shl_result, ror_result, rol_result, mul_result, div_result) is
begin
	if (and_op = '1') then 
		Zreg(63 downto 32) <= (others => '0');
		Zreg(31 downto 0) <= and_result;
	elsif(or_op ='1') then
		Zreg(63 downto 32) <= (others => '0');
		Zreg(31 downto 0) <= or_result;
	elsif(not_op = '1') then
		Zreg(63 downto 32) <= (others => '0');
		Zreg(31 downto 0) <= not_result;
	elsif(add_op = '1') then
		Zreg(63 downto 32) <= (others => '0');
		Zreg(31 downto 0) <= add_result;
	elsif(sub_op = '1') then
		ZReg(63 downto 32) <= (others => '0');
		ZReg(31 downto 0) <= sub_result;
	elsif(neg_op = '1') then
		Zreg(63 downto 32) <= (others => '1');
		Zreg(31 downto 0) <= neg_result;
	elsif(rol_op = '1') then
		Zreg(63 downto 32) <= (others => '0');
		Zreg(31 downto 0) <= rol_result;
	elsif(ror_op = '1') then
		Zreg(63 downto 32) <= (others => '0');
		Zreg(31 downto 0) <= ror_result;
	elsif(shr_op = '1') then
		Zreg(63 downto 32) <= (others => '0');
		Zreg(31 downto 0) <= shr_result;
	elsif(shl_op = '1') then
		Zreg(63 downto 32) <= (others => '0');
		Zreg(31 downto 0) <= shl_result;
	elsif(mult_op = '1') then
		Zreg(63 downto 0) <= mul_result;
	elsif(div_op = '1') then
		Zreg(63 downto 0) <= div_result;
	elsif(incPC = '1') then 
		Zreg(63 downto 32) <= (others => '0');
		Zreg(31 downto 0) <= pc_result;
	elsif (shra_op = '1') then
    ZReg(63 downto 32) <= (others => '0');
	 ZReg(31 downto 0) <= shra_result;
	else
		Zreg <= "0000000000000000000000000000000000000000000000000000000000000000";
	end if; 
end process; 
end architecture; 