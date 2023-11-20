//************************************************************
  // Test:
  //   pass_AXI_ERRM_AWBURST
  //
  // Desc: A value of 2'b11 on AWBURST is not permitted when AWVALID is HIGH  
  //   Unit test for CIP_ID: AXI_ERRM_AWBURST
  //   AWVALID= 1, AWBURST =2'b10, AWBURST  = 2'b01
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRM_AWBURST)

    `g2u_display ("pass_AXI_ERRM_AWBURST")
    AWVALID = 1'b1;
    `g2u_display ("Driving AWVALID to 1")
    AWBURST = 2'b10;
    `g2u_display ("Driving AWBURST to 2'b10")
    wait_for_n_clks (1); 
    AWBURST = 2'b01;
    `g2u_display ("Driving AWBURST to 2'b01")
    wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRM_AWBURST")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRM_AWBURST
  //
  // Desc: A value of 2'b11 on AWBURST is not permitted when AWVALID is HIGH
  //   Unit test for CIP_ID: AXI_ERRM_AWBURST
  //   AWVALID = 1, AWBURST = 2'b11 
  //   Expected result: FAIL
  //************************************************************
   `SVTEST(fail_AXI_ERRM_AWBURST)

    `g2u_display ("fail_AXI_ERRM_AWBURST")
    AWVALID = 1'b1;
    `g2u_display ("Driving AWVALID to 1")
    AWBURST = 2'b11;
    `g2u_display ("Driving AWBURST to 2'b11")
      wait_for_n_clks (10);
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_AWBURST")
    `g2u_display ("End fail_AXI_ERRM_AWBURST")

  `SVTEST_END

