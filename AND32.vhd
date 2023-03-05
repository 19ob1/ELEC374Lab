library IEEE;
use IEEE.std_logic_1164.all;

entity AND32 is
port(

    A: in std_logic_vector(31 downto 0);
    B: in std_logic_vector(31 downto 0);
    Z: out std_logic_vector(31 downto 0)
);
end entity;

architecture behaviour of AND32 is

begin

process(A, B)
begin
and_loop : for i in 0 to 31 loop
    Z(i) <= A(i) and B(i);
end loop and_loop;
end process;
end behaviour;