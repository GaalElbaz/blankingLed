`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: slowClock
// Description: 
// Basys 3 has a clock of 100Mhz, in this project we will convert it to 1Hz and display 
// the led each second.
//////////////////////////////////////////////////////////////////////////////////


module slowClock(
    input  clk_in,
    output  led
    );
    
    // The counter will store the value of clock cycles of the original clock_in 
    // so it will count from 0 to 50_000_000.
    // This is when we toggle the clk_out
    logic [25:0] count = 0;
    logic clk_out = 0;
    
    always_ff @(posedge clk_in) begin
        count <= count + 1;
        if(count == 50_000_000) begin
            count <= 0;
            clk_out = ~clk_out;
        end
    end
    assign led = clk_out;
endmodule
