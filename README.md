# palindrome_3bit
 You are tasked to design a circuit which would detect a 3-bit palindrome sequence from incoming stream of bits.
 101,111,010,000
### RTL Description: Palindrome Checker

- **Module Name**: palindrome_3b
- **Inputs**:
  - `clk`: Clock input.
  - `rst_n`: Active low reset input.
  - `x_i`: Input data.
- **Outputs**:
  - `palindrome_o`: Output indicating whether the last three bits received form a palindrome.
- **Registers**:
  - `r_cnt`: Two-bit register to keep track of the number of bits received.
  - `r_x_t_1`: Register storing the most recent input bit.
  - `r_x_t_2`: Register storing the input bit received two clock cycles ago.
  - `r_x_t_2_temp`: Temporary register storing the value of `r_x_t_2`.
- **Wires**:
  - `nxt_cnt`: Two-bit wire representing the next count value.
- **Description**:
  - The `palindrome_3b` module checks if the last three bits received form a palindrome.
  - It uses a two-bit counter `r_cnt` to keep track of the number of bits received.
  - Two registers `r_x_t_1` and `r_x_t_2` store the most recent and the input bit received two clock cycles ago, respectively.
  - Upon each clock edge, the module updates its state and input values.
  - When `r_cnt` reaches the count of 3, it freezes further counting to maintain a window of the last three bits.
  - The output `palindrome_o` becomes high if the count is 3 (`r_cnt == 2'b11`) and the oldest bit (`r_x_t_2_temp`) is equal to the current input bit (`x_i`).
- **Behavior**:
  - The module effectively checks whether the last three bits received form a palindrome.
  - It captures the last three bits, and if they form a palindrome, `palindrome_o` becomes high.
- **Additional Comments**:
  - This module is useful for detecting palindromes within a data stream, particularly in applications where sequence analysis is required.
