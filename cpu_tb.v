module cpu_testbench();

    reg clk, reset;
    wire [5:0] acc;
    
    CPU cpu_uut(clk, reset, acc);

    always
        forever begin
            #5 clk = ~clk;
        end
    
    initial begin
        #0 reset = 1'b1; clk = 1'b0;
        #10 reset = 1'b0;
        #120 $finish();
    end

endmodule
