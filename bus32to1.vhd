library IEEE;
use IEEE.std_logic_1164.all;


entity bus32to1 is port(

	mux_in_0, mux_in_1, mux_in_2, mux_in_3, mux_in_4, mux_in_5, mux_in_6, 
	mux_in_7, mux_in_8, mux_in_9, mux_in_10, mux_in_11, mux_in_12, mux_in_13, 
	mux_in_14, mux_in_15, mux_in_HI, mux_in_LO, mux_in_Z_high, mux_in_Z_low, mux_in_PC, 
	mux_in_MDR, mux_in_InPort, mux_in_C_sign_extended : in std_logic_vector(31 downto 0);
	sel : in std_logic_vector (4 downto 0);
	bus_mux_out : out std_logic_vector (31 downto 0)

);
end entity;

architecture behaviour of bus32to1 is
begin
bus_mux_out <= 
						mux_in_0 when sel = "00000" else
						mux_in_1 when sel = "00001" else
						mux_in_2 when sel = "00010" else
						mux_in_3 when sel = "00011" else
						mux_in_4 when sel = "00100" else
						mux_in_5 when sel = "00101" else
						mux_in_6 when sel = "00110" else
						mux_in_7 when sel = "00111" else
						mux_in_8 when sel = "01000" else
						mux_in_9 when sel = "01001" else
						mux_in_10 when sel = "01010" else
						mux_in_11 when sel = "01011" else
						mux_in_12 when sel = "01100" else
						mux_in_13 when sel = "01101" else
						mux_in_14 when sel = "01110" else
						mux_in_15 when sel = "01111" else
						mux_in_HI when sel = "10000" else
						mux_in_LO when sel = "10001" else
						mux_in_Z_high when sel = "10010" else
						mux_in_Z_low when sel = "10011" else
						mux_in_PC when sel = "10100" else
						mux_in_MDR when sel = "10101" else
						mux_in_InPort when sel = "10110" else
						mux_in_C_sign_extended when sel = "10111" else
						"00000000000000000000000000000000";
end architecture;
