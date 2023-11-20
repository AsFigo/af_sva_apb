//************************************************************
// Test:
//   pass_a_af_axi_X_AWLEN
//
// Desc:
//   Unit test for CIP_ID: a_af_axi_X_AWLEN
//   Driving AWVALID = 1 and AWREADY =0
//   Expected result: PASS
//************************************************************
`SVTEST(pass_a_af_axi_X_AWLEN)
  `g2u_display ("pass_a_af_axi_X_AWLEN ")
  `g2u_display("Driving ARESETn to 0")
   ARESETn =1'b0;
  `g2u_display("Driving AWVALID to 1")
  AWVALID=1'b1;
  `g2u_display("Driving AWREADY to 0")
  AWREADY=1'b0;
  `g2u_display("Driving AWLEN to 01 ")
  //wait_for_n_clks (1);
  AWLEN = 8’h01';
  wait_for_n_clks (1);  
  `g2u_display ("End pass_a_af_axi_AWLEN_stable ")
`SVTEST_END

//************************************************************
// Test:
//   fail_a_af_axi_X_AWLEN
//
// Desc:
//   Unit test for CIP_ID: a_af_axi_X_AWLEN
//   Driving AWVALID = 1 and AWREADY =0
//   Expected result: FAIL
//************************************************************
`SVTEST(fail_a_af_axi_X_AWLEN)
  `g2u_display ("fail_a_af_axi_X_AWLEN ")
  `g2u_display("Driving ARESETn to 0")
  ARESETn =1'b0;
  `g2u_display("Driving AWVALID to 1")
  AWVALID=1'b1;
  `g2u_display("Driving AWREADY to 0")
  AWREADY=1'b0;
  `g2u_display("Driving AWLEN to x ")
  //wait_for_n_clks (1);
  AWLEN = 8'bx;
  wait_for_n_clks (2);  
  `g2u_display ("End fail_a_af_axi_X_AWLEN")
`SVTEST_END
