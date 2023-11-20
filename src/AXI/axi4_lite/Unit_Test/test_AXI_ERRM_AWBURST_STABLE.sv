//************************************************************
  // Test:
  //   pass_AXI_ERRM_AWBURST_STABLE
  //
  // Desc: AWBURST remains stable when AWVALID is asserted and AWREADY is LOW
  //   Unit test for CIP_ID: AXI_ERRM_AWBURST_STABLE
  //   AWVALID= 1, AWREADY = 0, AWBURST =2'b10, AWBURST  = $STABLE
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRM_AWBURST_STABLE)

    `g2u_display ("pass_AXI_ERRM_AWBURST_STABLE")
    AWVALID = 1'b1;
    `g2u_display ("Driving AWVALID to 1")
    AWREADY = 1'b0;
    `g2u_display ("Driving AWREADY to 0")
    AWBURST = 2'b10;
    `g2u_display ("Driving AWBURST to 2'b10")
    wait_for_n_clks (1); 
    AWBURST = 2'b10;
    `g2u_display ("Driving AWBURST to 2'b10")
    wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRM_AWBURST_STABLE")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRM_AWBURST_STABLE
  //
  // Desc: AWBURST remains stable when AWVALID is asserted and AWREADY is LOW
  //   Unit test for CIP_ID: AXI_ERRM_AWBURST_STABLE
  //   AWVALID = 1, AWREADY = 0, AWBURST = 2'b10 , AWBURST  = 2'b11
  //   Expected result: FAIL
  //************************************************************
   `SVTEST(fail_AXI_ERRM_AWBURST_STABLE)

    `g2u_display ("fail_AXI_ERRM_AWBURST_STABLE")
    AWVALID = 1'b1;
    `g2u_display ("Driving AWVALID to 1")
    AWREADY = 1'b0;
    `g2u_display ("Driving AWREADY to 0")
    AWBURST = 2'b10;
    `g2u_display ("Driving AWBURST to 2'b10")
    wait_for_n_clks (1); 
    AWBURST = 2'b11;
    `g2u_display ("Driving AWBURST to 2'b11")
    wait_for_n_clks (10);
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_AWBURST_STABLE")
    `g2u_display ("End fail_AXI_ERRM_AWBURST_STABLE")

  `SVTEST_END

