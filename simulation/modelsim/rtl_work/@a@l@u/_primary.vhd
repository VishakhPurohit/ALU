library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        Enter           : in     vl_logic;
        s3              : in     vl_logic;
        s2              : in     vl_logic;
        s1              : in     vl_logic;
        s0              : in     vl_logic;
        Cin             : in     vl_logic;
        F               : out    vl_logic_vector(15 downto 0);
        Cout            : out    vl_logic
    );
end ALU;
