library ieee;
use ieee.std_logic_1164.all;

entity selEncode is
	port(
		Gra, Grb, Grc, Rin, Rout, BAout : in std_logic;
		inputData : in std_logic_vector(31 downto 0);
		
		R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out : out std_logic;
		R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in : out std_logic;
		
		Coutput : out std_logic_vector(31 downto 0)
	);
end entity;


architecture behaviour of selEncode is

	signal Ra, Rb, Rc : std_logic_vector(3 downto 0);
	signal decoderIn : std_logic_vector(3 downto 0);
	signal decoderOut : std_logic_vector(15 downto 0);
	signal Csign : std_logic_vector(31 downto 0);
	signal convgra, convgrb, convgrc: std_logic_vector(3 downto 0);
	signal outResult: std_logic; 
	begin
	
	process(inputData, Gra, Grb, Grc, Rout, BAout, Rin, decoderOut, decoderIn, Ra, Rb, Rc, Csign)
	begin

	
	if Gra = '1' then
		Ra <= inputData(26 downto 23);  
	else
		Ra <= (others=>'0');
	end if;
	
	if Grb = '1' then
		Rb <= inputData(22 downto 19);
	else 
		Rb <= (others=>'0');
	end if;
	
	if Grc = '1' then
		Rc <= inputData(18 downto 15);
	else 
		Rc <= (others=>'0');
	end if;
	
	decoderIn <= Ra or Rb or Rc; 
	
	case decoderIn is
		when "0000" => decoderOut <= "0000000000000001";
		when "0001" => decoderOut <= "0000000000000010";
		when "0010" => decoderOut <= "0000000000000100";
		when "0011" => decoderOut <= "0000000000001000";
		when "0100" => decoderOut <= "0000000000010000";
		when "0101" => decoderOut <= "0000000000100000";
		when "0110" => decoderOut <= "0000000001000000";
		when "0111" => decoderOut <= "0000000010000000";
		when "1000" => decoderOut <= "0000000100000000";
		when "1001" => decoderOut <= "0000001000000000";
		when "1010" => decoderOut <= "0000010000000000";
		when "1011" => decoderOut <= "0000100000000000";
		when "1100" => decoderOut <= "0001000000000000";
		when "1101" => decoderOut <= "0010000000000000";
		when "1110" => decoderOut <= "0100000000000000";
		when "1111" => decoderOut <= "1000000000000000";
		when others => decoderOut <= "0000000000000000";
	end case;
	
	Csign <= inputData;
	if Csign(18) = '1' then
		Csign(31 downto 19) <= (others => '1');
	else
		Csign(31 downto 19) <= (others => '0');
	end if;
	Coutput <= Csign;
	
	R0in <= decoderOut(0) and Rin;
	R1in <= decoderOut(1) and Rin;
	R2in <= decoderOut(2) and Rin;
	R3in <= decoderOut(3) and Rin;
	R4in <= decoderOut(4) and Rin;
	R5in <= decoderOut(5) and Rin;
	R6in <= decoderOut(6) and Rin;
	R7in <= decoderOut(7) and Rin;
	R8in <= decoderOut(8) and Rin;
	R9in <= decoderOut(9) and Rin;
	R10in <= decoderOut(10) and Rin;
	R11in <= decoderOut(11) and Rin;
	R12in <= decoderOut(12) and Rin;
	R13in <= decoderOut(13) and Rin;
	R14in <= decoderOut(14) and Rin;
	R15in <= decoderOut(15) and Rin;
	
	R0out <= decoderOut(0) and (Rout or BAout);
	R1out <= decoderOut(1) and (Rout or BAout);
	R2out <= decoderOut(2) and (Rout or BAout);
	R3out <= decoderOut(3) and (Rout or BAout);
	R4out <= decoderOut(4) and (Rout or BAout);
	R5out <= decoderOut(5) and (Rout or BAout);
	R6out <= decoderOut(6) and (Rout or BAout);
	R7out <= decoderOut(7) and (Rout or BAout);
	R8out <= decoderOut(8) and (Rout or BAout);
	R9out <= decoderOut(9) and (Rout or BAout);
	R10out <= decoderOut(10) and (Rout or BAout);
	R11out <= decoderOut(11) and (Rout or BAout);
	R12out <= decoderOut(12) and (Rout or BAout);
	R13out <= decoderOut(13) and (Rout or BAout);
	R14out <= decoderOut(14) and (Rout or BAout);
	R15out <= decoderOut(15) and (Rout or BAout);
	
	
	end process;
end architecture behaviour;