`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2024 10:00:46
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top (
    // 125MHz System Clock
    input wire clk,
    // Single LED (Active Low)
    output wire led
);

    // Parameter to divide the clock to get a 1Hz signal
    localparam CD_COUNT_MAX = 125000000; // 1-second period for a 125MHz clock

    reg [$clog2(CD_COUNT_MAX-1)-1:0] cd_count = 0; // Countdown register
    reg led_state = 0; // LED state register

    always @(posedge clk) begin
        if (cd_count >= CD_COUNT_MAX - 1) begin
            cd_count <= 0;
            led_state <= ~led_state; // Toggle the LED state
        end else begin
            cd_count <= cd_count + 1;
        end
    end

    assign led = ~led_state; // Active-low LED

endmodule
