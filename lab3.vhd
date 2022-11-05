library ieee;
use ieee.std_logic_1164.all;

entity lab3 is
	port(sensor, counterExpired, clk, reset, enable: in std_logic;
			mstl, sstl, debug: out std_logic_vector(2 downto 0));
end lab3;

architecture structStateMach of lab3 is

	COMPONENT enARdFF_2 IS
		PORT(
			i_resetBar	: IN	STD_LOGIC;
			i_d		: IN	STD_LOGIC;
			i_enable	: IN	STD_LOGIC;
			i_clock		: IN	STD_LOGIC;
			o_q, o_qBar	: OUT	STD_LOGIC);
	END COMPONENT;
	
	signal r: std_logic_vector(11 downto 0);
	signal ffIn, y: std_logic_vector(2 downto 0);
	
	begin
		
		r(0) <= y(2) AND NOT(y(1));
		r(1) <= NOT(counterExpired) AND y(2);
		r(2) <= counterExpired AND y(1) AND y(0);
		ffIn(2) <= r(0) OR r(1) OR r(2);
	
		r(3) <= NOT(counterExpired) AND y(1);
		r(4) <= counterExpired AND y(2) AND y(0);
		r(5) <= counterExpired AND NOT(y(2)) AND y(1) AND NOT(y(0));
		r(6) <= sensor AND y(0) AND NOT(y(1)) AND NOT(y(2));
		ffIn(1) <= r(3) OR r(4) OR r(5) OR r(6);
		--ffIn(1) <= '1';
		
		r(7) <= counterExpired AND NOT(y(2)) AND NOT(y(0));
		r(8) <= counterExpired AND NOT(y(1)) AND NOT(y(0));
		r(9) <= NOT(counterExpired) AND y(2) AND y(0);
		r(10) <= NOT(counterExpired) AND y(1) AND y(0);
		r(11) <= NOT(sensor) AND NOT(y(2)) AND NOT(y(1)) AND y(0);
		ffIn(0) <= r(7) OR r(8) OR r(9) OR r(10) OR r(11);
		
		Y0: enARdFF_2 port map(i_resetBar => reset, i_d => ffIn(0), i_enable => enable, i_clock => clk, o_q => y(0), o_qBar => open);
		
		Y1: enARdFF_2 port map(i_resetBar => reset, i_d => ffIn(1), i_enable => enable, i_clock => clk, o_q => y(1), o_qBar => open);
		
		Y2: enARdFF_2 port map(i_resetBar => reset, i_d => ffIn(2), i_enable => enable, i_clock => clk, o_q => y(2), o_qBar => open);
	
		sstl(0) <= y(2) AND NOT(y(1)) AND NOT(y(0));
		sstl(1) <= y(2) AND NOT(y(1)) AND y(0);
		sstl(2) <= NOT(y(2)) OR (y(2) AND y(1));
		
		mstl(0) <= NOT(y(2)) AND NOT(y(1));
		mstl(1) <= NOT(y(2)) AND y(1) AND NOT(y(0));
		mstl(2) <= y(2) OR (y(1) AND y(0));
		
		debug <= y;
		
end structStateMach;