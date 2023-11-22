//************************************************************
  // Test:
  //   pass_AXI_ERRM_WLAST_STABLE
  //
  // Desc:
  //   Unit test for CIP_ID: AXI_ERRM_WLAST_STABLE
  //   WVALID = 1, WREADY = 0, WLAST = 1, WLAST = $STABLE
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRM_WLAST_STABLE)

    `g2u_display ("pass_AXI_ERRM_WDATA_STABLE")
    WVALID = 1'b1;
    `g2u_display ("Driving WVALID to 1")
    WLAST = 1;
    `g2u_display ("Driving WLAST to 1")
    WREADY = 1'b0;
    `g2u_display ("Driving WREADY to 0")
    wait_for_n_clks (1); 
    `g2u_display ("Driving WREADY to 0")
    WREADY = 1'b0;
    wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRM_WLAST_STABLE")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRM_WLAST_STABLE
  //
  // Desc:
  //   Unit test for CIP_ID: AXI_ERRM_WLAST_STABLE
  //   WVALID = 1, WREADY = 0, WLAST = 1 , WLAST = 0
  //   Expected result: FAIL
  //************************************************************
   `SVTEST(fail_AXI_ERRM_WLAST_STABLE)

    `g2u_display ("fail_AXI_ERRM_WLAST_STABLE")
    WVALID = 1'b1;
    `g2u_display ("Driving WVALID to 1")
    WLAST = 1;
    `g2u_display ("Driving WLAST to 1")
    WREADY = 1'b0;
    `g2u_display ("Driving WREADY to 0")
    wait_for_n_clks (1); 
    `g2u_display ("Driving WLAST to 0")
    WLAST = 0;
    wait_for_n_clks (10); 
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_WLAST_STABLE")
    `g2u_display ("End fail_AXI_ERRM_WLAST_STABLE")

  `SVTEST_END
