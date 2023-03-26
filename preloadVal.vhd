library IEEE;
use IEEE.std_logic_1164.all;

entity preloadVal is 
	port(
		en : in std_logic;
		manualEntry : in std_logic;
		seloutput : in std_logic;
		enable : out std_logic
	);
end entity;

architecture logic of preloadVal is
begin
process(en, manualEntry, seloutput)
begin
	if en = '0' then
		enable <= manualEntry;
	else
		enable <= seloutput;
	end if;
end process;
end architecture;