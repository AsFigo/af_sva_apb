module m;

  bit clk;
  bit rst_n;
  bit [7:0] psel;
  bit [31:0] num_ones;

  default clocking dcb @(posedge clk);
  endclocking : dcb 

  always #10 clk = ~clk;

  initial begin
    ##10;
    num_ones = $urandom();
    ##10;
    $finish (2);
  end

  property p_single_sel;
    $onehot0 (psel);
  endproperty : p_single_sel
  a_p_single_sel : assert property (p_single_sel)
  else
    $error("a_p_single_sel psel: 0x%0h is not behaving as one-hot0 ", psel);

  property p_count_ones;
    $countones (num_ones) < 3;
  endproperty : p_count_ones
  a_p_count_ones : assert property (p_count_ones)
  else
    $error("a_p_count_ones num_ones: 0x%0h  ", $sampled(num_ones));



endmodule : m
