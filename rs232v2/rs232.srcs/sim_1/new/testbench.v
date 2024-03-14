`timescale 1ns / 1ps

module testbench;

    reg clk_i = 0;
    reg rst_i = 0;
    reg rxd_i = 1;
    wire xd_o;
    //wire pclk;
    
    //wire [1:8] data;
    
    

    rs232 uut (
        .clk_i(clk_i),
        //.pclk_o(pclk),
        .rst_i(rst_i),
        .RXD_i(rxd_i),
        .TXD_o(xd_o)
        //.datas(data)       
    );
  
    integer delay = 104166;  
    
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
        #3000000;
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
        #3000000; 
    end

endmodule

