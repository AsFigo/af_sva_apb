//************************************************************
  // Test:
  //   pass_AXI_ERRS_RVALID_STABLE
  //
  // Desc:
  //   Unit test for CIP_ID: AXI_ERRS_RVALID_STABLE
  //   RVALID = 1, RREADY = 0
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRS_RVALID_STABLE)

    `g2u_display ("pass_AXI_ERRM_RVALID_STABLE")
    ARESETn = 1'b0;
    `g2u_display ("Driving ARESETn to 0")
    RVALID = 1'b0;
    `g2u_display ("Driving RVALID to 0")
    RREADY = 0;
   `g2u_display ("Driving RREADY to 0")
   wait_for_n_clks (10);
   ARESETn = 1'b1;
   `g2u_display ("Driving ARESETn to 1")
   wait_for_n_clks (10);
   RVALID = 1'b1;
    `g2u_display ("Driving RVALID to 1")
    RREADY = 0;
   `g2u_display ("Driving RREADY to 0")
   wait_for_n_clks (10);
   `g2u_display ("Driving RREADY to 1")
   RREADY = 1;
    wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRS_RVALID_STABLE")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRS_RVALID_STABLE
  //
  // Desc:
  //   Unit test for CIP_ID: AXI_ERRM_RVALID_STABLE
  //   RVALID = 0, RREADY=0, RVALID = 1 
  //   Expected result: FAIL
  //************************************************************
   `SVTEST(fail_AXI_ERRM_VALID_STABLE)

    `g2u_display ("fail_AXI_ERRM_WDATA_STABLE")
     ARESETn = 1'b0;
    `g2u_display ("Driving ARESETn to 0")
    RVALID = 1'b0;
    `g2u_display ("Driving RVALID to 0")
    RREADY = 0;
   `g2u_display ("Driving RREADY to 0")
   wait_for_n_clks (10);
   ARESETn = 1'b1;
   `g2u_display ("Driving ARESETn to 1")
   wait_for_n_clks (10);
   RVALID = 1'b1;
   `g2u_display ("Driving RVALID to 1")
   RREADY = 0;
   `g2u_display ("Driving RREADY to 0")
   wait_for_n_clks (10); 
   `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_RVALID_STABLE")
   `g2u_display ("End fail_AXI_ERRM_RVALID_STABLE")

  `SVTEST_END

