-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "02/26/2023 03:57:19"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	datapath IS
    PORT (
	R0in : IN std_logic;
	R1in : IN std_logic;
	R2in : IN std_logic;
	R3in : IN std_logic;
	R4in : IN std_logic;
	R5in : IN std_logic;
	R6in : IN std_logic;
	R7in : IN std_logic;
	R8in : IN std_logic;
	R9in : IN std_logic;
	R10in : IN std_logic;
	R11in : IN std_logic;
	R12in : IN std_logic;
	R13in : IN std_logic;
	R14in : IN std_logic;
	R15in : IN std_logic;
	Zin : IN std_logic;
	HIin : IN std_logic;
	LOin : IN std_logic;
	PCin : IN std_logic;
	Coutin : IN std_logic;
	INPORTin : IN std_logic;
	IRin : IN std_logic;
	MDRin : IN std_logic;
	MARin : IN std_logic;
	Yin : IN std_logic;
	R0out : IN std_logic;
	R1out : IN std_logic;
	R2out : IN std_logic;
	R3out : IN std_logic;
	R4out : IN std_logic;
	R5out : IN std_logic;
	R6out : IN std_logic;
	R7out : IN std_logic;
	R8out : IN std_logic;
	R9out : IN std_logic;
	R10out : IN std_logic;
	R11out : IN std_logic;
	R12out : IN std_logic;
	R13out : IN std_logic;
	R14out : IN std_logic;
	R15out : IN std_logic;
	PCout : IN std_logic;
	ZLOout : IN std_logic;
	ZHIout : IN std_logic;
	LOout : IN std_logic;
	HIout : IN std_logic;
	INPORTout : IN std_logic;
	MDRout : IN std_logic;
	Cout : IN std_logic;
	incPc : IN std_logic;
	readS : IN std_logic;
	andS : IN std_logic;
	orS : IN std_logic;
	addS : IN std_logic;
	subS : IN std_logic;
	multS : IN std_logic;
	divS : IN std_logic;
	shrS : IN std_logic;
	shlS : IN std_logic;
	rorS : IN std_logic;
	rolS : IN std_logic;
	negS : IN std_logic;
	notS : IN std_logic;
	clk : IN std_logic;
	clear : IN std_logic;
	Mdatain : IN std_logic_vector(31 DOWNTO 0)
	);
END datapath;

