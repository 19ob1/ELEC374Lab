library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity datapath is port(

	
	-- CONFFinput : in std_logic;
	INPORTdata: in std_logic_vector(31 downto 0);
	OUTPORTdata: out std_logic_vector(31 downto 0);
	
	
	-- test signals
	CONFFout : out std_logic;
	R0val, R1val, R2val, R3val, R4val, R5val, R6val, R7val, R8val, R9val, R10val, R11val, R12val, R13val, R14val, R15val, MDRval, Yval, ZLOval, ZHIval, HIval, LOval, 
	Busval: out std_logic_vector(31 downto 0);
	RAMaddress: out std_logic_vector(8 downto 0);
	RAMoutput, IRval, PCval, CSEout: out std_logic_vector(31 downto 0);
	runVal, clearVal, pcoutsig, readRAMinfo, MDRinfo, MDRoutinfo, Rininfo, Zloinfo: out std_logic; 
	clk, reset, stop: in std_logic
);
end entity datapath; 

architecture behaviour of datapath is

component control_unit is 
port(
	clock, reset, stop, conFF : in std_logic;
	run, clear : out std_logic;
	IR : in std_logic_vector(31 downto 0);
	PCout, MDRout, ZHIout, ZLOout, HIout, LOout, inportOUT : out std_logic;
	Rin, Rout, Gra, Grb, Grc: out std_logic;
	HIin, LOin, CONin, PCin, IRin, Yin, Zin, MARin, MDRin, OutPortin,INPORTin, Cout, BAout : out std_logic;
	IncPC, and_op, or_op, add_op, sub_op, mul_op, div_op, shr_op, shl_op, ror_op,shra_op, rol_op, neg_op, not_op, read_op : out std_logic;
	readRAM, writeRAM: out std_logic
	);
	
end component;

component ALU is 
port(
	Ain : in std_logic_vector(31 downto 0);
	Bin : in std_logic_vector(31 downto 0);
	and_op : in std_logic;
	or_op: in std_logic;
	not_op : in std_logic;
	add_op : in std_logic;
	sub_op: in std_logic;
	incPc: in std_logic; 
	shr_op : in std_logic;
	ror_op : in std_logic;
	shl_op : in std_logic;
	rol_op : in std_logic;
	neg_op : in std_logic;
	mult_op: in std_logic;
	div_op: in std_logic;
	shra_op: in std_logic;
	Zreg : out std_logic_vector(63 downto 0)
);
end component ALU;

component bus32to1 is
	port( 
	mux_in_0, mux_in_1, mux_in_2, mux_in_3, mux_in_4, mux_in_5, mux_in_6, 
	mux_in_7, mux_in_8, mux_in_9, mux_in_10, mux_in_11, mux_in_12, mux_in_13, 
	mux_in_14, mux_in_15, mux_in_HI, mux_in_LO, mux_in_Z_high, mux_in_Z_low, mux_in_PC, 
	mux_in_MDR, mux_in_InPort, mux_in_C_sign_extended, mux24, mux25, mux26, mux27, mux28, mux29, mux30, mux31 : in std_logic_vector(31 downto 0);
	sel : in std_logic_vector (4 downto 0);
	bus_mux_out : out std_logic_vector (31 downto 0)
	);
end component;

component encoder32to5 is 
port (  
      in0, in1, in2, in3, in4 , in5, in6 , in7 , in8 , in9, in10, in11, in12, 
		in13, in14, in15, inHi,inLo, inZhigh, inZlow, inPc, inMdr, inport, inC, in24, in25, in26, in27, in28, in29, 
		in30, in31 : in std_logic;
		
		output: out std_logic_vector(4 downto 0)
	);
end component;

component MDR is 
port(
			bus_output, memory_data_in : in std_logic_vector(31 downto 0);
			MDR_out : out std_logic_vector(31 downto 0);
			clear, clk, enable, read_mux : in std_logic
	);
end component;


component reg32 is port(
			inputd: in std_logic_vector(31 downto 0);
			outputq: out std_logic_vector(31 downto 0);
			clk, clear, enable : in std_logic

);

end component;

component preloadVal is 
	port(
		en : in std_logic;
		manualEntry : in std_logic;
		seloutput : in std_logic;
		enable : out std_logic
	);
end component;


component selEncode is
port(
		Gra, Grb, Grc, Rin, Rout, BAout : in std_logic;
		inputData : in std_logic_vector(31 downto 0);
		
		R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out : out std_logic;
		R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in : out std_logic;
		
		Coutput : out std_logic_vector(31 downto 0)
	);
end component selEncode;

component RAM IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		rden		: IN STD_LOGIC  := '1';
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END component RAM;


