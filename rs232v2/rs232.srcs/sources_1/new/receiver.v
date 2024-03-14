`timescale 1ns / 1ps

module reciver(
    input clk_i,
    input rst_i,
    input rxd_i,
    output reg [1:8] data18
    );

    integer i = 1;
    integer state = 0;
    
    reg [1:8] data = 8'b00000000;
    wire [1:8] h20 = 8'b00000100;
    reg [0:9] final_data = 10'b0000000001;

    initial begin
        data18 <= 8'b00000000;
    end
    
    always @(posedge clk_i or posedge rst_i)
        begin
            if(rst_i) begin
                state <= 0;
                i <= 1;
            end else begin
                case (state)
                    0: begin
                        if (rxd_i == 1'b0) begin
                            state <= 1;
                            final_data[0] <= 1'b0;
                        end
                    end
                    1: begin
                        data[i] = rxd_i;
                        i = i + 1;
                        if (i == 10) begin
                            i <= 1;
                            state <= 2;
                            final_data[1:8] = data[1:8] + h20[1:8];
                        end
                    end
                    2: begin
                        data18 <= final_data[1:8];
                        state <= 3;
                    end
                    3: begin
                        data18 <= 8'b00000000;
                        state <= 0;
                    end
                    default: begin
                        state <= 0;
                    end
                endcase
            end
        end
        
    
endmodule