-- Design Ports Information
-- R0in	=>  Location: PIN_T2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1in	=>  Location: PIN_T1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2in	=>  Location: PIN_L6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R3in	=>  Location: PIN_T17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R4in	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R5in	=>  Location: PIN_M1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R6in	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R7in	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R8in	=>  Location: PIN_N2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R9in	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R10in	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R11in	=>  Location: PIN_P2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R12in	=>  Location: PIN_R19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R13in	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R14in	=>  Location: PIN_R1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R15in	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Zin	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HIin	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LOin	=>  Location: PIN_U2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PCin	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Coutin	=>  Location: PIN_V2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INPORTin	=>  Location: PIN_P4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IRin	=>  Location: PIN_AB7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MDRin	=>  Location: PIN_C7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MARin	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Yin	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R0out	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1out	=>  Location: PIN_W2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2out	=>  Location: PIN_V4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R3out	=>  Location: PIN_W1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R4out	=>  Location: PIN_V14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R5out	=>  Location: PIN_G7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R6out	=>  Location: PIN_V9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R7out	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R8out	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R9out	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R10out	=>  Location: PIN_N18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R11out	=>  Location: PIN_AB8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R12out	=>  Location: PIN_L21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R13out	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R14out	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R15out	=>  Location: PIN_Y13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PCout	=>  Location: PIN_W17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ZLOout	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ZHIout	=>  Location: PIN_W10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LOout	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HIout	=>  Location: PIN_P8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INPORTout	=>  Location: PIN_T3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MDRout	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cout	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- incPc	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readS	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- andS	=>  Location: PIN_U12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- orS	=>  Location: PIN_V5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- addS	=>  Location: PIN_Y8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- subS	=>  Location: PIN_AA1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multS	=>  Location: PIN_V8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divS	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- shrS	=>  Location: PIN_Y3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- shlS	=>  Location: PIN_Y6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rorS	=>  Location: PIN_AA3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rolS	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- negS	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- notS	=>  Location: PIN_V7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clear	=>  Location: PIN_Y1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[0]	=>  Location: PIN_AA5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[1]	=>  Location: PIN_Y10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[2]	=>  Location: PIN_T5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[3]	=>  Location: PIN_Y7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[4]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[5]	=>  Location: PIN_C22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[6]	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[7]	=>  Location: PIN_E6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[8]	=>  Location: PIN_AA2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[9]	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[10]	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[11]	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[12]	=>  Location: PIN_U10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[13]	=>  Location: PIN_AA8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[14]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[15]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[16]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[17]	=>  Location: PIN_AB9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[18]	=>  Location: PIN_U11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[19]	=>  Location: PIN_V11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[20]	=>  Location: PIN_R14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[21]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[22]	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[23]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[24]	=>  Location: PIN_AA11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[25]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[26]	=>  Location: PIN_Y4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[27]	=>  Location: PIN_P7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[28]	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[29]	=>  Location: PIN_B2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[30]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mdatain[31]	=>  Location: PIN_T16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF datapath IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_R0in : std_logic;
SIGNAL ww_R1in : std_logic;
SIGNAL ww_R2in : std_logic;
SIGNAL ww_R3in : std_logic;
SIGNAL ww_R4in : std_logic;
SIGNAL ww_R5in : std_logic;
SIGNAL ww_R6in : std_logic;
SIGNAL ww_R7in : std_logic;
SIGNAL ww_R8in : std_logic;
SIGNAL ww_R9in : std_logic;
SIGNAL ww_R10in : std_logic;
SIGNAL ww_R11in : std_logic;
SIGNAL ww_R12in : std_logic;
SIGNAL ww_R13in : std_logic;
SIGNAL ww_R14in : std_logic;
SIGNAL ww_R15in : std_logic;
SIGNAL ww_Zin : std_logic;
SIGNAL ww_HIin : std_logic;
SIGNAL ww_LOin : std_logic;
SIGNAL ww_PCin : std_logic;
SIGNAL ww_Coutin : std_logic;
SIGNAL ww_INPORTin : std_logic;
SIGNAL ww_IRin : std_logic;
SIGNAL ww_MDRin : std_logic;
SIGNAL ww_MARin : std_logic;
SIGNAL ww_Yin : std_logic;
SIGNAL ww_R0out : std_logic;
SIGNAL ww_R1out : std_logic;
SIGNAL ww_R2out : std_logic;
SIGNAL ww_R3out : std_logic;
SIGNAL ww_R4out : std_logic;
SIGNAL ww_R5out : std_logic;
SIGNAL ww_R6out : std_logic;
SIGNAL ww_R7out : std_logic;
SIGNAL ww_R8out : std_logic;
SIGNAL ww_R9out : std_logic;
SIGNAL ww_R10out : std_logic;
SIGNAL ww_R11out : std_logic;
SIGNAL ww_R12out : std_logic;
SIGNAL ww_R13out : std_logic;
SIGNAL ww_R14out : std_logic;
SIGNAL ww_R15out : std_logic;
SIGNAL ww_PCout : std_logic;
SIGNAL ww_ZLOout : std_logic;
SIGNAL ww_ZHIout : std_logic;
SIGNAL ww_LOout : std_logic;
SIGNAL ww_HIout : std_logic;
SIGNAL ww_INPORTout : std_logic;
SIGNAL ww_MDRout : std_logic;
SIGNAL ww_Cout : std_logic;
SIGNAL ww_incPc : std_logic;
SIGNAL ww_readS : std_logic;
SIGNAL ww_andS : std_logic;
SIGNAL ww_orS : std_logic;
SIGNAL ww_addS : std_logic;
SIGNAL ww_subS : std_logic;
SIGNAL ww_multS : std_logic;
SIGNAL ww_divS : std_logic;
SIGNAL ww_shrS : std_logic;
SIGNAL ww_shlS : std_logic;
SIGNAL ww_rorS : std_logic;
SIGNAL ww_rolS : std_logic;
SIGNAL ww_negS : std_logic;
SIGNAL ww_notS : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_clear : std_logic;
SIGNAL ww_Mdatain : std_logic_vector(31 DOWNTO 0);
SIGNAL \R0in~input_o\ : std_logic;
SIGNAL \R1in~input_o\ : std_logic;
SIGNAL \R2in~input_o\ : std_logic;
SIGNAL \R3in~input_o\ : std_logic;
SIGNAL \R4in~input_o\ : std_logic;
SIGNAL \R5in~input_o\ : std_logic;
SIGNAL \R6in~input_o\ : std_logic;
SIGNAL \R7in~input_o\ : std_logic;
SIGNAL \R8in~input_o\ : std_logic;
SIGNAL \R9in~input_o\ : std_logic;
SIGNAL \R10in~input_o\ : std_logic;
SIGNAL \R11in~input_o\ : std_logic;
SIGNAL \R12in~input_o\ : std_logic;
SIGNAL \R13in~input_o\ : std_logic;
SIGNAL \R14in~input_o\ : std_logic;
SIGNAL \R15in~input_o\ : std_logic;
SIGNAL \Zin~input_o\ : std_logic;
SIGNAL \HIin~input_o\ : std_logic;
SIGNAL \LOin~input_o\ : std_logic;
SIGNAL \PCin~input_o\ : std_logic;
SIGNAL \Coutin~input_o\ : std_logic;
SIGNAL \INPORTin~input_o\ : std_logic;
SIGNAL \IRin~input_o\ : std_logic;
SIGNAL \MDRin~input_o\ : std_logic;
SIGNAL \MARin~input_o\ : std_logic;
SIGNAL \Yin~input_o\ : std_logic;
SIGNAL \R0out~input_o\ : std_logic;
SIGNAL \R1out~input_o\ : std_logic;
SIGNAL \R2out~input_o\ : std_logic;
SIGNAL \R3out~input_o\ : std_logic;
SIGNAL \R4out~input_o\ : std_logic;
SIGNAL \R5out~input_o\ : std_logic;
SIGNAL \R6out~input_o\ : std_logic;
SIGNAL \R7out~input_o\ : std_logic;
SIGNAL \R8out~input_o\ : std_logic;
SIGNAL \R9out~input_o\ : std_logic;
SIGNAL \R10out~input_o\ : std_logic;
SIGNAL \R11out~input_o\ : std_logic;
SIGNAL \R12out~input_o\ : std_logic;
SIGNAL \R13out~input_o\ : std_logic;
SIGNAL \R14out~input_o\ : std_logic;
SIGNAL \R15out~input_o\ : std_logic;
SIGNAL \PCout~input_o\ : std_logic;
SIGNAL \ZLOout~input_o\ : std_logic;
SIGNAL \ZHIout~input_o\ : std_logic;
SIGNAL \LOout~input_o\ : std_logic;
SIGNAL \HIout~input_o\ : std_logic;
SIGNAL \INPORTout~input_o\ : std_logic;
SIGNAL \MDRout~input_o\ : std_logic;
SIGNAL \Cout~input_o\ : std_logic;
SIGNAL \incPc~input_o\ : std_logic;
SIGNAL \readS~input_o\ : std_logic;
SIGNAL \andS~input_o\ : std_logic;
SIGNAL \orS~input_o\ : std_logic;
SIGNAL \addS~input_o\ : std_logic;
SIGNAL \subS~input_o\ : std_logic;
SIGNAL \multS~input_o\ : std_logic;
SIGNAL \divS~input_o\ : std_logic;
SIGNAL \shrS~input_o\ : std_logic;
SIGNAL \shlS~input_o\ : std_logic;
SIGNAL \rorS~input_o\ : std_logic;
SIGNAL \rolS~input_o\ : std_logic;
SIGNAL \negS~input_o\ : std_logic;
SIGNAL \notS~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clear~input_o\ : std_logic;
SIGNAL \Mdatain[0]~input_o\ : std_logic;
SIGNAL \Mdatain[1]~input_o\ : std_logic;
SIGNAL \Mdatain[2]~input_o\ : std_logic;
SIGNAL \Mdatain[3]~input_o\ : std_logic;
SIGNAL \Mdatain[4]~input_o\ : std_logic;
SIGNAL \Mdatain[5]~input_o\ : std_logic;
SIGNAL \Mdatain[6]~input_o\ : std_logic;
SIGNAL \Mdatain[7]~input_o\ : std_logic;
SIGNAL \Mdatain[8]~input_o\ : std_logic;
SIGNAL \Mdatain[9]~input_o\ : std_logic;
SIGNAL \Mdatain[10]~input_o\ : std_logic;
SIGNAL \Mdatain[11]~input_o\ : std_logic;
SIGNAL \Mdatain[12]~input_o\ : std_logic;
SIGNAL \Mdatain[13]~input_o\ : std_logic;
SIGNAL \Mdatain[14]~input_o\ : std_logic;
SIGNAL \Mdatain[15]~input_o\ : std_logic;
SIGNAL \Mdatain[16]~input_o\ : std_logic;
SIGNAL \Mdatain[17]~input_o\ : std_logic;
SIGNAL \Mdatain[18]~input_o\ : std_logic;
SIGNAL \Mdatain[19]~input_o\ : std_logic;
SIGNAL \Mdatain[20]~input_o\ : std_logic;
SIGNAL \Mdatain[21]~input_o\ : std_logic;
SIGNAL \Mdatain[22]~input_o\ : std_logic;
SIGNAL \Mdatain[23]~input_o\ : std_logic;
SIGNAL \Mdatain[24]~input_o\ : std_logic;
SIGNAL \Mdatain[25]~input_o\ : std_logic;
SIGNAL \Mdatain[26]~input_o\ : std_logic;
SIGNAL \Mdatain[27]~input_o\ : std_logic;
SIGNAL \Mdatain[28]~input_o\ : std_logic;
SIGNAL \Mdatain[29]~input_o\ : std_logic;
SIGNAL \Mdatain[30]~input_o\ : std_logic;
SIGNAL \Mdatain[31]~input_o\ : std_logic;

