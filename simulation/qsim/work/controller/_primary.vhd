library verilog;
use verilog.vl_types.all;
entity controller is
    port(
        clk             : in     vl_logic;
        carSig          : in     vl_logic;
        reset           : in     vl_logic;
        setWeight       : in     vl_logic_vector(3 downto 0);
        mainStreetLight : out    vl_logic_vector(2 downto 0);
        sideStreetLight : out    vl_logic_vector(2 downto 0);
        state           : out    vl_logic_vector(2 downto 0);
        shouldReset     : out    vl_logic;
        countVal        : out    vl_logic_vector(3 downto 0);
        sum             : out    vl_logic_vector(3 downto 0)
    );
end controller;
