//************************************************************
// Test:
//   pass_AXI_ERRM_AWADDR_STABLE.sv//
// Desc:
//   Unit test for CIP_ID: AXI_ERRM_AWADDR_STABLE
//   Driving AWVALID = 1 and AWREADY =0
//   Expected result: PASS
//************************************************************
`SVTEST(pass_a_af_axi_AWADDR_stable)
  `g2u_display ("pass_AXI_ERRM_AWADDR_STABLE.sv")
  `g2u_display("Driving AWVALID to 1")
  AWVALID=1'b1;
  `g2u_display("Driving AWREADY to 0")
  AWREADY=1'b0;
  `g2u_display("Driving AWADDR ")
  //wait_for_n_clks (1);
  AWADDR = 32'hc56ed600;
  wait_for_n_clks (2);
   `g2u_display ("End pass_AXI_ERRM_AWADDR_STABLE")
`SVTEST_END

//************************************************************
// Test:
//   fail_a_af_axi_AWADDR_stable
//
// Desc:
//   Unit test for CIP_ID:AXI_ERRM_AWADDR_STABLE
//   Driving AWVALID = 1 and AWREADY =0
//   Expected result: FAIL
//************************************************************
`SVTEST(fail_AXI_ERRM_AWADDR_STABLE)
  `g2u_display ("fail_AXI_ERRM_AWADDR_STABLE")
  `g2u_display("Driving AWVALID to 1")
  AWVALID=1'b1;
  `g2u_display("Driving AWREADY to 0")
  AWREADY= 1'b0;
  `g2u_display("Driving AWADDR ")
  //wait_for_n_clks (1);
  AWADDR = 32'hc56ed600;
  wait_for_n_clks (2);
  AWADDR = 32'hc50ed600;
  wait_for_n_clks (1);
  `g2u_display ("End fail_AXI_ERRM_AWADDR_STABLE")
`SVTEST_END
