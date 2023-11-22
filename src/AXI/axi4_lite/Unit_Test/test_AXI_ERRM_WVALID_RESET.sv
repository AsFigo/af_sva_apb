//************************************************************
  // Test:
  //   pass_test_AXI_ERRM_WVALID_RESET
  //
  // Desc:
  //   Unit test for CIP_ID: AXI_ERRM_WVALID_RESET
  //   WVALID = 1, ARESETn = 1
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRM_WDATA_STABLE)

    `g2u_display ("pass_AXI_ERRM_WVALID_RESET")
    WVALID = 1'b1;
    `g2u_display ("Driving WVALID to 1")
    ARESETn = 0;
    `g2u_display ("Driving ARESETn to 0")
    wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRM_WVALID_RESET")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRM_WVALID_RESET
  //
  // Desc:
  //   Unit test for CIP_ID: AXI_ERRM_WVALID_RESET
  //   WVALID = 0, ARESETn=0, WVALID = 1, ARESETn=1
  //   Expected result: FAIL
  //************************************************************
   `SVTEST(fail_AXI_ERRM_WDATA_STABLE)

    `g2u_display ("fail_AXI_ERRM_WDATA_STABLE")
    WVALID = 1'b0;
    `g2u_display ("Driving WVALID to 0")
    ARESETn = 0;
    `g2u_display ("Driving ARESETn to 0")
    wait_for_n_clks (1); 
     ARESETn = 1;
  `g2u_display ("Driving ARESETn to 1")
    WVALID = 1'b1;
    `g2u_display ("Driving WVALID to 1")
    wait_for_n_clks (10); 
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_WDATA_STABLE")
    `g2u_display ("End fail_AXI_ERRM_WDATA_STABLE")

  `SVTEST_END

