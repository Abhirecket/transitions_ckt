`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: COLLEGE OF VLSI 
// Engineer:Abhishek Kumar Kushwaha 
// 
// Create Date: 18.03.2024 17:35:35
// Design Name: 
// Module Name: transitions_ckt_tb
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


`timescale 1ns / 1ps

module transitions_ckt_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Inputs
    reg data_i;
    reg clk, rst;

    // Outputs
    wire equall_o, rising_o, falling_o;

    // Instantiate the module under test
    transitions_ckt uut (
        .data_i(data_i),
        .clk(clk),
        .rst(rst),
        .equall_o(equall_o),
        .rising_o(rising_o),
        .falling_o(falling_o)
    );

    // Clock generation
    always #((CLK_PERIOD / 2)) clk = ~clk;

    // Initializations
    initial begin
        // Initialize inputs
        data_i = 0;
        clk = 0;
        rst = 1;
        
        // Wait for a few clock cycles to ensure reset settles
        # (10 * CLK_PERIOD);

        // De-assert reset
        rst = 0;

        // Apply input stimulus
        // For example, to test rising edge transition
        # (20 * CLK_PERIOD) data_i = 0;
        # (10 * CLK_PERIOD) data_i = 1;
        # (10 * CLK_PERIOD) data_i = 0;
        # (10 * CLK_PERIOD) data_i = 1;
        # (10 * CLK_PERIOD) data_i = 0;
        # (10 * CLK_PERIOD) data_i = 1;

        // Add more test cases as needed

        // Finish simulation
        #1000 $finish;
    end

endmodule

