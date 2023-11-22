//************************************************************
  // Test:
  //   pass_AXI_ERRM_AWLOCK
  //
  // Desc: AWLOCK is not 2'b11 when AWVALID is HIGH  
  //   Unit test for CIP_ID: AXI_ERRM_AWLOCK
  //   AWVALID= 1, AWLOCK =2'b10, AWLOCK  = 2'b01
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRM_AWLOCK)

    `g2u_display ("pass_AXI_ERRM_AWLOCK")
    AWVALID = 1'b1;
    `g2u_display ("Driving AWVALID to 1")
    AWLOCK = 2'b10;
    `g2u_display ("Driving AWLOCK to 2'b10")
    wait_for_n_clks (1); 
    AWLOCK = 2'b01;
    `g2u_display ("Driving AWLOCK to 2'b01")
    wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRM_AWLOCK")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRM_AWLOCK
  //
  // Desc:AWLOCK is not 2'b11 when AWVALID is HIGH 
  //   Unit test for CIP_ID: AXI_ERRM_AWLOCK
  //   AWVALID = 1, AWLOCK = 2'b11 
  //   Expected result: FAIL
  //************************************************************
   `SVTEST(fail_AXI_ERRM_AWLOCK)

    `g2u_display ("fail_AXI_ERRM_AWLOCK")
    AWVALID = 1'b1;
    `g2u_display ("Driving AWVALID to 1")
    AWLOCK = 2'b11;
    `g2u_display ("Driving AWLOCK to 2'b11")
      wait_for_n_clks (10);
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_AWLOCK")
    `g2u_display ("End fail_AXI_ERRM_AWLOCK")

  `SVTEST_END

