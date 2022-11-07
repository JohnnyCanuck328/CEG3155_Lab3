library verilog;
use verilog.vl_types.all;
entity controller_vlg_sample_tst is
    port(
        carSig          : in     vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        setWeight       : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end controller_vlg_sample_tst;
