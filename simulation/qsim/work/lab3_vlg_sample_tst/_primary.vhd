library verilog;
use verilog.vl_types.all;
entity lab3_vlg_sample_tst is
    port(
        changeState     : in     vl_logic;
        clk             : in     vl_logic;
        enable          : in     vl_logic;
        reset           : in     vl_logic;
        sensor          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end lab3_vlg_sample_tst;
