library ieee;
use ieee.std_logic_1164.all;
library work;

entity MDR is
	port(
			bus_output, memory_data_in : in std_logic_vector(31 downto 0);
			MDR_out : out std_logic_vector(31 downto 0);
			clear, clk, enable, read_mux : in std_logic
	);
end entity MDR;

architecture behaviour of MDR is
signal connect_wire : std_logic_vector(31 downto 0);

component reg32 is
	port(
		inputd : in std_logic_vector(31 downto 0);
		outputq : out std_logic_vector(31 downto 0);
		clear, clk, enable : in std_logic
	);
end component reg32;	

begin

MDRregister : reg32
	port map(
		inputd => connect_wire,
		enable => enable,
		clk => clk,
		clear => clear,
		outputq => MDR_out
	);

process(read_mux, bus_output)
begin 
case read_mux is 
	when '0' => 
		 connect_wire <= bus_output; 
   when '1' => 
		 connect_wire <= memory_data_in; 
   when others =>
		 connect_wire <= bus_output; 
end case; 
end process; 
end architecture;