BEGIN

ww_R0in <= R0in;
ww_R1in <= R1in;
ww_R2in <= R2in;
ww_R3in <= R3in;
ww_R4in <= R4in;
ww_R5in <= R5in;
ww_R6in <= R6in;
ww_R7in <= R7in;
ww_R8in <= R8in;
ww_R9in <= R9in;
ww_R10in <= R10in;
ww_R11in <= R11in;
ww_R12in <= R12in;
ww_R13in <= R13in;
ww_R14in <= R14in;
ww_R15in <= R15in;
ww_Zin <= Zin;
ww_HIin <= HIin;
ww_LOin <= LOin;
ww_PCin <= PCin;
ww_Coutin <= Coutin;
ww_INPORTin <= INPORTin;
ww_IRin <= IRin;
ww_MDRin <= MDRin;
ww_MARin <= MARin;
ww_Yin <= Yin;
ww_R0out <= R0out;
ww_R1out <= R1out;
ww_R2out <= R2out;
ww_R3out <= R3out;
ww_R4out <= R4out;
ww_R5out <= R5out;
ww_R6out <= R6out;
ww_R7out <= R7out;
ww_R8out <= R8out;
ww_R9out <= R9out;
ww_R10out <= R10out;
ww_R11out <= R11out;
ww_R12out <= R12out;
ww_R13out <= R13out;
ww_R14out <= R14out;
ww_R15out <= R15out;
ww_PCout <= PCout;
ww_ZLOout <= ZLOout;
ww_ZHIout <= ZHIout;
ww_LOout <= LOout;
ww_HIout <= HIout;
ww_INPORTout <= INPORTout;
ww_MDRout <= MDRout;
ww_Cout <= Cout;
ww_incPc <= incPc;
ww_readS <= readS;
ww_andS <= andS;
ww_orS <= orS;
ww_addS <= addS;
ww_subS <= subS;
ww_multS <= multS;
ww_divS <= divS;
ww_shrS <= shrS;
ww_shlS <= shlS;
ww_rorS <= rorS;
ww_rolS <= rolS;
ww_negS <= negS;
ww_notS <= notS;
ww_clk <= clk;
ww_clear <= clear;
ww_Mdatain <= Mdatain;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOIBUF_X0_Y14_N15
\R0in~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R0in,
	o => \R0in~input_o\);

