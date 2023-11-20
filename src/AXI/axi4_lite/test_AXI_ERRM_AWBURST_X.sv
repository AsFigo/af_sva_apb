//************************************************************
  // Test:
  //   pass_AXI_ERRM_AWBURST_X
  //
  // Desc: A value of X on AWBURST is not permitted when AWVALID is HIGH
  //   Unit test for CIP_ID: AXI_ERRM_AWBURST_X
  //   AWVALID= 1, AWBURST =2'b10
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRM_AWBURST_X)

    `g2u_display ("pass_AXI_ERRM_AWBURST_X")
    AWVALID = 1'b1;
    `g2u_display ("Driving AWVALID to 1")
    AWBURST = 2'b10;
    `g2u_display ("Driving AWBURST to 2'b10")
     wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRM_AWBURST_X")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRM_AWBURST_X
  //
  // Desc: A value of X on AWBURST is not permitted when AWVALID is HIGH 
  //   Unit test for CIP_ID: AXI_ERRM_AWBURST_X
  //   AWVALID = 1, AWBURST  = 2'bXX
  //   Expected result: FAIL
  //************************************************************
   `SVTEST(fail_AXI_ERRM_AWBURST_X)

    `g2u_display ("fail_AXI_ERRM_AWBURST_X")
    AWVALID = 1'b1;
    `g2u_display ("Driving AWVALID to 1")
    AWBURST = 2'bXX;
    `g2u_display ("Driving AWBURST to 2'bXX")
     wait_for_n_clks (10);
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_AWBURST_X")
    `g2u_display ("End fail_AXI_ERRM_AWBURST_X")

  `SVTEST_END

