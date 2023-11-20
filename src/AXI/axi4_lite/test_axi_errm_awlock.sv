//************************************************************
  // Test:
  //   pass_axi_errm_awlock
  //
  // Desc: AWLOCK is not 2'b11 when AWVALID is HIGH
  //   Unit test for CIP_ID: axi_errm_awlock
  //   AWVALID = 1,  AWLOCK = 2'b01
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_axi_errm_awlock)

    `g2u_display ("pass_axi_errm_awlock")
    `g2u_display ("Driving Avalid to 1")
    AWVALID = 1'b1;
    `g2u_display ("Driving AWLOCK to 2'b01 ")
     AWLOCK = 2'b01;
    wait_for_n_clks (10); 
    `g2u_display ("End pass_axi_errm_awlock")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_axi_errm_awlock
  //
  // Desc: AWLOCK is not 2'b11 when AWVALID is HIGH
  //   Unit test for CIP_ID:axi_errm_awlock
  //   AWVALID = 1,  AWLOCK = 2'b11
  //   Expected result: FAIL
  //************************************************************
`SVTEST(fail_axi_errm_awlock)

  
    `g2u_display ("fail_axi_errm_awlock")
    `g2u_display ("Driving Avalid to 1")
    AWVALID = 1'b1;
    `g2u_display ("Driving AWLOCK to 2'b11")
     AWLOCK = 2'b11;
    wait_for_n_clks (10);
    `FAIL_IF_LOG(1, "Expected FAIL axi_errm_awlock")
    `g2u_display ("End fail_axi_errm_awlock")

  `SVTEST_END
