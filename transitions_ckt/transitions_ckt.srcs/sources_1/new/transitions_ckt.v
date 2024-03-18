`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: COLLEGE OF VLSI 
// Engineer:Abhishek Kumar Kushwaha 
// 
// Create Date: 18.03.2024 16:38:12
// Design Name: 
// Module Name: transitions_ckt
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: This ckt will show which 0->1 1->0 transition count is more in data stream of 0 and 1
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module transitions_ckt(
        input data_i,
        input clk,rst,
        output equall_o, rising_o, falling_o
    );

wire r_edge, f_edge;
reg [1:0] present_state, next_state;
reg data_q;
reg equall_w, rising_w, falling_w;  
localparam EQUALL = 0;
localparam FALLING = 1;
localparam RISING = 2; 


always @(posedge clk or posedge rst)

begin
     if(rst)
        present_state <= EQUALL;
     else
        present_state <= next_state;
end


always@(*)
begin
//defaults

   equall_w = 1'b0;
   rising_w = 1'b0;
   falling_w = 1'b0;
   next_state = present_state;
   case(present_state)

   EQUALL:
   begin
        equall_w = 1'b1;
        if(r_edge)
            next_state = RISING;
        else if (f_edge)
            next_state = FALLING;
   end

   FALLING:
   begin
        falling_w = 1'b1;
        if(r_edge)
            next_state = EQUALL;
   end

   RISING:
   begin
        rising_w = 1'b1;
        if(f_edge)
            next_state = EQUALL;
   end
   endcase
end

//rising and falling edge detector
always @(posedge clk or posedge rst)
begin
     if(rst)
        data_q <= 1'b0;
     else
        data_q <= data_i; 
end

assign r_edge = ((~data_q) & data_i); //rising edge detector.
assign f_edge = ((~data_i) & data_q); //falling edge detector.


//output

assign equall_o = equall_w;
assign rising_o = rising_w;
assign falling_o = falling_w;

endmodule
