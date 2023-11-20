//************************************************************
// Test:
//   pass_test_a_af_axi_AWID_stable
//
// Desc:
//   Unit test for CIP_ID: a_af_axi_AWID_stable
//  Driving AWVALID and AWREADY
//   Expected result: PASS
//************************************************************
`SVTEST(pass_test_a_af_axi_AWID_stable)
  `g2u_display ("pass_test_a_af_axi_AWID_stable")
  `g2u_display("Driving AWVALID to 1")
  AWVALID=1'b1;
  `g2u_display("Driving AWREADY to 0")    
  AWREADY=1'b0;
  `g2u_display("Driving AWID to 1 ")    
  //wait_for_n_clks (1);
  AWID = 1'b1;
		
  wait_for_n_clks (2);		 
  `g2u_display("Driving AWVALID to 1")
  AWVALID=1'b1;
  `g2u_display("Driving AWREADY to 0")    
  AWREADY=1'b0;
  `g2u_display("Driving AWID to 1 ")    
  //wait_for_n_clks (1);
  AWID = 1'b1;
  `g2u_display (" End pass_test_a_af_axi_AWID_stable ")
`SVTEST_END

//************************************************************
// Test:
//   fail_test_a_af_axi_AWID_stable
//
// Desc:
//   Unit test for CIP_ID: test_a_af_axi_AWID_stable
//  Driving AWVALID =1 and AWREADY =0
//   Expected result: FAIL
//************************************************************
`SVTEST(fail_test_a_af_axi_AWID_stable)
  `g2u_display ("fail_test_a_af_axi_AWID_stable")
  `g2u_display("Driving AWVALID to 1")
  AWVALID=1'b1;
  `g2u_display("Driving AWREADY to 0")    
  AWREADY=1'b0;
  `g2u_display("Driving AWID to 1 ")    
  //wait_for_n_clks (1);
  AWID = 1'b1;
		
  wait_for_n_clks (2);		 
  `g2u_display("Driving AWVALID to 1")
  AWVALID=1'b1;
  `g2u_display("Driving AWREADY to 0")    
  AWREADY=1'b0;
  `g2u_display("Driving AWID to 1 ")    
  //wait_for_n_clks (1);
  AWID = 1'b0;
  `g2u_display (" End fail_test_a_af_axi_AWID_stable ")
`SVTEST_END
