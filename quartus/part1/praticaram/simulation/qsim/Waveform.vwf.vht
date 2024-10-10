-- Copyright (C) 2021  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "10/01/2024 17:04:49"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          ram32bits
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ram32bits_vhd_vec_tst IS
END ram32bits_vhd_vec_tst;
ARCHITECTURE ram32bits_arch OF ram32bits_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL address : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL clock : STD_LOGIC;
SIGNAL dataIn : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL dataOut : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL write : STD_LOGIC;
COMPONENT ram32bits
	PORT (
	address : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	clock : IN STD_LOGIC;
	dataIn : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	dataOut : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	write : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : ram32bits
	PORT MAP (
-- list connections between master ports and signals
	address => address,
	clock => clock,
	dataIn => dataIn,
	dataOut => dataOut,
	write => write
	);
-- address[4]
t_prcs_address_4: PROCESS
BEGIN
	address(4) <= '0';
WAIT;
END PROCESS t_prcs_address_4;
-- address[3]
t_prcs_address_3: PROCESS
BEGIN
	address(3) <= '0';
WAIT;
END PROCESS t_prcs_address_3;
-- address[2]
t_prcs_address_2: PROCESS
BEGIN
	address(2) <= '0';
WAIT;
END PROCESS t_prcs_address_2;
-- address[1]
t_prcs_address_1: PROCESS
BEGIN
	address(1) <= '0';
	WAIT FOR 160000 ps;
	address(1) <= '1';
	WAIT FOR 80000 ps;
	address(1) <= '0';
WAIT;
END PROCESS t_prcs_address_1;
-- address[0]
t_prcs_address_0: PROCESS
BEGIN
	address(0) <= '0';
	WAIT FOR 80000 ps;
	address(0) <= '1';
	WAIT FOR 80000 ps;
	address(0) <= '0';
WAIT;
END PROCESS t_prcs_address_0;

-- clock
t_prcs_clock: PROCESS
BEGIN
LOOP
	clock <= '0';
	WAIT FOR 10000 ps;
	clock <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clock;
-- dataIn[3]
t_prcs_dataIn_3: PROCESS
BEGIN
	dataIn(3) <= '0';
WAIT;
END PROCESS t_prcs_dataIn_3;
-- dataIn[2]
t_prcs_dataIn_2: PROCESS
BEGIN
	dataIn(2) <= '0';
	WAIT FOR 120000 ps;
	dataIn(2) <= '1';
	WAIT FOR 120000 ps;
	dataIn(2) <= '0';
WAIT;
END PROCESS t_prcs_dataIn_2;
-- dataIn[1]
t_prcs_dataIn_1: PROCESS
BEGIN
	dataIn(1) <= '0';
	WAIT FOR 40000 ps;
	dataIn(1) <= '1';
	WAIT FOR 80000 ps;
	dataIn(1) <= '0';
WAIT;
END PROCESS t_prcs_dataIn_1;
-- dataIn[0]
t_prcs_dataIn_0: PROCESS
BEGIN
	dataIn(0) <= '1';
	WAIT FOR 40000 ps;
	dataIn(0) <= '0';
	WAIT FOR 40000 ps;
	dataIn(0) <= '1';
	WAIT FOR 40000 ps;
	dataIn(0) <= '0';
	WAIT FOR 40000 ps;
	dataIn(0) <= '1';
	WAIT FOR 80000 ps;
	dataIn(0) <= '0';
WAIT;
END PROCESS t_prcs_dataIn_0;

-- write
t_prcs_write: PROCESS
BEGIN
	write <= '1';
	WAIT FOR 120000 ps;
	write <= '0';
	WAIT FOR 80000 ps;
	write <= '1';
	WAIT FOR 40000 ps;
	write <= '0';
	WAIT FOR 740000 ps;
	write <= '1';
WAIT;
END PROCESS t_prcs_write;
END ram32bits_arch;
