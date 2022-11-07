library verilog;
use verilog.vl_types.all;
entity debouncer is
    port(
        i_raw           : in     vl_logic;
        i_clock         : in     vl_logic;
        o_clean         : out    vl_logic
    );
end debouncer;
