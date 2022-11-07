library verilog;
use verilog.vl_types.all;
entity lab3 is
    port(
        sensor          : in     vl_logic;
        changeState     : in     vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        resetCounter    : out    vl_logic;
        mstl            : out    vl_logic_vector(2 downto 0);
        sstl            : out    vl_logic_vector(2 downto 0);
        state           : out    vl_logic_vector(2 downto 0)
    );
end lab3;
