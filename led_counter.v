module Counter #(
    parameter CLK_FREQ = 25_000_000 
) (
    input  wire clk,
    input  wire rst_n,
    output wire [7:0] leds
);

localparam  ONE_SECOND = CLK_FREQ;

reg [31:0] counter;
reg [7:0] counter_8_bits;

assign leds = counter_8_bits;

always @(posedge clk) begin
    if(!rst_n)begin
        counter <= 0;
        counter_8_bits <= 0;
    end
    else begin
        if (counter >= ONE_SECOND -1) begin
            counter <= 0;
            counter_8_bits <= counter_8_bits + 1;
        end
        else begin
            counter <= counter + 1;
        end
    end
    
end

endmodule
