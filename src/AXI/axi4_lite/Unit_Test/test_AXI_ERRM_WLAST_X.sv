//************************************************************
  // Test:
  //   pass_AXI_ERRM_WLAST_STABLE
  //
  // Desc:
  //   Unit test for CIP_ID: AXI_ERRM_WLAST_X.sv
  //   WVALID = 1, WLAST = 1 
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRM_WLAST_X)

    `g2u_display ("pass_AXI_ERRM_WLAST_X")
    WVALID = 1'b1;
    `g2u_display ("Driving WVALID to 1")
    WLAST = 1;
    `g2u_display ("Driving WLAST to 1")
    wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRM_WLAST_X")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRM_WLAST_X
  //
  // Desc:
  //   Unit test for CIP_ID: AXI_ERRM_WLAST_X
  //   WVALID = 1, WLAST = 1, WLAST = X 
  //   Expected result: FAIL
  //************************************************************

   `SVTEST(fail_AXI_ERRM_WLAST_X)

    `g2u_display ("fail_AXI_ERRM_WLAST_X")
    WVALID = 1'b1;
    `g2u_display ("Driving WVALID to ")
    WLAST = 1;
    `g2u_display ("Driving WLAST to 1")
    wait_for_n_clks (1); 
    WLAST = 1'bX;
    `g2u_display ("Driving WLAST to X")
    wait_for_n_clks (10);
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_WLAST_X")
    `g2u_display ("End pass_AXI_ERRM_WLAST_X")

  `SVTEST_END
