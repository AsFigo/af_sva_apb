//************************************************************
// Test:
//   pass_a_af_axi_AWADDR_stable
//
// Desc:
//   Unit test for CIP_ID: a_af_axi_AWADDR_stable
//   Driving AWVALID = 1 and AWREADY =0
//   Expected result: PASS
//************************************************************
`SVTEST(pass_a_af_axi_AWADDR_stable)
  `g2u_display ("pass_a_af_axi_AWADDR_stable")
  `g2u_display("Driving AWVALID to 1")
  AWVALID=1'b1;
  `g2u_display("Driving AWREADY to 0")
  AWREADY=1'b0;
  `g2u_display("Driving AWADDR ")
  //wait_for_n_clks (1);
  AWADDR = 32'hc56ed600;
  wait_for_n_clks (2);
  AWADDR = 32'hc56ed600;
  wait_for_n_clks (1);  
  `g2u_display ("End pass_a_af_axi_AWADDR_stable")
`SVTEST_END

//************************************************************
// Test:
//   fail_a_af_axi_AWADDR_stable
//
// Desc:
//   Unit test for CIP_ID: a_af_axi_AWADDR_stable
//   Driving AWVALID = 1 and AWREADY =0
//   Expected result: FAIL
//************************************************************
`SVTEST(fail_a_af_axi_AWADDR_stable)
  `g2u_display ("fail_a_af_axi_AWADDR_stable")
  `g2u_display("Driving AWVALID to 1")
  AWVALID=1'b1;
  `g2u_display("Driving AWREADYto 0")
  AWREADY= 1'b0;
  `g2u_display("Driving AWADDR ")
  //wait_for_n_clks (1);
  AWADDR = 32'hc56ed600;
  wait_for_n_clks (2);
  AWADDR = 32'hc50ed600;
  wait_for_n_clks (1);
  `g2u_display ("End fail_a_af_axi_AWADDR_stable")
`SVTEST_END