-- Location: IOIBUF_X0_Y14_N22
\R1in~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R1in,
	o => \R1in~input_o\);

-- Location: IOIBUF_X0_Y13_N1
\R2in~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R2in,
	o => \R2in~input_o\);

-- Location: IOIBUF_X41_Y2_N1
\R3in~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R3in,
	o => \R3in~input_o\);

-- Location: IOIBUF_X14_Y29_N29
\R4in~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R4in,
	o => \R4in~input_o\);

-- Location: IOIBUF_X0_Y13_N22
\R5in~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R5in,
	o => \R5in~input_o\);

-- Location: IOIBUF_X14_Y0_N8
\R6in~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R6in,
	o => \R6in~input_o\);

-- Location: IOIBUF_X28_Y0_N1
\R7in~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R7in,
	o => \R7in~input_o\);

-- Location: IOIBUF_X0_Y12_N15
\R8in~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R8in,
	o => \R8in~input_o\);

-- Location: IOIBUF_X3_Y0_N22
\R9in~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R9in,
	o => \R9in~input_o\);

-- Location: IOIBUF_X35_Y29_N15
\R10in~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R10in,
	o => \R10in~input_o\);

-- Location: IOIBUF_X0_Y11_N15
\R11in~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R11in,
	o => \R11in~input_o\);

