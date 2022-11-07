library verilog;
use verilog.vl_types.all;
entity controller_vlg_check_tst is
    port(
        mainStreetLight : in     vl_logic_vector(2 downto 0);
        sideStreetLight : in     vl_logic_vector(2 downto 0);
        sampler_rx      : in     vl_logic
    );
end controller_vlg_check_tst;
