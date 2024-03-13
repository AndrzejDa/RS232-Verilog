`timescale 1ns / 1ps

module transceiver(
    input clk_i,
    input rst_i,
    input rxd_i,
    output reg txd_o
    );

    integer i = 1;
    integer state = 0;
    
    reg [1:8] data = 8'b00000000;
    wire [1:8] h20 = 8'b00000100;
    reg [0:9] last_val = 10'b0000000001;

    initial begin
        txd_o <= 1'b1;
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
                            data[0] <= 1'b0;
                        end
                    end
                    1: begin
                        data[i] = rxd_i;
                        i = i + 1;
                        if (i == 10) begin
                            i <= 0;
                            state <= 2;
                            last_val[1:8] = data[1:8] + h20[1:8];
                        end
                    end
                    2: begin
                        txd_o <= last_val[i];
                        i <= i + 1;
                        if (i == 10) begin
                            i <= 0;
                            state <= 0;
                            txd_o <= 1'b1;
                        end
                    end
                    default: begin
                        // Dodaj obs³ugê innych stanów, jeœli to konieczne
                        state <= 0;
                    end
                endcase
            end
        end
        
    
endmodule
