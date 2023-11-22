//************************************************************
  // Test:
  //   pass_test_AXI_ERRM_WID_STABLE
  //
  // Desc:
  //   Unit test for CIP_ID: test_AXI_ERRM_WID_STABLE.sv
  //   WVALID = 1, WREADY = 0, WID =1 ,  WID  = $STABLE
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRM_WID_STABLE)

    `g2u_display ("pass_AXI_ERRM_WID_STABLE")
    WVALID = 1'b1;
    `g2u_display ("Driving WVALID to 1")
    WID = 8'b1;
   `g2u_display ("Driving WIDto 1")
    WREADY = 1'b0;
    `g2u_display ("Driving WREADY to 0")
    wait_for_n_clks (1); 
    `g2u_display ("Driving WREADY to 1")
    WREADY = 1'b0;
    wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRM_WID_STABLE")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRM_WID_STABLE
  //
  // Desc:
  //   Unit test for CIP_ID: AXI_ERRM_WID_STABLE
  //   WVALID = 1, WREADY = 0, WID =1 ,  WID  = $STABLE
  //   Expected result: FAIL
  //************************************************************
   `SVTEST(fail_AXI_ERRM_WID_STABLE)

    `g2u_display ("fail_AXI_ERRM_WID_STABLE")
    WVALID = 1'b1;
    `g2u_display ("Driving WVALID to 1")
    WID = 8'b10;
    `g2u_display ("Driving WID to 2")
    WREADY = 1'b0;
    `g2u_display ("Driving WREADY to 0")
    wait_for_n_clks (1); 
    `g2u_display ("Driving WID to 3")
    WID = 8'b11;
    wait_for_n_clks (10); 
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_WID_STABLE")
    `g2u_display ("End fail_AXI_ERRM_WID_STABLE")

  `SVTEST_END


