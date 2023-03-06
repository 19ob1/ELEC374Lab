library IEEE; 
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity DIV32 is 
port(dividend, divisor: in std_logic_vector(31 downto 0);
			quotient: out std_logic_vector(63 downto 0));

end entity; 


architecture behavioural of DIV32 is
	begin
	process(dividend, divisor)
		variable dividendtemp, divisortemp, quotienttemp, substraction, div: std_logic_vector(31 downto 0);
		variable divisorflag , dividendflag: std_logic := '0'; 
	begin	
	dividendtemp := dividend;
	divisortemp := divisor; 
	quotienttemp :=(others => '0'); 
	div :=(others => '0');
	div(0) := dividendtemp(31); 
	dividendtemp := std_logic_vector(shift_left(unsigned(dividendtemp), 1));
	
		
	-- take care of signed division three cases: two positive numbers, 1 positive/1 negative number, 2 negative numbers
	if dividendtemp(31) = '1' then 
		dividendtemp := 0 - dividendtemp;
		dividendflag := '1';
	end if; 
	if divisortemp(31) = '1' then 
		divisortemp := 0 - divisortemp; --twos complement
		divisorflag := '1';
	end if; 
	
	
		for i in 0 to 31 loop
		
		substraction := div - divisortemp; 
		
		if (substraction(31) = '1') then --if result is negative 
			-- shift dividend to left
			if i /= 31 then
				div := std_logic_vector(shift_left(unsigned(div), 1));
				div(0) := dividendtemp(31);
				dividendtemp := std_logic_vector(shift_left(unsigned(dividendtemp), 1));
			end if; 
			-- shift quotient to left add a zero
			quotienttemp := std_logic_vector(shift_left(unsigned(quotienttemp), 1)); 
		
		else -- if result is positive 
			-- make dividend equal to substraction
			div := substraction;
			if i /= 31 then
				div := std_logic_vector(shift_left(unsigned(div), 1));
				div(0):= dividendtemp(31);
				-- shift dividend to the left
				dividendtemp := std_logic_vector(shift_left(unsigned(dividendtemp), 1));
			end if; 
			-- shift quotient to left add a one
			quotienttemp := std_logic_vector(shift_left(unsigned(quotienttemp), 1));
			quotienttemp(0) := '1'; 
		end if;
	end loop; 
		
		--now xor to see if final value needs to be negated
		if (divisorflag = '1' and dividendflag = '1') or (divisorflag = '0' and dividendflag = '0')  then 
			quotient(31 downto 0) <= quotienttemp; 
			quotient(63 downto 32) <= div; --remainder
		else 
			quotienttemp :=  std_logic_vector(signed(not(quotienttemp)) + 1);
			quotient(31 downto 0) <= quotienttemp; 
			quotient(63 downto 32) <= div; --remainder
		end if; 
		
end process; 
end architecture;