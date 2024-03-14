`timescale 1ns / 1ps

module transmitter(
    input clk_i,
    input rst_i,
    input [1:8] data,
    output reg txd_o
    );
    
    integer i = 0;
    integer state = 0;
    reg [0:9] final_data = 10'b0000000001;

    initial begin
        txd_o <= 1'b1;
    end
    
    always @(posedge clk_i or posedge rst_i)
        begin
            if(rst_i) begin
                state <= 0;
            end else if (clk_i) begin
                if(data != 8'b00000000) begin
                    final_data[1:8] <= data[1:8];
                    state <= 1;
                end
                case(state)
                    0: begin
                        i <= 0;
                        txd_o <= 1'b1;
                    end
                    1: begin
                        txd_o <= final_data[i];
                        i <= i + 1;
                        if(i == 10) begin
                            txd_o <= 1'b1;
                            state <= 0;
                        end
                    end
                endcase
            end
        end
       
        
endmodule
