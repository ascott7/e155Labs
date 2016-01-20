/*
Andrew Scott
ascott@hmc.edu
Created on September 14, 2015

*/
module lab2_as(input logic clk,
            input logic [3:0] s0, s1,
            output logic [6:0] seg0, seg1,
            output logic [4:0] sum);
logic [3:0] switchIn;
logic [4:0] count;
logic switchSelect;

always_ff @(posedge clk)
begin
    count <= count + 1'b1;
    if (count == 5'b11111)
    begin
        count <= 5'b0;
        switchSelect <= ~switchSelect;
    end
end

assign sum = s0 + s1;
assign switchIn = switchSelect ? s1 : s0;
seven_seg_disp display(switchIn, displayOut)

flop_we #(4) seg0Flop(clk, displayOut, ~switchSelect, seg0);
flop_we #(4) seg1Flop(clk, displayOut, switchSelect, seg1);
endmodule

/*
Andrew Scott
ascott@hmc.edu
Created on September 14, 2015

This module creates a variable width write enable flop (write enable means
it will write every clock cycle that the write enable signal is high).
*/
module flop_we #(parameter N = 8)
            (input logic clk, d, we,
            output logic q);
always_ff @(posedge clk)
    if (we)
        q <= d;
endmodule

/*
Andrew Scott
ascott@hmc.edu
Created on September 14, 2015

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
