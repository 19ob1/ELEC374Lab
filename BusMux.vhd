library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity busMux is
	port(
		r0 : in std_logic_vector(31 downto 0);
		r1 : in std_logic_vector(31 downto 0);
		r2 : in std_logic_vector(31 downto 0);
		r3 : in std_logic_vector(31 downto 0);
		r4 : in std_logic_vector(31 downto 0);
		r5 : in std_logic_vector(31 downto 0);
		r6 : in std_logic_vector(31 downto 0);
		r7 : in std_logic_vector(31 downto 0);
		r8 : in std_logic_vector(31 downto 0);
		r9 : in std_logic_vector(31 downto 0);
		r10 : in std_logic_vector(31 downto 0);
		r11 : in std_logic_vector(31 downto 0);
		r12 : in std_logic_vector(31 downto 0);
		r13 : in std_logic_vector(31 downto 0);
		r14 : in std_logic_vector(31 downto 0);
		r15 : in std_logic_vector(31 downto 0);
		r16 : in std_logic_vector(31 downto 0);
		r17 : in std_logic_vector(31 downto 0);
		r18 : in std_logic_vector(31 downto 0);
		r19 : in std_logic_vector(31 downto 0);
		r20 : in std_logic_vector(31 downto 0);
		r21 : in std_logic_vector(31 downto 0);
		r22 : in std_logic_vector(31 downto 0);
		r23 : in std_logic_vector(31 downto 0);
		sel : in std_logic_vector(4 downto 0);
		busMuxOut : out std_logic_vector (31 downto 0);
	);
end entity busMux;

architecture synth of busMux is
	type array_mux is array (0 to 23) of std_logic_vector(31 downto 0);
	signal myArray_Mux : array_mux;
	
	begin
	
	myArray_Mux(0) <= r0;
	myArray_Mux(1) <= r1;
	myArray_Mux(2) <= r2;
	myArray_Mux(3) <= r3;
	myArray_Mux(4) <= r4;
	myArray_Mux(5) <= r5;
	myArray_Mux(6) <= r6;
	myArray_Mux(7) <= r7;
	myArray_Mux(8) <= r8;
	myArray_Mux(9) <= r9;
	myArray_Mux(10) <= r10;
	myArray_Mux(11) <= r11;
	myArray_Mux(12) <= r12;
	myArray_Mux(13) <= r13;
	myArray_Mux(14) <= r14;
	myArray_Mux(15) <= r15;
	myArray_Mux(16) <= r16;
	myArray_Mux(17) <= r17;
	myArray_Mux(18) <= r18;
	myArray_Mux(19) <= r19;
	myArray_Mux(20) <= r20;
	myArray_Mux(21) <= r21;
	myArray_Mux(22) <= r22;
	myArray_Mux(23) <= r23;
	
	busMuxOut <= myArray_Mux(to_integer(unsigned(sel)));
	
	end synth;

	--begin
		--busMuxOut <= r0 when (sel = "") else
		