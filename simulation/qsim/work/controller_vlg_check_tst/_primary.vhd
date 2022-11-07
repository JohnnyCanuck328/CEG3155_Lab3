library verilog;
use verilog.vl_types.all;
entity controller_vlg_check_tst is
    port(
        countVal        : in     vl_logic_vector(3 downto 0);
        mainStreetLight : in     vl_logic_vector(2 downto 0);
        shouldReset     : in     vl_logic;
        sideStreetLight : in     vl_logic_vector(2 downto 0);
        state           : in     vl_logic_vector(2 downto 0);
        sum             : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end controller_vlg_check_tst;
