//*******************************************************************************************
// Test:
//   pass_write transfer does not exceed the width of the data interface
//
// Desc:
//   Unit test for CIP_ID: write transfer does not exceed the width of the data interface
//  Driving AWVALID and WVALID
//   Expected result: PASS
//*******************************************************************************************
`SVTEST(pass_write transfer does not exceed the width of the data interface)
  `g2u_display ("pass_write transfer does not exceed the width of the data interface")
  `g2u_display (" Driving ARESETn to 0 ")
  ARESETn=1'b0;
  `g2u_display("Driving AWVALID to 1")
  AWVALID=1'b1;
  `g2u_display("Driving WVALID to 1")    
  WVALID=1'b1;
  `g2u_display("Driving AWSIZE to DATA_WIDTH ")    
  //wait_for_n_clks (1);
  AWSIZE = DATA_WIDTH;
  wait_for_n_clks (1);
  `g2u_display ("End pass_write transfer does not exceed the width of the data interface")
`SVTEST_END
	
//*******************************************************************************************
// Test:
//   fail_write transfer does not exceed the width of the data interface
//
// Desc:
//   Unit test for CIP_ID: write transfer does not exceed the width of the data interface
//  Driving AWVALID and WVALID
//   Expected result: FAIL
//*******************************************************************************************
`SVTEST(fail_write transfer does not exceed the width of the data interface)
  `g2u_display ("fail_write transfer does not exceed the width of the data interface")
  `g2u_display (" Driving ARESETn to 0 ")
  ARESETn=1'b0;
  `g2u_display("Driving AWVALID to 1")
  AWVALID=1'b1;
  `g2u_display("Driving WVALID to 1")    
  WVALID=1'b1;
  `g2u_display("Driving AWSIZE to DATA_WIDTH ")    
  //wait_for_n_clks (1);
  AWSIZE != DATA_WIDTH;
  wait_for_n_clks (1);
  `g2u_display ("End fail_write transfer does not exceed the width of the data interface")
`SVTEST_END
