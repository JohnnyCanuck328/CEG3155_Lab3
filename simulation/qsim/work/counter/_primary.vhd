library verilog;
use verilog.vl_types.all;
entity counter is
    port(
        i_resetBar      : in     vl_logic;
        i_load          : in     vl_logic;
        i_clock         : in     vl_logic;
        o_Value         : out    vl_logic_vector(3 downto 0)
    );
end counter;
