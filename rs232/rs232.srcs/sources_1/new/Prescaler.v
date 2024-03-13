`timescale 1ns / 1ps

module Prescaler (
    input clk_i,
    input rst_i,
    output reg pres_o
);


    parameter N = 10;
    integer counter = 0;
    integer sync = 0;
    reg temp = 0;
    reg flag = 1;
    always @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            counter <= 0;
            temp <= 0;
        end else if (N%2 == 0) begin
            if (counter == N/2) begin
                temp <= ~temp;
                counter <= 1;
                sync <= sync + 1;
            end else begin
                if (sync == 10) begin
                    counter <= counter - 1;
                    sync <= 0;
                end else begin
                    counter <= counter + 1;
                end
                
            end;
        end else begin
            if (flag == 0) begin
                if (counter == N/2 + 1) begin
                    temp <= ~temp;
                    counter <= 1;
                    flag <= ~flag;
                end else begin
                    counter <= counter + 1;
                end;
            end else begin
                if (counter == N/2) begin
                    temp <= ~temp;
                    counter <= 1;
                    flag <= ~flag;
                end else begin
                    counter <= counter + 1;                    
                end;
            end       
            
        end
    end

    always @* begin
        pres_o = temp;
    end
endmodule


