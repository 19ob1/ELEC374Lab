library ieee;
use ieee.std_logic_1164.all;

entity conFF is
	port(
		BusMuxOut : in std_logic_vector(31 downto 0);
		IRinput : in std_logic_vector(31 downto 0);
		CONFFinput : in std_logic;
		CONFFoutput : out std_logic
	);
end entity conFF;

architecture behaviour of conFF is
signal decoderOutput : std_logic_vector(3 downto 0);
signal C2 : std_logic_vector(1 downto 0);
signal orBusMuxOut : std_logic; 
signal con : std_logic;

begin
	process(C2, BusMuxOut, decoderOutput, orBusMuxOut, IRinput,CONFFinput, con)
	begin
	
	orBusMuxOut <= (BusMuxOut(31) or  BusMuxOut(30) or BusMuxOut(29) or	BusMuxOut(28) or BusMuxOut(27) 
	or BusMuxOut(26) or BusMuxOut(25) or BusMuxOut(24) or BusMuxOut(23) or BusMuxOut(22) or BusMuxOut(21)
	or BusMuxOut(20) or BusMuxOut(19) or BusMuxOut(18) or BusMuxOut(17) or BusMuxOut(16) or BusMuxOut(15)
	or BusMuxOut(14) or BusMuxOut(13) or BusMuxOut(12) or BusMuxOut(11) or BusMuxOut(10) or BusMuxOut(9)
	or BusMuxOut(8) or BusMuxOut(7) or BusMuxOut(6) or BusMuxOut(5) or BusMuxOut(4) or BusMuxOut(3)
	or BusMuxOut(2) or BusMuxOut(1) or BusMuxOut(0) );
	
	C2 <= IRinput(20 downto 19);
	
	case(C2) is
		when "00" => 
			decoderOutput <= "0001";
		when "01"  =>
			decoderOutput <= "0010";
		when "10" =>
			decoderOutput <= "0100";
		when "11" => 
			decoderOutput <= "1000";
		when others =>
			decoderOutput <= "0000";
	end case;
	
	con <= ((not orBusMuxOut and decoderOutput(0)) or 
	       (orBusMuxOut and decoderOutput(1)) or 
			 (not BusMuxOut(31) and decoderOutput(2)) or 
			 (BusMuxOut(31) and decoderOutput(3)));
	
	-- CON register 
	if(CONFFinput ='1') then
		CONFFoutput <= con;
	end if;
	
	end process;
end architecture behaviour;