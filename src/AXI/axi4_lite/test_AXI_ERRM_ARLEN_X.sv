//************************************************************
  // Test:
  //   pass_AXI_ERRM_ARLEN_X
  //
  // Desc:A value of X on ARLEN is not permitted when ARVALID is HIGH
  //   Unit test for CIP_ID: AXI_ERRM_ARLEN_X
  //   ARVALID= 1, ARLEN =8'b0, ARLEN  = 8'b1
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRM_ARLEN_X)

    `g2u_display ("pass_AXI_ERRM_ARLEN_X")
    ARVALID = 1'b1;
    `g2u_display ("Driving ARVALID to 1")
     ARLEN = 8'b0;
    `g2u_display ("Driving ARLEN to 0")
    wait_for_n_clks (1); 
    ARLEN = 8'b1;
    `g2u_display ("Driving ARLEN to 1")
    wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRM_ARLEN_X")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRM_ARLEN_X
  //
  // Desc:A value of X on ARLEN is not permitted when ARVALID is HIGH
  //   Unit test for CIP_ID: AXI_ERRM_ARLEN_X
  //   ARVALID = 1,  ARLEN = 0 , ARLEN  = X
  //   Expected result: FAIL
  //************************************************************
   `SVTEST(fail_AXI_ERRM_ARLEN_X)

    `g2u_display ("fail_AXI_ERRM_ARLEN_X")
    ARVALID = 1'b1;
    `g2u_display ("Driving ARVALID to 1")
    ARLEN = 8'b0;
    `g2u_display ("Driving ARLEN to 0")
    wait_for_n_clks (1); 
    ARLEN = 8'bX;
    `g2u_display ("Driving ARLEN to X")
    wait_for_n_clks (10);
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_ARLEN_X")
    `g2u_display ("End fail_AXI_ERRM_ARLEN_X")

  `SVTEST_END