-- Location: IOIBUF_X41_Y9_N15
\R12in~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R12in,
	o => \R12in~input_o\);

-- Location: IOIBUF_X41_Y19_N22
\R13in~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R13in,
	o => \R13in~input_o\);

-- Location: IOIBUF_X0_Y10_N8
\R14in~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R14in,
	o => \R14in~input_o\);

-- Location: IOIBUF_X41_Y21_N15
\R15in~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R15in,
	o => \R15in~input_o\);

-- Location: IOIBUF_X26_Y0_N15
\Zin~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Zin,
	o => \Zin~input_o\);

-- Location: IOIBUF_X0_Y3_N8
\HIin~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_HIin,
	o => \HIin~input_o\);

-- Location: IOIBUF_X0_Y9_N8
\LOin~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_LOin,
	o => \LOin~input_o\);

-- Location: IOIBUF_X23_Y0_N29
\PCin~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PCin,
	o => \PCin~input_o\);

-- Location: IOIBUF_X0_Y9_N22
\Coutin~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Coutin,
	o => \Coutin~input_o\);

-- Location: IOIBUF_X0_Y10_N22
\INPORTin~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_INPORTin,
	o => \INPORTin~input_o\);

-- Location: IOIBUF_X11_Y0_N8
\IRin~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IRin,
	o => \IRin~input_o\);

-- Location: IOIBUF_X9_Y29_N8
\MDRin~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_MDRin,
	o => \MDRin~input_o\);

-- Location: IOIBUF_X32_Y29_N29
\MARin~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_MARin,
	o => \MARin~input_o\);

-- Location: IOIBUF_X7_Y29_N8
\Yin~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Yin,
	o => \Yin~input_o\);

-- Location: IOIBUF_X0_Y7_N8
\R0out~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R0out,
	o => \R0out~input_o\);

-- Location: IOIBUF_X0_Y7_N15
\R1out~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R1out,
	o => \R1out~input_o\);

-- Location: IOIBUF_X0_Y5_N22
\R2out~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R2out,
	o => \R2out~input_o\);

-- Location: IOIBUF_X0_Y7_N22
\R3out~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R3out,
	o => \R3out~input_o\);

-- Location: IOIBUF_X30_Y0_N1
\R4out~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R4out,
	o => \R4out~input_o\);

-- Location: IOIBUF_X1_Y29_N15
\R5out~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R5out,
	o => \R5out~input_o\);

-- Location: IOIBUF_X14_Y0_N22
\R6out~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R6out,
	o => \R6out~input_o\);