component conFF is 
	port(
		BusMuxOut : in std_logic_vector(31 downto 0);
		IRinput : in std_logic_vector(31 downto 0);
		CONFFinput : in std_logic;
		CONFFoutput : out std_logic
	);
end component conFF;

component reg0 is 
	port(
			inputd : in std_logic_vector(31 downto 0);
			outputq : out std_logic_vector(31 downto 0);
			clear, clk, enable : in std_logic;
			BAout : in std_logic
	);
end component;

component MARreg is port(
			inputd : in std_logic_vector(31 downto 0);
			outputq : out std_logic_vector(8 downto 0);
			clear, clk, enable : in std_logic
	);
end component;


signal muxSelect: std_logic_vector(4 downto 0);

signal BusMuxOut: std_logic_vector(31 downto 0);
signal YdataOut: std_logic_vector(31 downto 0);

signal IRwire : std_logic_vector(31 downto 0);

signal ALU_output : std_logic_vector(63 downto 0);

signal MARout : std_logic_vector(8 downto 0);
signal Mdatain : std_logic_vector(31 downto 0);
signal OUTPORTout: std_logic_vector(31 downto 0);

signal newR1sig, newR2sig, newR3sig, newR4sig, newR6sig: std_logic; 

signal R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in :std_logic;
signal R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out :std_logic;

signal busMuxZhighin, busMuxZlowin, busMuxHIin, busMuxLOin, busMuxPCin, busMuxCin, busMuxINPORTin, busMuxMDRin: std_logic_vector(31 downto 0);
signal busMuxR0in, busMuxR1in, busMuxR2in, busMuxR3in, busMuxR4in, busMuxR5in, busMuxR6in, busMuxR7in, busMuxR8in, busMuxR9in, 
busMuxR10in, busMuxR11in, busMuxR12in, busMuxR13in, busMuxR14in, busMuxR15in : std_logic_vector(31 downto 0);

signal defaultSig : std_logic_vector(31 downto 0);
signal CONFFinput, CONFFoutput: std_logic; 
signal incPc, read_op, and_op, or_op, add_op, sub_op, mult_op, div_op, shr_op, shl_op, ror_op, rol_op, neg_op, not_op, shra_op : std_logic;
signal writeRAM, readRAM: std_logic; 
signal gra, grb, grc, Rin, Rout, BAout: std_logic; 
signal Zin, HIin, LOin, PCin, Cin, INPORTin, OUTPORTin, IRin, MDRin, MARin, Yin : std_logic;
signal PCout, Zlowout, Zhighout, LOout, HIout, INPORTout, MDRout, Cout : std_logic;
--signal clear, stop, run, reset: std_logic;
signal clear, run,  signalReset: std_logic;

begin
defaultSig <= (others => '0');


ALUunit : ALU port map(
	Ain => YdataOut, 
	Bin => BusMuxOut,
	
	and_op => and_op,
	or_op => or_op,
	not_op => not_op,
	add_op=> add_op,
	sub_op => sub_op,
	shr_op => shr_op,
	ror_op=> ror_op,
	shl_op=> shl_op,
	rol_op => rol_op, 
	neg_op => neg_op,
	mult_op => mult_op,
	div_op => div_op,
	shra_op => shra_op, 
	incPc=> incPc,
	Zreg => ALU_output
);	

encoder: encoder32to5 port map( 
		in0 => R0out,
		in1 => R1out,
		in2 => R2out, 
		in3 => R3out, 
		in4 => R4out, 
		in5 => R5out, 
		in6 => R6out, 
		in7 => R7out, 
		in8 => R8out, 
		in9 => R9out, 
		in10 => R10out, 
		in11 => R11out,
		in12 => R12out, 
		in13 => R13out, 
		in14 => R14out, 
		in15 => R15out, 
		inHi => HIout,
		inLo => LOout, 
		inZhigh => Zhighout, 
		inZlow=> Zlowout, 
		inPc => PCout, 
		inMdr => MDRout, 
		inport=> INPORTout, 
		inC => Cout,
		in24 => '0', 
		in25 => '0', 
		in26 => '0',
		in27 => '0',
		in28 => '0',
		in29 => '0',
		in30 => '0', 
		in31 => '0', 	
		output => muxSelect
);

