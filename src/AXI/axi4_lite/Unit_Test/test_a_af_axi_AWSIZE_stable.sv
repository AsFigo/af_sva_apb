//*******************************************************************************************
// Test:
//   pass_a_af_axi_AWSIZE_stable
//
// Desc:
//   Unit test for CIP_ID: a_af_axi_AWSIZE_stable
//  Driving AWVALID and WVALID
//   Expected result: PASS
//*******************************************************************************************
`SVTEST(pass_a_af_axi_AWSIZE_stable)
  `g2u_display ("pass_a_af_axi_AWSIZE_stable ")
  `g2u_display (" Driving ARESETn to 0 ")
  ARESETn=1'b0;
  `g2u_display("Driving AWVALID to 1")
  AWVALID=1'b1;
  `g2u_display("Driving AWREADY to 0")    
  AWREADY=1'b0;
  `g2u_display("Driving AWSIZE  ")    
  wait_for_n_clks (1);
  AWSIZE = 3’h000;
  wait_for_n_clks (2);
  AWSIZE = 3’h000;
  wait_for_n_clks (1);
  `g2u_display ("End pass_a_af_axi_AWSIZE_stable ")
`SVTEST_END
	
//*******************************************************************************************
// Test:
//   fail_a_af_axi_AWSIZE_stable
//
// Desc:
//   Unit test for CIP_ID: a_af_axi_AWSIZE_stable
//  Driving AWVALID and WVALID
//   Expected result: FAIL
//*******************************************************************************************
`SVTEST(fail_a_af_axi_AWSIZE_stable)
  `g2u_display ("fail_a_af_axi_AWSIZE_stable ")
  `g2u_display (" Driving ARESETn to 0 ")
  ARESETn=1'b0;
  `g2u_display("Driving AWVALID to 1")
  AWVALID=1'b1;
  `g2u_display("Driving AWREADY to 0")    
  AWREADY=1'b0;
  `g2u_display("Driving AWSIZE  ")    
  wait_for_n_clks (1);
  AWSIZE = 3’h000;
  wait_for_n_clks (2);
  AWSIZE = 3’h100;
  wait_for_n_clks (1);
  `g2u_display ("End fail_a_af_axi_AWSIZE_stable ")
`SVTEST_END
