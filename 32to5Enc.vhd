library ieee;
use ieee.std_logic_1164.all;

entity encoder32to5 is
	port(
--		r0Out, r1Out, r2Out, r3Out, r4Out, r5Out,
--		r6Out, r7Out, r8Out, r9Out, r10Out, r11Out, 
--		r12Out, r13Out, r14Out, r15Out, HIOut, LOOut,
--		ZHighOut, ZLowOut, PCOut, MDROut, portOut, COut	: in std_logic;

		encoderInput: in std_logic_vector(31 downto 0);
		s_out: out std_logic_vector(4 downto 0);
	);
end entity encoder32to5;

architecture behaviour of encoder32to5 is
	
	begin
	process (encoderInput)
	begin
		
		case sel is
		
			when "00000000000000000000000000000001" => s_out <= "00000";
			when "00000000000000000000000000000010" => s_out <= "00001";
			when "00000000000000000000000000000100" => s_out <= "00010";
			when "00000000000000000000000000001000" => s_out <= "00011";
			when "00000000000000000000000000010000" => s_out <= "00100";
			when "00000000000000000000000000100000" => s_out <= "00101";
			when "00000000000000000000000001000000" => s_out <= "00110";
			when "00000000000000000000000010000000" => s_out <= "00111";
			when "00000000000000000000000100000000" => s_out <= "01000";
			when "00000000000000000000001000000000" => s_out <= "01001";
			when "00000000000000000000010000000000" => s_out <= "01010";
			when "00000000000000000000100000000000" => s_out <= "01011";
			when "00000000000000000001000000000000" => s_out <= "01100";
			when "00000000000000000010000000000000" => s_out <= "01101";
			when "00000000000000000100000000000000" => s_out <= "01110";
			when "00000000000000001000000000000000" => s_out <= "01111";
			when "00000000000000010000000000000000" => s_out <= "10000";
			when "00000000000000100000000000000000" => s_out <= "10001";
			when "00000000000001000000000000000000" => s_out <= "10010";
			when "00000000000010000000000000000000" => s_out <= "10011";
			when "00000000000100000000000000000000" => s_out <= "10100";
			when "00000000001000000000000000000000" => s_out <= "10101";
			when "00000000010000000000000000000000" => s_out <= "10110";
			when "00000000100000000000000000000000" => s_out <= "10111";
			when others => s_out <= "01111";
		
		end case
	end process
end architecture;