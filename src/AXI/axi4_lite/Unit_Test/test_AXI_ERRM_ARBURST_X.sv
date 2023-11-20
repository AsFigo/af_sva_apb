//************************************************************
  // Test:
  //   pass_AXI_ERRM_ARBURST_X
  //
  // Desc: A value of X on ARBURST is not permitted when ARVALID is HIGH
  //   Unit test for CIP_ID: AXI_ERRM_ARBURST_X
  //   ARVALID= 1, ARBURST =2'b10
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRM_ARBURST_X)

    `g2u_display ("pass_AXI_ERRM_ARBURST_X")
    ARVALID = 1'b1;
    `g2u_display ("Driving ARVALID to 1")
    ARBURST = 2'b10;
    `g2u_display ("Driving ARBURST to 2'b10")
     wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRM_ARBURST_X")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRM_ARBURST_X
  //
  // Desc: A value of X on ARBURST is not permitted when ARVALID is HIGH 
  //   Unit test for CIP_ID: AXI_ERRM_ARBURST_X
  //   ARVALID = 1, ARBURST  = 2'bXX
  //   Expected result: FAIL
  //************************************************************
   `SVTEST(fail_AXI_ERRM_ARBURST_X)

    `g2u_display ("fail_AXI_ERRM_ARBURST_X")
    ARVALID = 1'b1;
    `g2u_display ("Driving ARVALID to 1")
    ARBURST = 2'bXX;
    `g2u_display ("Driving ARBURST to 2'bXX")
     wait_for_n_clks (10);
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_ARBURST_X")
    `g2u_display ("End fail_AXI_ERRM_ARBURST_X")

  `SVTEST_END

