library verilog;
use verilog.vl_types.all;
entity debouncer_vlg_sample_tst is
    port(
        i_clock         : in     vl_logic;
        i_raw           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end debouncer_vlg_sample_tst;
