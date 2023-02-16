library ieee;
use ieee.std_logic_1164.all;

entity MDR is
	port(
		BusMuxOut, MdataIn: in std_logic_vector(31 downto 0);
		ReadIn, Clr, Clk, MDRIn: in std_logic;
		MDROut: out std_logic_vector(31 downto 0)
	);
end entity MDR;

architecture behaviour of MDR is
begin

	process (Clr, Clk, MDRIn, MdataIn, MDROut, ReadIn)
	begin
	
		if Clr = '1' then 
			MDROut <= "00000000";
		else
			if rising_edge(Clk) then
				if MDRIn '1' then
					if(ReadIn = '0') then
						MDROut <= BusMuxOut;
					elsif
						MDROut <= MdataIn;
					end if;
				end if;
			end if;
		end if;
		
	end process;
	
end architecture;

