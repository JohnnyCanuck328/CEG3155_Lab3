--------------------------------------------------------------------------------
-- Title         : 2-bit Counter
-- Project       : VHDL Synthesis Overview
-------------------------------------------------------------------------------
-- File          : counter.vhd
-- Author        : Rami Abielmona  <rabielmo@site.uottawa.ca>
-- Created       : 2003/05/17
-- Last modified : 2007/09/25
-------------------------------------------------------------------------------
-- Description : This file creates a 2-bit binary up counter as defined in the VHDL
--		 Synthesis lecture.  The architecture is done at the RTL
--		 abstraction level and the implementation is done in structural
--		 VHDL.
-------------------------------------------------------------------------------
-- Modification history :
-- 2003.05.17 	R. Abielmona		Creation
-- 2004.09.22 	R. Abielmona		Ported for CEG 3550
-- 2007.09.25 	R. Abielmona		Modified copyright notice
-------------------------------------------------------------------------------
-- This file is copyright material of Rami Abielmona, Ph.D., P.Eng., Chief Research
-- Scientist at Larus Technologies.  Permission to make digital or hard copies of part
-- or all of this work for personal or classroom use is granted without fee
-- provided that copies are not made or distributed for profit or commercial
-- advantage and that copies bear this notice and the full citation of this work.
-- Prior permission is required to copy, republish, redistribute or post this work.
-- This notice is adapted from the ACM copyright notice.
--------------------------------------------------------------------------------

--4 bit counter, requires reset to be low to count
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY counter IS
	PORT(
		i_resetBar, i_load	: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		o_Value			: OUT	STD_LOGIC_VECTOR(3 downto 0));
END counter;

ARCHITECTURE rtl OF counter IS
	SIGNAL notA, notB, notC, notD: std_logic;
	signal outA, outB, outC, outD: std_logic;

	COMPONENT enARdFF_2
		PORT(
			i_resetBar	: IN	STD_LOGIC;
			i_d		: IN	STD_LOGIC;
			i_enable	: IN	STD_LOGIC;
			i_clock		: IN	STD_LOGIC;
			o_q, o_qBar	: OUT	STD_LOGIC);
	END COMPONENT;

BEGIN


	bit0: enARdFF_2 port map(i_resetBar => i_resetBar, i_d => notA, i_enable => i_load, 
									i_clock => i_clock, o_q => outA, o_qBar => notA);
									
	bit1: enARdFF_2 port map(i_resetBar => i_resetBar, i_d => notB, i_enable => i_load, 
									i_clock => notA, o_q => outB, o_qBar => notB);
									
									
	bit2: enARdFF_2 port map(i_resetBar => i_resetBar, i_d => notC, i_enable => i_load, 
									i_clock => notB, o_q => outC, o_qBar => notC);
	


	bit3: enARdFF_2 port map(i_resetBar => i_resetBar, i_d => notD, i_enable => i_load, 
									i_clock => notC, o_q => outD, o_qBar => notD);
									
	o_Value(3) <= outD;
	o_Value(2) <= outC;
	o_Value(1) <= outB;
	o_Value(0) <= outA;

END rtl;
