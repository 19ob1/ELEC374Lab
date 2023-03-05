library IEEE;
use IEEE.std_logic_1164.all;

entity NOT32 is
port(

    A: in std_logic_vector(31 downto 0);
    Z: out std_logic_vector(31 downto 0)
);
end entity;

architecture behaviour of NOT32 is

begin

process(A)
begin
not_loop : for i in 0 to 31 loop
    Z(i) <= not A(i);
end loop not_loop;
end process;
end behaviour;