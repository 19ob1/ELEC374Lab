
--and datapath_tb.vhd file: <This is the filename>
LIBRARY ieee;
USE ieee.std_logic_1164.all;


--entity declaration only; no definition here
ENTITY brnz_tb IS
END ENTITY brnz_tb;


--Architecture of the testbench with the signal names 
ARCHITECTURE arch OF brnz_tb IS
signal  PCout_tb, LOout_tb, HIout_tb, INPORTout_tb, MDRout_tb, Cout_tb: std_logic;
	SIGNAL HIin_tb, LOin_tb, ZLOout_tb, ZHIout_tb, Coutin_tb, INPORTin_tb, OUTPORTin_tb, MARin_tb, Zin_tb, PCin_tb, MDRin_tb, IRin_tb, Yin_tb : std_logic;
	
	SIGNAL IncPC_tb, read_op_tb, and_op_tb, or_op_tb, add_op_tb, sub_op_tb, mul_op_tb, div_op_tb, shra_op_tb, shr_op_tb, shl_op_tb, ror_op_tb, rol_op_tb, neg_op_tb, not_op_tb: std_logic;
	
	signal Gra_tb, Grb_tb, Grc_tb, BAout_tb, Rin_tb, Rout_tb : std_logic;
	signal CONFFin_tb, CONFFout_tb : std_logic;
	
	SIGNAL R0val, R1val, R2val, R3val, R4val, R5val, R6val, R7val, R8val, R9val,
	R10val, R11val, R12val, R13val, R14val, R15val, MDRval, Yval, ZLOval, ZHIval, Busval, IRval, RAMoutput, CSEout, PCval, preloadedValue_tb : std_logic_vector(31 downto 0);
	SIGNAL RAMaddress: std_logic_vector(8 downto 0);
	
	SIGNAL R1sig_tb, R1msig_tb: std_logic;
	SIGNAL R4sig_tb, R4msig_tb: std_logic;
	SIGNAL R2sig_tb, R2msig_tb: std_logic;
	SIGNAL R3sig_tb, R3msig_tb: std_logic;
	SIGNAL R6sig_tb, R6msig_tb: std_logic;
	
	SIGNAL Clock_tb, reset_tb : std_logic;
	SIGNAL writeRAM_tb, readRAM_tb: std_logic; 
	signal out24_tb: std_logic; 
	signal preloadVal_tb: std_logic_vector(31 downto 0);
	SIGNAL INPORTval_tb, OUTPORTval_tb : std_logic_vector (31 downto 0);

	TYPE State IS (default, T0, T1, T2, T3, T4, T5, T6, T6b, T7, delay1, delay2, delay3, delay4, delay5, delay6, delay7, Reg_load1a, Reg_load1b, Reg_load2a, Reg_load2b,Reg_load3a, reg_load3b);
	SIGNAL Present_state: State:= default;

COMPONENT datapath
PORT (
   Zin, HIin, LOin, PCin, Cin, INPORTin, OUTPORTin, IRin, MDRin, MARin, Yin : in std_logic;
	PCout, Zlowout, Zhighout, LOout, HIout, INPORTout, MDRout, Cout : in std_logic;
	
	
	writeRAM, readRAM: in std_logic; 
	gra, grb, grc, Rin, Rout, BAout: in std_logic; 
	CONFFoutput: out std_logic;
	CONFFinput : in std_logic;
	INPORTdata: in std_logic_vector(31 downto 0);
	OUTPORTdata: out std_logic_vector(31 downto 0);
	incPc, read_op, and_op, or_op, add_op, sub_op, mult_op, div_op, shr_op, shl_op, ror_op, rol_op, neg_op, not_op, shra_op : in std_logic;
	
	
	-- signals needed to preload registers
	out24: in std_logic; 	
	preloadedValue: in std_logic_vector(31 downto 0);
	R1msig, R1sig, R4msig, R4sig, R2msig, R2sig, R3msig, R3sig, R6msig, R6sig: in std_logic; 
	
	-- test signals
	R0val, R1val, R2val, R3val, R4val, R5val, R6val, R7val, R8val, R9val, R10val, R11val, R12val, R13val, R14val, R15val, MDRval, Yval, ZLOval, ZHIval, HIval, LOval, 
	Busval: out std_logic_vector(31 downto 0);
	RAMaddress: out std_logic_vector(8 downto 0);
	RAMoutput, IRval, PCval, CSEout: out std_logic_vector(31 downto 0);
	
	clk, clear: in std_logic
	
	);
