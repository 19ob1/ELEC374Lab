library ieee;
use ieee.std_logic_1164.all;

entity ADD32 is
	port(
		A : in std_logic_vector(31 downto 0);
		B : in std_logic_vector(31 downto 0);
		result : out std_logic_vector(31 downto 0)
		);
end entity;

architecture behaviour of ADD32 is

begin
	process(A, B)
	variable carry : std_logic_vector(32 downto 0);
	begin
		carry(0) := '0';
		for i in 0 to 31 loop
			result(i) <= A(i) xor B(i) xor carry(i); -- carry to next 
			carry(i+1) := (A(i) and B(i)) or (carry(i) and (A(i) or B(i)));
		end loop;
	end process;	
end architecture;