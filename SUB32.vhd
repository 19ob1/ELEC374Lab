library IEEE;
use IEEE.std_logic_1164.all;

entity SUB32 is
port(
		A : in std_logic_vector(31 downto 0);
		B : in std_logic_vector(31 downto 0);
		output : out std_logic_vector(31 downto 0)
	);
end entity;


architecture behaviour of SUB32 is

signal temp : std_logic_vector(31 downto 0);

component NEG32 is
port(

    Areg: in std_logic_vector(31 downto 0);
    Z: out std_logic_vector(31 downto 0)
);
end component;

component ADD32 is
port(
      A : in std_logic_vector(31 downto 0);
		B : in std_logic_vector(31 downto 0);
		result : out std_logic_vector(31 downto 0)
);
end component;

begin
SUBNEG : NEG32 port map(Areg => B, Z => temp);   
SUBADD : ADD32 port map(A => A, B => temp, result => output);
end behaviour;

