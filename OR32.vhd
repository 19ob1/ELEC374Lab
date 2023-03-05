library IEEE;
use IEEE.std_logic_1164.all;

entity OR32 is
port(

    A: in std_logic_vector(31 downto 0);
    B: in std_logic_vector(31 downto 0);
    Z: out std_logic_vector(31 downto 0)
);
end entity;

architecture behaviour of OR32 is

begin

process(A, B)
begin
or_loop : for i in 0 to 31 loop
    Z(i) <= A(i) or B(i);
end loop or_loop;
end process;
end behaviour;