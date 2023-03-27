
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY phase3_tb IS
END ENTITY phase3_tb;

ARCHITECTURE arch OF phase3_tb IS 
 signal clock_tb, clear_tb, reset_tb, run_tb, stop_tb : std_logic;
 signal R0val, R1val, R2val, R3val, R4val, R5val, R6val, R7val, R8val, R9val, R10val, R11val, R12val, R13val, R14val, R15val, MDRval, Yval, ZLOval, ZHIval, HIval, LOval, 
 Busval, IRval, PCval, CSEout: std_logic_vector(31 downto 0);
 signal RAMaddress: std_logic_vector(8 downto 0);
 signal RamOutput: std_logic_vector(31 downto 0);
 signal CONFFout_tb, pcoutsig_tb,  readRAMinfo_tb,MDRinfo_tb,MDRoutinfo_tb, Rininfo_tb , Zloinfo_tb : std_logic;
 signal outportData_tb, inportData_tb : std_logic_vector(31 downto 0);
 
component datapath is 
port( 
	-- CONFFinput : in std_logic;
	INPORTdata: in std_logic_vector(31 downto 0);
	OUTPORTdata: out std_logic_vector(31 downto 0);
	-- test signals
	CONFFout : out std_logic;
	R0val, R1val, R2val, R3val, R4val, R5val, R6val, R7val, R8val, R9val, R10val, R11val, R12val, R13val, R14val, R15val, MDRval, Yval, ZLOval, ZHIval, HIval, LOval, 
	Busval: out std_logic_vector(31 downto 0);
	RAMaddress: out std_logic_vector(8 downto 0);
	RAMoutput, IRval, PCval, CSEout: out std_logic_vector(31 downto 0);
	clearVal, runVal, pcoutsig, readRAMinfo, MDRinfo, MDROutinfo, RINinfo, Zloinfo: out std_logic; 
	clk, reset, stop: in std_logic
);
end component;

BEGIN
 main : datapath
 PORT MAP (
 INPORTdata => INPortData_tb, 
 OUTPORTdata => OUTPORTData_tb, 
 CONFFout => CONFFout_tb,
 
 R0val => R0val,
	R1val => R1val,
	R2val => R2val,
	R3val => R3val,
	R4val => R4val,
	R5val => R5val,
	R6val => R6val,
	R7val => R7val,
	R8val => R8val,
	R9val => R9val,
	R10val => R10val,
	R11val => R11val,
	R12val => R12val,
	R13val => R13val,
	R14val => R14val,
	R15val => R15val,
	MDRval => MDRval,
	Yval => Yval,
	ZLOval => ZLOval,
	ZHIval => ZHIval, 
	HIval => HIval, 
	LOval => LOval,
	
	Busval => Busval,
	IRval => IRval, 
	Ramaddress => Ramaddress, 
	Ramoutput => Ramoutput,
	PCval => PCval, 
	Cseout => cSEout,
	reset => reset_tb, 
	runVal => run_tb, 
	stop => stop_tb,
	clearVal => clear_tb,
	clk => clock_tb, 
	pcoutsig => pcoutsig_tb, 
	readRAMinfo => readRAMinfo_tb, 
	MDRinfo => MDRinfo_tb,
	MDRoutinfo => MDRoutinfo_tb, 
	Rininfo => Rininfo_tb,
	Zloinfo => Zloinfo_tb
);

Clock_process: PROCESS IS
BEGIN
Clock_tb <= '1', '0' after 10 ns;
 Wait for 20 ns;
END PROCESS Clock_process;

phase3_process: PROCESS IS
BEGIN
reset_tb <= '1'; stop_tb <= '1';
wait until rising_edge(clock_tb);
reset_tb <= '0'; stop_tb <='0';
wait;
END PROCESS;
END ARCHITECTURE arch;