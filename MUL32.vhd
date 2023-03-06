library IEEE; 
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;


entity MUL32 is port (
				multiplicand, multiplier : in std_logic_vector(31 downto 0);
			   out_product : out std_logic_vector(63 downto 0)
);
end entity MUL32;

architecture behavioral of MUL32 is
begin
	process(multiplicand, multiplier)
	variable A, Acomp: std_logic_vector(31 downto 0);
	variable sequence, number: std_logic_vector(2 downto 0);
	variable one, sum: std_logic_vector(63 downto 0);
	variable tempcount: std_logic_vector(32 downto 0);
	variable savebit: std_logic;
	variable count :integer; 
	
	begin
		
		A := multiplicand;
		count := 0; 
		
		Acomp :=  std_logic_vector(signed(not(A)) + 1); -- find the twos complement of the multiplicand
		sum := (others => '0');
		tempcount(32 downto 1) := multiplier; --add imaginary zero
		tempcount(0):= '0';
				
		for i in 0 to 15 loop 
		
		-- get next sequence 
		sequence(0):= tempcount(0);
		sequence(1):= tempcount(1);
		sequence(2):= tempcount(2); 

		tempcount := std_logic_vector(shift_right(unsigned(tempcount), 2));
		
		--operations 
		--000 0
		--001 1
		--010 -1
		--011 2
		--100 -2
		
		if (sequence = "000") then
			number := "000";
		elsif (sequence = "001") then 
			number := "001";
		elsif (sequence = "010") then 
			number := "001";
		elsif (sequence = "011") then 
			number := "011";
		elsif (sequence = "100") then 
			number := "100";
		elsif (sequence = "101") then 
			number := "010";
		elsif (sequence = "110") then 
			number := "010";
		elsif (sequence = "111") then 
			number := "000";
		end if; 
		
		if number = "000" then 
			one :=(others => '0'); -- just all zeros 0
		elsif number = "001" then
			one:=(others => A(31));
			one(31 downto 0) := A;    -- just the multiplicand +1
		elsif number = "010" then 
			one :=(others => Acomp(31));
			one(31 downto 0) := Acomp; --two complements of multiplicand -1 
		elsif number = "011" then
			one :=(others => A(31));
			one(32 downto 1) := A; --  add a zero, write complement +2
			one(0) := '0'; 
	   elsif number = "100" then
			one :=(others => Acomp(31));
			one(32 downto 1):= Acomp;  -- add a zero + write multiplicand + extend with ones -2
			one(0) := '0'; 
		end if; 
		
		one := std_logic_vector(shift_left(unsigned(one), count)); --each two we skip
		count := count + 2; 
		sum := sum + one;   
		
		end loop; 
		out_product<= sum; 
		
		end process; 
end behavioral;