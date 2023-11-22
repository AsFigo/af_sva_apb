//************************************************************
  // Test:
  //   pass_AXI_ERRS_WREADY_X
  //
  // Desc: A value of X on WREADY is not permitted when not in reset
  //   Unit test for CIP_ID: AXI_ERRS_WREADY_X
  //   WREADY= 0, ARESETn =1;
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRS_WREADY_X)

    `g2u_display ("pass_AXI_ERRS_WREADY_X")
    ARESETn = 1'b1;
    `g2u_display ("Driving ARESETn to 1")
    WREADY = 1'b0;
    `g2u_display ("Driving WREADY to 0")
     wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRS_WREADY_X")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRS_WREADY_X
  //
  // Desc: A value of X on WREADY is not permitted when not in reset
  //   Unit test for CIP_ID: AXI_ERRS_WREADY_X
  //   WREADY = x, ARESETn=1'b1
  //   Expected result: FAIL
  //************************************************************
   `SVTEST(fail_AXI_ERRS_WREADY_X)

    `g2u_display ("fail_AXI_ERRS_WREADY_X")
     ARESETn = 1'b1;
    `g2u_display ("Driving ARESETn to 1")
    WREADY = 1'bx;
    `g2u_display ("Driving WREADY to x")
    wait_for_n_clks (10);
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRS_WREADY_X")
    `g2u_display ("End fail_AXI_ERRS_WREADY_X")

  `SVTEST_END

