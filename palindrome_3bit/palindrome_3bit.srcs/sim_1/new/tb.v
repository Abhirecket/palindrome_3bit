`timescale 1ns/1ps

module tb;

  // Parameters
  parameter CLK_PERIOD = 2; // Clock period in ns

  // Signals
  reg clk;
  reg rst_n;
  reg x_i;
  wire palindrome_o;

  // Instantiate the module
  palindrome_3b dut (
    .clk(clk),
    .rst_n(rst_n),
    .x_i(x_i),
    .palindrome_o(palindrome_o)
  );

  // Clock generation
  always #((CLK_PERIOD / 2)) clk = ~clk;

  // Initial block
  initial begin
    // Initialize signals
    clk = 0;
    rst_n = 0;
    x_i = 0;

    #3 rst_n = 1;


    #4 x_i = 1;
    #2 x_i = 0;
    #2 x_i = 1;
    #2 x_i = 1;
    #2 x_i = 1;
    #2 x_i = 1;
    #2 x_i = 1;
    #2 x_i = 0;
    #2 x_i = 0;
    #2 x_i = 0;
    #2 x_i = 0;
    #2 x_i = 0;
    
    #2 x_i = 1;
    #2 x_i = 0;
    #2 x_i = 1;
    #2 x_i = 1;
    #2 x_i = 0;
    #2 x_i = 1;

    // Add more test cases as needed

    // Add delay to observe the output
    #100 $stop;
  end

endmodule
