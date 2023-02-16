library ieee;
use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;

entity busMux is
	port(
		r0In, r1In, r2In, r3In, r4In, r5In,
		r6In, r7In, r8In, r9In, r10In, r11In, 
		r12In, r13In, r14In, r15In, HIIn, LOIn,
		ZHighIn, ZLowIn, PCIn, MDRIn, portIn, CIn : in std_logic_vector(31 downto 0);
		sel : in std_logic_vector(4 downto 0);
		busMuxOut : out std_logic_vector (31 downto 0);
	);
	
end entity busMux;

architecture behaviour of busMux is
	begin
	process (sel)
	begin
		
		case sel is
		
			when "00000" => busMuxOut <= r0In;
			when "00001" => busMuxOut <= r1In;
			when "00010" => busMuxOut <= r2In;
			when "00011" => busMuxOut <= r3In;
			when "00100" => busMuxOut <= r4In;
			when "00101" => busMuxOut <= r5In;
			when "00110" => busMuxOut <= r6In;
			when "00111" => busMuxOut <= r7In;
			when "01000" => busMuxOut <= r8In;
			when "01001" => busMuxOut <= r9In;
			when "01010" => busMuxOut <= r10In;
			when "01011" => busMuxOut <= r11In;
			when "01100" => busMuxOut <= r12In;
			when "01101" => busMuxOut <= r13In;
			when "01110" => busMuxOut <= r14In;
			when "01111" => busMuxOut <= r15In;
			when "10000" => busMuxOut <= HIIn;
			when "10001" => busMuxOut <= LOIn;
			when "10010" => busMuxOut <= ZHighIn;
			when "10011" => busMuxOut <= ZLowIn;
			when "10100" => busMuxOut <= PCIn;
			when "10101" => busMuxOut <= MDRIn;
			when "10110" => busMuxOut <= portIn;
			when "10111" => busMuxOut <= CIn;
			when others => busMuxOut <= r15In;
	
	end case;
	end process;
end architecture;
		