-- Location: IOIBUF_X0_Y26_N22
\R7out~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R7out,
	o => \R7out~input_o\);

-- Location: IOIBUF_X32_Y0_N22
\R8out~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R8out,
	o => \R8out~input_o\);

-- Location: IOIBUF_X0_Y6_N1
\R9out~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R9out,
	o => \R9out~input_o\);

-- Location: IOIBUF_X41_Y13_N22
\R10out~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R10out,
	o => \R10out~input_o\);

-- Location: IOIBUF_X16_Y0_N22
\R11out~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R11out,
	o => \R11out~input_o\);

-- Location: IOIBUF_X41_Y18_N15
\R12out~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R12out,
	o => \R12out~input_o\);

-- Location: IOIBUF_X39_Y29_N8
\R13out~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R13out,
	o => \R13out~input_o\);

-- Location: IOIBUF_X39_Y29_N22
\R14out~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R14out,
	o => \R14out~input_o\);

-- Location: IOIBUF_X26_Y0_N22
\R15out~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R15out,
	o => \R15out~input_o\);

-- Location: IOIBUF_X35_Y0_N8
\PCout~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PCout,
	o => \PCout~input_o\);

-- Location: IOIBUF_X11_Y0_N15
\ZLOout~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ZLOout,
	o => \ZLOout~input_o\);

-- Location: IOIBUF_X19_Y0_N15
\ZHIout~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ZHIout,
	o => \ZHIout~input_o\);

-- Location: IOIBUF_X0_Y25_N1
\LOout~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_LOout,
	o => \LOout~input_o\);

-- Location: IOIBUF_X0_Y2_N15
\HIout~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_HIout,
	o => \HIout~input_o\);

-- Location: IOIBUF_X0_Y6_N15
\INPORTout~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_INPORTout,
	o => \INPORTout~input_o\);

-- Location: IOIBUF_X1_Y0_N29
\MDRout~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_MDRout,
	o => \MDRout~input_o\);

-- Location: IOIBUF_X1_Y0_N22
\Cout~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Cout,
	o => \Cout~input_o\);

-- Location: IOIBUF_X41_Y25_N8
\incPc~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_incPc,
	o => \incPc~input_o\);

-- Location: IOIBUF_X28_Y0_N29
\readS~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_readS,
	o => \readS~input_o\);

-- Location: IOIBUF_X26_Y0_N1
\andS~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_andS,
	o => \andS~input_o\);

-- Location: IOIBUF_X3_Y0_N29
\orS~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_orS,
	o => \orS~input_o\);

-- Location: IOIBUF_X11_Y0_N1
\addS~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_addS,
	o => \addS~input_o\);

-- Location: IOIBUF_X0_Y5_N15
\subS~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_subS,
	o => \subS~input_o\);

-- Location: IOIBUF_X11_Y0_N29
\multS~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multS,
	o => \multS~input_o\);

-- Location: IOIBUF_X35_Y29_N22
\divS~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divS,
	o => \divS~input_o\);

-- Location: IOIBUF_X5_Y0_N22
\shrS~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_shrS,
	o => \shrS~input_o\);

-- Location: IOIBUF_X5_Y0_N8
\shlS~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_shlS,
	o => \shlS~input_o\);

-- Location: IOIBUF_X5_Y0_N1
\rorS~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rorS,
	o => \rorS~input_o\);

-- Location: IOIBUF_X16_Y29_N1
\rolS~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rolS,
	o => \rolS~input_o\);

-- Location: IOIBUF_X41_Y2_N15
\negS~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_negS,
	o => \negS~input_o\);

-- Location: IOIBUF_X7_Y0_N15
\notS~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_notS,
	o => \notS~input_o\);

-- Location: IOIBUF_X41_Y19_N8
\clk~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: IOIBUF_X0_Y6_N8
\clear~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clear,
	o => \clear~input_o\);

-- Location: IOIBUF_X9_Y0_N29
\Mdatain[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(0),
	o => \Mdatain[0]~input_o\);

-- Location: IOIBUF_X19_Y0_N8
\Mdatain[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(1),
	o => \Mdatain[1]~input_o\);

