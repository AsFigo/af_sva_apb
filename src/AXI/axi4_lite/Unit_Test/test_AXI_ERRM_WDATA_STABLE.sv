//************************************************************
  // Test:
  //   pass_AXI_ERRM_WDATA_STABLE
  //
  // Desc:
  //   Unit test for CIP_ID: AXI_ERRM_WDATA_STABLE
  //   WVALID = 1, WREADY = 0, WDATA =8'b1, WDATA  = $STABLE
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRM_WDATA_STABLE)

    `g2u_display ("pass_AXI_ERRM_WDATA_STABLE")
    WVALID = 1'b1;
    `g2u_display ("Driving WVALID to 1")
    WDATA = 8'b1;
    `g2u_display ("Driving WDATA to 8'b1")
    WREADY = 1'b0;
    `g2u_display ("Driving WREADY to 0")
    wait_for_n_clks (1); 
    `g2u_display ("Driving WREADY to 1")
    WREADY = 1'b1;
    wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRM_WDATA_STABLE")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRM_WDATA_STABLE
  //
  // Desc:
  //   Unit test for CIP_ID: AXI_ERRM_WDATA_STABLE
  //   WVALID = 1, WREADY = 0, WDATA = 8'b1 , WDATA  = 8'bx
  //   Expected result: FAIL
  //************************************************************
   `SVTEST(fail_AXI_ERRM_WDATA_STABLE)

    `g2u_display ("fail_AXI_ERRM_WDATA_STABLE")
    WVALID = 1'b1;
    `g2u_display ("Driving WVALID to 1")
    WDATA = 8'b11;
    `g2u_display ("Driving WDATA to 8'b1")
    WREADY = 1'b0;
    `g2u_display ("Driving WREADY to 0")
    wait_for_n_clks (1); 
   `g2u_display ("Driving WID to 8'bx")
    WDATA = 8'bx;
    wait_for_n_clks (10); 
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_WDATA_STABLE")
    `g2u_display ("End fail_AXI_ERRM_WDATA_STABLE")

  `SVTEST_END


