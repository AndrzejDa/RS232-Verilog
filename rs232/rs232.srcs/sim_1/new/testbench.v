`timescale 1ns / 1ps

module testbench;

    reg clk_i = 0;
    reg rst_i = 0;
    reg rxd_i = 1;
    wire pclk;
    wire xd_o;
    
    

    rs232 uut (
        .clk_i(clk_i),
        .pclk_o(pclk),
        .rst_i(rst_i),
        .rxd_i(rxd_i),
        .txd_o(xd_o)        
    );
  
    integer delay = 104;  
    
    always begin
        #5;
        clk_i <= ~clk_i;
    end


    initial begin
        rxd_i = 1;
        #delay;
        rxd_i = 1;
        #delay;
        rxd_i = 0;
        #delay;
        rxd_i = 1;
        #delay;
        rxd_i = 0;
        #delay;
        rxd_i = 1;
        #delay;
        rxd_i = 1;
        #delay;
        rxd_i = 1;
        #delay;
        rxd_i = 0;
        #delay;
        rxd_i = 1;
        #delay;
        rxd_i = 0;
        #delay;
        rxd_i = 1;
        
        #10000;
        $finish;  
    end

endmodule

