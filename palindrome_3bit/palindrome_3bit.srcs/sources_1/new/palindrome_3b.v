`timescale 1ns/1ps
module palindrome_3b (
  input   wire        clk,
  input   wire        rst_n,
  input   wire        x_i,
  output  wire        palindrome_o
);

//registers
  reg  [1:0] r_cnt;
  reg  r_x_t_1;
  reg  r_x_t_2;
  reg  r_x_t_2_temp;

  
//wires
  wire [1:0] nxt_cnt;
  

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      r_cnt         <= 2'b00;
      r_x_t_1       <= 1'b0;
      r_x_t_2       <= 1'b0;
      r_x_t_2_temp  <= 1'b0;
      
    end 
    else begin
      r_cnt      <= nxt_cnt;

      r_x_t_2_temp  <= r_x_t_2;
      r_x_t_2  <= r_x_t_1;
      r_x_t_1  <= x_i;
    end
  end
  

  //freez the counter logic @ count of 3 because @rst counter is already at 0 and after capturing 2 input 
  //it went to 2 and when 3rd input came it will move to locking state i.e 3. .
  assign nxt_cnt  = (r_cnt==2'b11) ? r_cnt : r_cnt + 2'b01;
  

  assign palindrome_o  = (r_cnt==2'b11) & (r_x_t_2_temp == x_i); //output logic

endmodule