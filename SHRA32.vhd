library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity SHRA32 is
port(

    A : in std_logic_vector(31 downto 0);
    B : in std_logic_vector(31 downto 0);
    output : out std_logic_vector(31 downto 0)
);
end entity;

architecture behaviour of SHRA32 is
begin

process(A, B)
variable BTemp : integer;
begin
BTemp := to_integer(unsigned(B));
output <= std_logic_vector(shift_right(signed(A), BTemp));
end process;
end behaviour;