busUnit: bus32to1 port map(
										sel => muxSelect,
										mux_in_0 => busMuxR0in,
										mux_in_1 => busMuxR1in,
										mux_in_2 =>busMuxR2in,
										mux_in_3 =>busMuxR3in,
										mux_in_4 =>busMuxR4in,
										mux_in_5 =>busMuxR5in,
										mux_in_6 =>busMuxR6in,
										mux_in_7 =>busMuxR7in,
										mux_in_8 =>busMuxR8in,
										mux_in_9 =>busMuxR9in,
										mux_in_10 =>busMuxR10in,
										mux_in_11 =>busMuxR11in,
										mux_in_12 =>busMuxR12in,
										mux_in_13 =>busMuxR13in,
										mux_in_14 =>busMuxR14in,
										mux_in_15 =>busMuxR15in,
										mux_in_HI =>busMuxHIin,
										mux_in_LO =>busMuxLOin,
										mux_in_Z_high =>busMuxZhighin,
										mux_in_Z_low =>busMuxZlowin,
										mux_in_PC =>busMuxPCin,
										mux_in_MDR =>busMuxMDRin,
										mux_in_InPort =>busMuxINPORTin,
										mux_in_C_sign_extended=>busMuxCin,
										mux24 => defaultSig, 
										mux25 => defaultSig,
										mux26 =>defaultSig,
										mux27 =>defaultSig,
										mux28 =>defaultSig,
										mux29 =>defaultSig,
										mux30 =>defaultSig,
										mux31 =>defaultSig,
									   bus_mux_out => BusMuxout
); 




MDRunit: MDR port map( 	
								bus_output => BusMuxOut,
								memory_data_in => Mdatain,
								MDR_out => busMuxMDRin,
								clear => clear, 
								clk => clk, 
								enable => MDRin, 
								read_mux => read_op -- mdr reads
						);
						
selectAndEnocde : selEncode
port map(
	Gra => gra, 
	Grb => grb, 
	Grc => grc, 
	Rin => Rin, 
	Rout => Rout, 
	BAout => BAout,
	inputData => IRwire,
	
	R0in => R0in,
	R1in => R1in,
	R2in => R2in,
	R3in => R3in,
	R4in => R4in,
	R5in => R5in,
	R6in => R6in,
	R7in => R7in,
	R8in => R8in,
	R9in => R9in,
	R10in => R10in,
	R11in => R11in,
	R12in => R12in,
	R13in => R13in,
	R14in => R14in,
	R15in => R15in, 
	R0out => R0out,
	R1out => R1out,
	R2out => R2out,
	R3out => R3out,
	R4out => R4out,
	R5out => R5out,
	R6out => R6out,
	R7out => R7out,
	R8out => R8out,
	R9out => R9out,
	R10out => R10out,
	R11out => R11out,
	R12out => R12out,
	R13out => R13out,
	R14out => R14out,
	R15out => R15out,
	
	Coutput => busMuxCin
	);			

RAMunit : RAM 
port map(
		address	 => MARout,
		clock	 => clk,
		data	 => busMuxMDRin,
		wren	 => writeRAM,
		rden => readRAM, 
		q	 =>  Mdatain
	);
	
	
CONFFunit : CONFF
	port map(
		BusMuxOut  => BusMuxOut,
		IRinput => IRwire,
		CONFFinput => CONFFinput,
		CONFFoutput => CONFFoutput
	);
	
