library ieee;
use ieee.std_logic_1164.all;
--stateSel is derived from debug/state
entity controller is
	port(clk, carSig, reset: in std_logic; 
			setWeight: in std_logic_vector(3 downto 0);
			mainStreetLight, sideStreetLight: out std_logic_vector(2 downto 0));
end controller;

architecture structCont of controller is
	component h2InMux4bit is
		port(w0: in std_logic_vector(3 downto 0);
			w1: in std_logic_vector(3 downto 0);
			en: in std_logic;
			y: out std_logic_vector(3 downto 0));
	end component;
	
	COMPONENT fourBitComparator IS
		PORT(
			i_Ai, i_Bi			: IN	STD_LOGIC_VECTOR(3 downto 0);
			o_GT, o_LT, o_EQ		: OUT	STD_LOGIC);
	END COMPONENT;
	
	component lab3 is
		port(sensor, changeState, clk, reset, enable: in std_logic;
				resetCounter: out std_logic;
				mstl, sstl, state: out std_logic_vector(2 downto 0));
	end component;
	
	COMPONENT debouncer IS
		PORT(
			i_raw			: IN	STD_LOGIC;
			i_clock			: IN	STD_LOGIC;
			o_clean			: OUT	STD_LOGIC);
	END COMPONENT;
	
	COMPONENT clk_div IS

		PORT
		(
			clock_25Mhz				: IN	STD_LOGIC;
			clock_1MHz				: OUT	STD_LOGIC;
			clock_100KHz				: OUT	STD_LOGIC;
			clock_10KHz				: OUT	STD_LOGIC;
			clock_1KHz				: OUT	STD_LOGIC;
			clock_100Hz				: OUT	STD_LOGIC;
			clock_10Hz				: OUT	STD_LOGIC;
			clock_1Hz				: OUT	STD_LOGIC);
		
	END COMPONENT;
	
	COMPONENT counter IS
		PORT(
			i_resetBar, i_load	: IN	STD_LOGIC;
			i_clock			: IN	STD_LOGIC;
			o_Value			: OUT	STD_LOGIC_VECTOR(3 downto 0));
	END COMPONENT;
	
	COMPONENT fourbitaddsub IS
		PORT(
			i_Ai, i_Bi		: IN	STD_LOGIC_VECTOR(3 downto 0);
			carryOut		: OUT	STD_LOGIC;
			controller: in std_logic;
			o_Sum			: OUT	STD_LOGIC_VECTOR(3 downto 0);
			overflow: out std_logic);
	END COMPONENT;
	
	signal counterExpired, setCounter, counterReset: std_logic;
	signal counterOut, resetWeight: std_logic_vector(3 downto 0);
	signal stateSig: std_logic_vector(2 downto 0);
	
	begin 
	
		systemCounter: counter PORT MAP(i_resetBar => NOT(setCounter), i_load => '1', i_clock => clk, o_Value => counterOut);
		
		countComp: fourBitComparator PORT MAP(i_Ai => counterOut, i_Bi	=> setWeight, o_GT => open, o_LT => open, o_EQ => counterExpired);
		
		resetWeightGen: fourbitaddsub PORT MAP(i_Ai => setWeight, i_Bi => "0001", carryOut => open, controller => '0', o_Sum => resetWeight,overflow => open);
		
		resetComp: fourBitComparator PORT MAP(i_Ai => counterOut, i_Bi	=> resetWeight, o_GT => open, o_LT => open, o_EQ => counterReset);
		
		setCounter <= counterReset OR (carSig AND NOT(stateSig(2)) AND NOT(stateSig(1)) AND stateSig(0));
		
		fsmCont: lab3 port map(sensor => carSig, changeState => counterExpired, clk => clk, 
		reset => reset, enable => '1',resetCounter => open, mstl => mainStreetLight, sstl => sideStreetLight, state => stateSig);
		
end structCont;