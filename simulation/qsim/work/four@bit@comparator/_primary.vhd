library verilog;
use verilog.vl_types.all;
entity fourBitComparator is
    port(
        i_Ai            : in     vl_logic_vector(3 downto 0);
        i_Bi            : in     vl_logic_vector(3 downto 0);
        o_GT            : out    vl_logic;
        o_LT            : out    vl_logic;
        o_EQ            : out    vl_logic
    );
end fourBitComparator;
