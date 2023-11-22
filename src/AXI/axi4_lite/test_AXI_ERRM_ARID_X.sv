//************************************************************
  // Test:
  //   pass_AXI_ERRM_ARID_X
  //
  // Desc: A value of X on ARID is not permitted when ARVALID is HIGH
  //   Unit test for CIP_ID: AXI_ERRM_ARID_X
  //   ARVALID= 1, ARID =4'b0, ARID  = 4'b1
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRM_ARID_X)

    `g2u_display ("pass_AXI_ERRM_ARID_X")
    ARVALID = 1'b1;
    `g2u_display ("Driving ARVALID to 1")
    ARID = 4'b0;
    `g2u_display ("Driving ARID to 0")
    wait_for_n_clks (1); 
    ARID = 4'b1;
    `g2u_display ("Driving ARID to 1")
    wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRM_ARID_X")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRM_ARID_X
  //
  // Desc: A value of X on ARID is not permitted when ARVALID is HIGH
  //   Unit test for CIP_ID: AXI_ERRM_ARID_X
  //   ARVALID = 1, ARID = 4'b0 , ARID  = 4'bX
  //   Expected result: FAIL
  //************************************************************
   `SVTEST(fail_AXI_ERRM_ARID_X)

    `g2u_display ("fail_AXI_ERRM_ARID_X")
    ARVALID = 1'b1;
    `g2u_display ("Driving ARVALID to 1")
    ARID = 4'b0;
    `g2u_display ("Driving ARID to 4'b0")
    wait_for_n_clks (1); 
    ARID = 4'bX;
`g2u_display ("Driving ARID to 4'bX")
    wait_for_n_clks (10);
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_ARID_X")
    `g2u_display ("End fail_AXI_ERRM_ARID_X")

  `SVTEST_END