END COMPONENT datapath;


BEGIN
main : datapath
PORT MAP (
	INPORTdata => INPORTval_tb,
	OUTPORTdata => OUTPORTval_tb,
	
	PCout => PCout_tb,
	ZHighout => ZHIout_tb,
	ZLOwout => ZLOout_tb,
	MDRout => MDRout_tb,
	LOout => LOout_tb, 
	HIout => HIout_tb, 
	INPORTout => INPORTout_tb,  
	Cout => Cout_tb,
	
	gra => Gra_tb,
	grb => Grb_tb, 
	grc => Grc_tb, 
	Rin => Rin_tb, 
	Rout => Rout_tb, 
	baout => BAout_tb,
	
	LOin => LOin_tb,
	HIin => HIin_tb,
	Cin => Coutin_tb,
	INPORTin => INPORTin_tb, 
	OUTPORTin => OUTPORTin_tb,
	MARin=>MARin_tb,
	Zin=>Zin_tb,
	PCin=>PCin_tb,
	MDRin=>MDRin_tb,
	IRin=>IRin_tb,
	Yin=>Yin_tb,
	IncPC =>IncPC_tb,
	
	read_op=>read_op_tb,
	and_op=>and_op_tb,
	or_op => or_op_tb, 
	add_op => add_op_tb, 
	sub_op => sub_op_tb,  
	mult_op => mul_op_tb, 
	div_op => div_op_tb, 
	shr_op => shr_op_tb, 
	shl_op => shl_op_tb, 
	shra_op => shra_op_tb, 
	ror_op => ror_op_tb, 
	rol_op => rol_op_tb,  
	neg_op => neg_op_tb, 
	not_op => not_op_tb,
	
	writeRAM => writeRAM_tb,
	readRAM => readRAM_tb,
	CONFFoutput => ConfFout_tb, 
	CONFFinput => CONFFin_tb,
	R1sig => R1sig_tb,
	R4sig => R4sig_tb,
	R2sig => R2sig_tb,
	R3sig => R3sig_tb,
	R6sig => R6sig_tb,
	
	R1msig => R1msig_tb, 
	R4msig => R4msig_tb, 
	R2msig => R2msig_tb, 
	R3msig => R3msig_tb, 
	R6msig => R6msig_tb, 
	
	preloadedValue => preloadedValue_tb,
	
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
	Busval => Busval,
	IRval => IRval, 
	Ramaddress => Ramaddress, 
	Ramoutput => Ramoutput,
	PCval => PCval, 
	Cseout => cSEout,
	out24 => out24_tb,
	
	clk=>Clock_tb,
	clear => reset_tb

	);

	--add test logic here
	Clock_process: PROCESS IS 
	BEGIN
		Clock_tb <= '1', '0' after 10 ns;
		Wait for 20 ns;
	END PROCESS Clock_process;
	
	PROCESS (Clock_tb)  IS--finite state machine
	BEGIN
	IF (rising_edge (Clock_tb)) THEN   --if clock rising-edge
	CASE Present_state IS 
		WHEN Default =>
Present_state <= Reg_load1a;

WHEN Reg_load1a =>
Present_state <= Reg_load1b;
WHEN Reg_load1b =>
Present_state <= Reg_load2a;
	WHEN Reg_load2a=>Present_state <= Reg_load2b;
		WHEN Reg_load2b=>Present_state <= Reg_load3a;
		WHEN Reg_load3a=>Present_state <= delay6;
		WHEN delay6=>Present_state <= Reg_load3b;
		WHEN Reg_load3b=>Present_state <= T0;
		WHEN T0 =>Present_state <= T1;
		WHEN T1 => Present_state <= delay1;
		WHEN delay1 =>Present_state <= delay2;
		WHEN delay2 =>Present_state <= delay3;
		WHEN delay3 =>Present_state <= T2;
		WHEN T2 =>Present_state <= T3;
		WHEN T3=>Present_state <= delay7;
		WHEN delay7 =>Present_state <= delay5;
		WHEN delay5 =>Present_state <= T4;
		WHEN T4 =>Present_state <= delay4;
		WHEN delay4 =>Present_state <= T5;
		WHEN T5 =>Present_state <= T6;
		
		WHEN OTHERS =>
		END CASE;
		END IF;
		END PROCESS;
		PROCESS (Present_state)IS--do the required job ineach state
		