CONTROLU: control_unit port map(clock => clk, clear => clear, reset => reset, 
run => run, stop => stop, CONFF => CONFFoutput, IR => IRwire, readRAM => readRAM, 
writeRAM => writeRAM, Gra => gra, Grb => grb, Grc => grc, Rin => rin, Rout => rout, 
HIin => HIin, LOin => LOin, CONin => CONFFinput, PCin => PCin, IRin => IRin, Yin => Yin, 
Zin => Zin, MarIn => MARin, MDRin => MDRin, OutPortin => OUTPORTin, INPORTin => INPORTin, 
Cout => Cout, Baout => baout, PCout => Pcout, MDRout => MDRout, ZHIout => Zhighout, ZLOout => Zlowout, 
HIout => Hiout, LOout => LOout, inportOUT => inportOUT, add_op => add_op, sub_op => sub_op, and_op => and_op, 
or_op => or_op, shr_op => shr_op, shl_op => shl_op, ror_op => ror_op, rol_op=> rol_op, mul_op => mult_op, 
div_op => div_op, neg_op => neg_op, not_op => not_op, incPC => incPC, read_op => read_op, shra_op=> shra_op);

	
--registers
register0: reg0 port map(inputd=> BusMuxOut,outputq=> busMuxR0in, Baout => baout, clear => clear, clk => clk, enable => R0in);
reg1 : reg32 port map(inputd=> BusMuxOut, outputq=> busMuxR1in, clear => clear, clk => clk, enable => R1in);
reg2 : reg32 port map(inputd=> BusMuxOut, outputq=> busMuxR2in, clear => clear, clk => clk, enable => R2in);
reg3 : reg32 port map(inputd=> BusMuxOut,outputq=> busMuxR3in,clear => clear, clk => clk, enable => R3in);
reg4 : reg32 port map(inputd=> BusMuxOut,outputq=> busMuxR4in,clear => clear, clk => clk, enable => R4in);
reg5 : reg32 port map(inputd=> BusMuxOut,outputq=> busMuxR5in,clear => clear, clk => clk, enable => R5in);
reg6 : reg32 port map(inputd=> BusMuxOut,outputq=> busMuxR6in,clear => clear, clk => clk, enable => R6in);
reg7 : reg32 port map(inputd=> BusMuxOut,outputq=> busMuxR7in,clear => clear, clk => clk, enable => R7in);
reg8 : reg32 port map(inputd=> BusMuxOut,outputq=> busMuxR8in,clear => clear, clk => clk, enable => R8in);
reg9 : reg32 port map(inputd=> BusMuxOut,outputq=> busMuxR9in,clear => clear, clk => clk, enable => R9in);
reg10 : reg32 port map(inputd=> BusMuxOut,outputq=> busMuxR10in, clear => clear, clk => clk, enable => R10in);
reg11 : reg32 port map(inputd=> BusMuxOut,outputq=> busMuxR11in, clear => clear, clk => clk, enable => R11in);
reg12 : reg32 port map(inputd=> BusMuxOut,outputq=> busMuxR12in, clear => clear, clk => clk, enable => R12in);
reg13 : reg32 port map(inputd=> BusMuxOut,outputq=> busMuxR13in, clear => clear, clk => clk, enable => R13in);
reg14 : reg32 port map(inputd=> BusMuxOut,outputq=> busMuxR14in, clear => clear, clk => clk, enable => R14in);
reg15 : reg32 port map(inputd=> BusMuxOut,outputq=> busMuxR15in, clear => clear, clk => clk, enable => R15in);
regHI : reg32 port map(inputd=> BusMuxOut,outputq=> busMuxHIin, clear => clear, clk => clk, enable => HIin);
regLO : reg32 port map(inputd=> BusMuxOut,outputq=> busMuxLOin, clear => clear, clk => clk, enable => LOin);
regIR : reg32 port map(inputd=> BusMuxOut,outputq=> IRwire, clear => clear,clk => clk, enable => IRin);
regY : reg32 port map(inputd=> BusMuxOut,outputq=> YdataOut,clear => clear, clk => clk, enable => Yin);
regPC : reg32 port map(inputd=> BusMuxOut,outputq=> busMuxPCin,clear => clear, clk => clk, enable => PCin);
regZhigh : reg32 port map(inputd=> ALU_output(63 downto 32),outputq=> busMuxZhighin, clear => clear, clk => clk, enable => Zin);
regZlow : reg32 port map(inputd=> ALU_output(31 downto 0),outputq=> busMuxZlowin,clear => clear, clk => clk, enable => Zin);


MARregister : MARreg port map(inputd => BusMuxOut, outputq => MARout, clear => clear, clk => clk, enable => MARin);

regINPORT : reg32 port map(inputd => INPORTdata, outputq => busMuxINPORTin, clear => clear, clk => clk, enable => INPORTin);
	
regOUTPORT : reg32 port map(inputd => BusMuxOut, outputq => OUTPORTout, clear => clear, clk => clk, enable => OUTPORTin);

process (clk, clear,  
R0In, R1In, R2In, R3In, R4In, R5In, R6In, R7In, R8In, R9In, R10In, 
R11In, R12In, R13In, R14In, R15In, HIIn, LOIn, Zin, PCin, IRin, MDRin, 
INPORTin, Cin, Yin, BusMuxOut, run, stop, reset) is

begin  
runVAl <= run;
clearVal <= clear; 
R0val <= busMuxR0in;
R1val <= busMuxR1in;
R2val <= busMuxR2in;
R3val <= busMuxR3in;
R4val <= busMuxR4in;
R5val <= busMuxR5in;
R6val <= busMuxR6in;
R7val <= busMuxR7in;
R8val <= busMuxR8in;
R9val <= busMuxR9in;
R10val <= busMuxR10in;
R11val <= busMuxR11in;
R12val <= busMuxR12in;
R13val <= busMuxR13in;
R14val <= busMuxR14in;
R15val <= busMuxR15in;
Yval <= YdataOut;
ZLOval <= busMuxZlowin;
ZHIval <= busMuxZhighin;
MDRval <= busMuxMDRin;
HIval <= busMuxHIin;
LOval <= busMuxLOin;
IRval <= IRwire; 
RamAddress <= MARout;
Busval <= BusMuxOut;
PCval <= busMuxPCin;
CSEout <= busMuxCin;
OUTPORTdata <=OUTPORTout;
CONFFout <= CONFFoutput;
pcoutsig<= PCout; 
readRAMinfo <= readRAM;
MDRinfo <= MDRin;
MDRoutinfo <= MDRout; 
Rininfo <= Rin; 
Zloinfo <= Zlowout; 
end process;

process(Mdatain)
begin
RAMoutput <= Mdatain;
end process;

end architecture;											
													
													

													