//************************************************************
  // Test:
  //   pass_AXI_ERRM_WVALID_X
  //
  // Desc: A value of X on WVALID is not permitted when not in reset
  //   Unit test for CIP_ID: AXI_ERRM_WVALID_X
  //   ARVALID= 1, ARESETn =1;
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRM_WVALID_X)

    `g2u_display ("pass_AXI_ERRM_WVALID_X")
    ARESETn = 1'b1;
    `g2u_display ("Driving ARESETn to 1")
    ARVALID = 1'b0;
    `g2u_display ("Driving ARVALID to 0")
     wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRM_WVALID_X")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRM_WVALID_X
  //
  // Desc: A value of X on WVALID is not permitted when not in reset
  //   Unit test for CIP_ID: AXI_ERRM_WVALID_X
  //   ARVALID = x, ARESETn=1
  //   Expected result: FAIL
  //************************************************************
   `SVTEST(fail_AXI_ERRM_WVALID_X)

    `g2u_display ("fail_AXI_ERRM_WVALID_X")
     ARESETn = 1'b1;
    `g2u_display ("Driving ARESETn to 1")
    ARVALID = 1'bx;
    `g2u_display ("Driving ARVALID to x")
    ARESETn = 1'b0;
    `g2u_display ("Driving ARESETn to 0")
    wait_for_n_clks (10);
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_WVALID_X")
    `g2u_display ("End fail_AXI_ERRM_WVALID_X")

  `SVTEST_END

