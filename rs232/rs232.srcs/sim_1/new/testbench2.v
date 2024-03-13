`timescale 1ns / 1ps

module testbench2;

    reg clk_i = 0;
    reg rst_i = 0;
    reg rxd_i = 1;
    wire [0:9] xd_o;

    rs232 uut (
        .clk_i(clk_i),
        .rst_i(rst_i),
        .rxd_i(rxd_i),
        .txd_o(xd_o)
    );
  
    integer delay = 20;  


    always begin
        #5;
        clk_i <= ~clk_i;
    end
    
    always begin
        #104;
        rxd_i <= ~rxd_i;
    end


    initial begin
//        rst_i = 1;
//        #delay;
//        rst_i = 0;
//        #37;
//        rst_i = 1;
//        #delay;
//        rst_i = 0;
        #10000;
        $finish;  
    end

endmodule

