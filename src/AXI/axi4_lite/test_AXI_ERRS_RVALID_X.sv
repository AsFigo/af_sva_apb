//************************************************************
  // Test:
  //   pass_AXI_ERRS_RVALID_X
  //
  // Desc: A value of X on RVALID is not permitted when not in reset
  //   Unit test for CIP_ID: AXI_ERRS_RVALID_X
  //   RVALID= 0, ARESETn =1;
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRS_RVALID_X)

    `g2u_display ("pass_AXI_ERRS_RVALID_X")
    ARESETn = 1'b1;
    `g2u_display ("Driving ARESETn to 1")
    RVALID = 1'b0;
    `g2u_display ("Driving RVALID to 0")
     wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRS_RVALID_X")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRS_RVALID_X
  //
  // Desc: A value of X on RVALID is not permitted when not in reset
  //   Unit test for CIP_ID: AXI_ERRS_RVALID_X
  //   RVALID = x, ARESETn=1'b1
  //   Expected result: FAIL
  //************************************************************
   `SVTEST(fail_AXI_ERRS_RVALID_X)

    `g2u_display ("fail_AXI_ERRS_RVALID_X")
     ARESETn = 1'b1;
    `g2u_display ("Driving ARESETn to 1")
    RVALID = 1'bx;
    `g2u_display ("Driving RVALID to x")
    wait_for_n_clks (10);
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRS_RVALID_X")
    `g2u_display ("End fail_AXI_ERRS_RVALID_X")

  `SVTEST_END

