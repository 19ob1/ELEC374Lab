library IEEE; 
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity DIV32 is 
port(dividend, divisor: in std_logic_vector(31 downto 0);
			quotient: out std_logic_vector(63 downto 0));

end entity; 


architecture behaviour of DIV32 is
	begin
	
process(dividend, divisor)
    variable A, Q, M : unsigned(31 downto 0);
    variable count : integer := 32;
	 variable Tempdividend, Tempdivisor, TempQuo: std_logic_vector(31 downto 0);
	 variable flag : std_logic;
    begin

				TempQuo := x"00000000";
				Tempdividend := dividend;
				Tempdivisor := divisor;
				flag := '0';
				if (dividend(31) = '1') then
					if (divisor(31) = '1') then
						Tempdividend := (0-dividend);
						Tempdivisor := (0-divisor);
					else 
						Tempdividend := (0-dividend);
						flag := '1';
						end if;
				elsif (divisor(31) = '1') then
					Tempdivisor := (0-divisor);
					flag := '1';
				end if;
				
            Q := resize(unsigned(Tempdividend), Q'length);
            A := (others => '0');
            M := resize(unsigned(Tempdivisor), M'length);

            for i in 0 to 31 loop
				--shifting, but weird
					 A := SHIFT_LEFT(UNSIGNED(A), 1);
					 if (Q(31) = '1') then
						 A(0) := '1';
					 else
						 A(0) := '0';
					 end if;
					 Q := SHIFT_LEFT(UNSIGNED(Q), 1);
                if A(31) = '0' then
                    A := (unsigned(A) - unsigned(M)); 
                else
                    A := (unsigned(A) + unsigned(M));
					 end if;
					 if A(31) = '0' then
                    Q(0) := '1';   
                else
                    Q(0) := '0';
                end if;
            end loop;
				if A(31) = '1' then
					 A := (unsigned(A) + unsigned(M));
				end if;

				Tempdividend := std_logic_vector(Q);
				if (flag = '1') then
					TempQuo := (0-Tempdividend);
				else
					TempQuo := Tempdividend;
				end if;
            quotient(63 downto 32) <= std_logic_vector(A);
            quotient(31 downto 0) <= TempQuo;
    end process;
end architecture;