-- Location: IOIBUF_X0_Y3_N1
\Mdatain[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(2),
	o => \Mdatain[2]~input_o\);

-- Location: IOIBUF_X9_Y0_N8
\Mdatain[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(3),
	o => \Mdatain[3]~input_o\);

-- Location: IOIBUF_X3_Y29_N1
\Mdatain[4]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(4),
	o => \Mdatain[4]~input_o\);

-- Location: IOIBUF_X41_Y26_N22
\Mdatain[5]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(5),
	o => \Mdatain[5]~input_o\);

-- Location: IOIBUF_X11_Y0_N22
\Mdatain[6]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(6),
	o => \Mdatain[6]~input_o\);

-- Location: IOIBUF_X1_Y29_N22
\Mdatain[7]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(7),
	o => \Mdatain[7]~input_o\);

-- Location: IOIBUF_X0_Y5_N8
\Mdatain[8]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(8),
	o => \Mdatain[8]~input_o\);

-- Location: IOIBUF_X0_Y21_N15
\Mdatain[9]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(9),
	o => \Mdatain[9]~input_o\);

-- Location: IOIBUF_X14_Y29_N8
\Mdatain[10]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(10),
	o => \Mdatain[10]~input_o\);

-- Location: IOIBUF_X39_Y29_N1
\Mdatain[11]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(11),
	o => \Mdatain[11]~input_o\);

-- Location: IOIBUF_X14_Y0_N1
\Mdatain[12]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(12),
	o => \Mdatain[12]~input_o\);

-- Location: IOIBUF_X16_Y0_N29
\Mdatain[13]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(13),
	o => \Mdatain[13]~input_o\);

-- Location: IOIBUF_X7_Y29_N22
\Mdatain[14]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(14),
	o => \Mdatain[14]~input_o\);

-- Location: IOIBUF_X16_Y0_N15
\Mdatain[15]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(15),
	o => \Mdatain[15]~input_o\);

-- Location: IOIBUF_X0_Y2_N8
\Mdatain[16]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(16),
	o => \Mdatain[16]~input_o\);

-- Location: IOIBUF_X16_Y0_N1
\Mdatain[17]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(17),
	o => \Mdatain[17]~input_o\);

-- Location: IOIBUF_X19_Y0_N29
\Mdatain[18]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(18),
	o => \Mdatain[18]~input_o\);

-- Location: IOIBUF_X19_Y0_N22
\Mdatain[19]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(19),
	o => \Mdatain[19]~input_o\);

-- Location: IOIBUF_X39_Y0_N15
\Mdatain[20]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(20),
	o => \Mdatain[20]~input_o\);

-- Location: IOIBUF_X5_Y29_N8
\Mdatain[21]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(21),
	o => \Mdatain[21]~input_o\);

-- Location: IOIBUF_X19_Y0_N1
\Mdatain[22]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(22),
	o => \Mdatain[22]~input_o\);

-- Location: IOIBUF_X21_Y0_N29
\Mdatain[23]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(23),
	o => \Mdatain[23]~input_o\);

-- Location: IOIBUF_X21_Y0_N22
\Mdatain[24]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(24),
	o => \Mdatain[24]~input_o\);

-- Location: IOIBUF_X21_Y0_N15
\Mdatain[25]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(25),
	o => \Mdatain[25]~input_o\);

-- Location: IOIBUF_X3_Y0_N8
\Mdatain[26]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(26),
	o => \Mdatain[26]~input_o\);

-- Location: IOIBUF_X0_Y5_N1
\Mdatain[27]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(27),
	o => \Mdatain[27]~input_o\);

-- Location: IOIBUF_X0_Y27_N1
\Mdatain[28]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(28),
	o => \Mdatain[28]~input_o\);

-- Location: IOIBUF_X0_Y27_N8
\Mdatain[29]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(29),
	o => \Mdatain[29]~input_o\);

-- Location: IOIBUF_X21_Y29_N8
\Mdatain[30]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(30),
	o => \Mdatain[30]~input_o\);

-- Location: IOIBUF_X37_Y0_N8
\Mdatain[31]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mdatain(31),
	o => \Mdatain[31]~input_o\);
END structure;


