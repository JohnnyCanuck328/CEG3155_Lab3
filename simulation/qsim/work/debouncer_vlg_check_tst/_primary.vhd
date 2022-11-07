library verilog;
use verilog.vl_types.all;
entity debouncer_vlg_check_tst is
    port(
        o_clean         : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end debouncer_vlg_check_tst;
