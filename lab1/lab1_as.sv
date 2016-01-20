/*
Andrew Scott
ascott@hmc.edu
Created on September 10, 2015

This module is the top level module for e155 lab 1. It takes input from four
switches and then controls the output of a line of LEDs as well as a seven segment
display based on the input from the switches.
*/
module lab1_as (input logic clk,
                    input logic [3:0] s,
                    output logic [7:0] led,
                    output logic [6:0] seg);
    
    logic[31:0] count;
    logic old_led;
    
    // make sure count and old_led are initialized properly
    initial
        begin
        old_led <= 1'b1;
        count <= 32'b0;
        end

    // logic for all of the ouput LEDs
    assign led[0] = s[0];
    assign led[1] = ~s[0];
    assign led[2] = s[1];
    assign led[3] = ~s[1];
    assign led[4] = s[2];
    assign led[5] = ~s[2];
    assign led[6] = s[2] & s[3];
    assign led[7] = old_led;


    always_ff @(posedge clk)
        begin
        // count each clock cycle and then flip our blinking LED every 8320000
        // cycles (will result in blinking at a rate of 2.4 Hz)
        count <= count + 1;
        if (count === 32'd8320000)
            begin
            old_led = ~old_led;
            count <= 32'b0;
            end
        end

    // create an instance of the seven segment display
    seven_seg_disp display(s, seg);
endmodule


/*
Andrew Scott
ascott@hmc.edu
Created on September 10, 2015

This module contains the logic for controlling a common anode seven segment
display with a four bit input. The module uses a truth table  to determine when
to light up each segment of the display.
*/
module seven_seg_disp(input logic [3:0] s,
                    output logic [6:0] seg);

always_comb
case(s)
    4'b0000 : seg = 7'b1000000;
    4'b0001 : seg = 7'b1111001;
    4'b0010 : seg = 7'b0100100;
    4'b0011 : seg = 7'b0110000;
    4'b0100 : seg = 7'b0011001;
    4'b0101 : seg = 7'b0010010;
    4'b0110 : seg = 7'b0000010;
    4'b0111 : seg = 7'b1111000;
    4'b1000 : seg = 7'b0000000;
    4'b1001 : seg = 7'b0011000;
    4'b1010 : seg = 7'b0001000;
    4'b1011 : seg = 7'b0000011;
    4'b1100 : seg = 7'b0100111;
    4'b1101 : seg = 7'b0100001;
    4'b1110 : seg = 7'b0000110;
    4'b1111 : seg = 7'b0001110;
    default : seg = 7'b0000000;
endcase
endmodule

