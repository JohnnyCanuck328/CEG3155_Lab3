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
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "11/05/2022 16:27:15"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	lab3 IS
    PORT (
	sensor : IN std_logic;
	counterExpired : IN std_logic;
	clk : IN std_logic;
	reset : IN std_logic;
	enable : IN std_logic;
	mstl : BUFFER std_logic_vector(2 DOWNTO 0);
	sstl : BUFFER std_logic_vector(2 DOWNTO 0)
	);
END lab3;

-- Design Ports Information
-- sensor	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- counterExpired	=>  Location: PIN_Y13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_F3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_F5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- enable	=>  Location: PIN_R28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mstl[0]	=>  Location: PIN_AG25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mstl[1]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mstl[2]	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sstl[0]	=>  Location: PIN_A23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sstl[1]	=>  Location: PIN_D28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sstl[2]	=>  Location: PIN_L8,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF lab3 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_sensor : std_logic;
SIGNAL ww_counterExpired : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_enable : std_logic;
SIGNAL ww_mstl : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_sstl : std_logic_vector(2 DOWNTO 0);
SIGNAL \sensor~input_o\ : std_logic;
SIGNAL \counterExpired~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \enable~input_o\ : std_logic;
SIGNAL \mstl[0]~output_o\ : std_logic;
SIGNAL \mstl[1]~output_o\ : std_logic;
SIGNAL \mstl[2]~output_o\ : std_logic;
SIGNAL \sstl[0]~output_o\ : std_logic;
SIGNAL \sstl[1]~output_o\ : std_logic;
SIGNAL \sstl[2]~output_o\ : std_logic;

BEGIN

ww_sensor <= sensor;
ww_counterExpired <= counterExpired;
ww_clk <= clk;
ww_reset <= reset;
ww_enable <= enable;
mstl <= ww_mstl;
sstl <= ww_sstl;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X91_Y0_N23
\mstl[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \mstl[0]~output_o\);

-- Location: IOOBUF_X23_Y73_N23
\mstl[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \mstl[1]~output_o\);

-- Location: IOOBUF_X0_Y48_N2
\mstl[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \mstl[2]~output_o\);

-- Location: IOOBUF_X102_Y73_N2
\sstl[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sstl[0]~output_o\);

-- Location: IOOBUF_X115_Y60_N16
\sstl[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sstl[1]~output_o\);

-- Location: IOOBUF_X0_Y48_N9
\sstl[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sstl[2]~output_o\);

-- Location: IOIBUF_X0_Y68_N8
\sensor~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sensor,
	o => \sensor~input_o\);

-- Location: IOIBUF_X52_Y0_N8
\counterExpired~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_counterExpired,
	o => \counterExpired~input_o\);

-- Location: IOIBUF_X0_Y66_N22
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: IOIBUF_X0_Y65_N15
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: IOIBUF_X115_Y34_N22
\enable~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_enable,
	o => \enable~input_o\);

ww_mstl(0) <= \mstl[0]~output_o\;

ww_mstl(1) <= \mstl[1]~output_o\;

ww_mstl(2) <= \mstl[2]~output_o\;

ww_sstl(0) <= \sstl[0]~output_o\;

ww_sstl(1) <= \sstl[1]~output_o\;

ww_sstl(2) <= \sstl[2]~output_o\;
END structure;


