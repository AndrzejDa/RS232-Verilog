`timescale 1ns / 1ps

module rs232(clk_i, rst_i, RXD_i, TXD_o);
    input clk_i;
    input rst_i;
    input RXD_i;
    output TXD_o;
    wire pclk;
    wire [1:8] data;
    
    Prescaler pres(clk_i, rst_i, pclk);
    reciver rx(pclk, rst_i, RXD_i, data);
    transmitter tx(pclk, rst_i, data, TXD_o);
    
endmodule