BEGIN CASE Present_state IS        --assert the required signalsin each clock cycle
	WHEN Default=>	
		
	PCout_tb  <= '0';
		LOout_tb  <= '0'; 
		HIout_tb  <= '0'; 
		INPORTout_tb  <= '0'; 
		MDRout_tb  <= '0'; 
		Cout_tb  <= '0';
		HIin_tb  <= '0'; 
		LOin_tb  <= '0'; 
		ZLOout_tb  <= '0'; 
		ZHIout_tb  <= '0'; 
		Coutin_tb  <= '0'; 
		INPORTin_tb  <= '0'; 
		MARin_tb  <= '0'; 
		Zin_tb  <= '0'; 
		PCin_tb  <= '0'; 
		MDRin_tb  <= '0'; 
		IRin_tb  <= '0'; 
		Yin_tb  <= '0';
		
		reset_tb <= '0';
		readRAM_tb <= '0';
		writeRAM_tb <= '0';
		ConFFin_tb <= '0';
		CONFFout_tb <= '0';
		R1sig_tb <= '0';	
		Gra_tb <= '0'; 
		Grb_tb <= '0'; 
		Grc_tb <= '0'; 
		BAout_tb <= '0';  
		Rin_tb <= '0'; 
		preloadedValue_tb <=  x"0000000A";
		R4sig_tb <='1'; 
		R6sig_tb <='0'; 
		R2sig_tb <='1'; 
		R3sig_tb <='1'; 
		R1sig_tb <='1'; 
		
WHEN Reg_load1a => 
 out24_tb <= '1', '0' after 10 ns; 
 WHEN Reg_load1b => 
   MDRin_tb <= '1', '0' after 35 ns; 
WHEN Reg_load2a => 
   
	MDRout_tb <= '1'; 
	Yin_tb <= '1';
   PCin_tb <= '1'; -- initialize R2 with the value $12 
 WHEN Reg_load2b => 
   MDRout_tb <= '0';
   PCin_tb <= '0';
   Yin_tb <= '0';
	
	
	 preloadedValue_tb <=  x"00000001";
	 out24_tb <= '1', '0' after 10 ns;

	 WHEN Reg_load3a => 
	 MDRin_tb <= '1', '0' after 35 ns; 
	 
    WHEN Reg_load3b =>
     MDRout_tb <= '1', '0' after 10 ns; 
	  R6msig_tb <= '1'; -- initialize R3 with the value $14 
		
	WHEN T0 => --see if you need to de-assert these signals
		R6sig_tb <= '1';
		PCout_tb <= '1', '0' after 25 ns;
		MARin_tb <= '1' , '0' after 25 ns;
		IncPC_tb <= '1' , '0' after 25 ns;
		Zin_tb <= '1', '0' after 25 ns;
		
	WHEN T1=>
		ZLOout_tb <= '1', '0' after 75 ns;
		PCin_tb <= '1', '0' after 75 ns; 
		read_op_tb <= '1' after 41 ns, '0' after 75 ns;
		readRAM_tb <= '1', '0' after 75 ns;
		MDRin_tb <= '1' after 41 ns, '0' after 75 ns;
			
	WHEN T2=>
		MDRout_tb <= '1', '0' after 25 ns;   
		IRin_tb <= '1', '0' after 25 ns;
	WHEN T3=>
		Gra_tb <= '1'  , '0' after 65 ns;
		Rout_tb <= '1' , '0' after 65 ns;
		ConFFin_tb <= '1' after 5 ns,'0' after 65 ns;
	WHEN T4=>
		Pcout_tb <= '1', '0' after 25 ns;
		Yin_tb <= '1', '0' after 25 ns;
	WHEN T5 =>		
		Cout_tb <= '1', '0' after 25 ns;
		add_op_tb <= '1', '0' after 25 ns;
		Zin_tb <= '1', '0' after 25 ns;
		
	WHEN T6 =>
		ZLOout_tb <= '1';   
		
		if (CONFFout_tb = '1') then 
			PCin_tb <= '1';
		else 
			PCin_tb <= '0';
		end if; 
			
	WHEN OTHERS =>
	END CASE;
END PROCESS;
END ARCHITECTURE arch;