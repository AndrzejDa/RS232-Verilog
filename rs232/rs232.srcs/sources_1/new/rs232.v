`timescale 1ns / 1ps

module rs232(clk_i, rst_i, rxd_i, txd_o, pclk_o);
    input clk_i;
    input rst_i;
    input rxd_i;
    output txd_o;
    output pclk_o;
    
    Prescaler pres(clk_i, rst_i, pclk_o);
    transceiver txrx(pclk_o, rst_i, rxd_i, txd_o);
    
endmodule
