//************************************************************
  // Test:
  //   pass_AXI_ERRM_WID_STABLE
  //
  // Desc:
  //   Unit test for CIP_ID: test_AXI_ERRM_WID_X.sv
  //   WVALID = 1,  WID =8'b1 
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRM_WID_X)

    `g2u_display ("pass_AXI_ERRM_WID_X")
    WVALID = 1'b1;
    `g2u_display ("Driving WVALID to 1")
    WID = 8'b1;
    `g2u_display ("Driving WID to 1")
    wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRM_WID_X")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRM_WID_X
  //
  // Desc:
  //   Unit test for CIP_ID: AXI_ERRM_WID_X
  //   WVALID = 0,  WID =8'bX 
  //   Expected result: FAIL
  //************************************************************

   `SVTEST(fail_AXI_ERRM_WID_X)

    `g2u_display ("fail_AXI_ERRM_WID_X")
    WVALID = 1'b0;
    `g2u_display ("Driving WVALID to 0")
    WID = 8'bx;
    `g2u_display ("Driving WID to 8'bx")
    wait_for_n_clks (10); 
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_WID_X")
    `g2u_display ("End pass_AXI_ERRM_WID_X")

  `SVTEST_END
