//************************************************************
  // Test:
  //   pass_AXI_ERRS_RRES_X
  //
  // Desc: A value of X on RRESP is not permitted when RVALID is HIGH
  //   Unit test for CIP_ID: AXI_ERRS_RRES_X
  //   RRESP=2'b00, RVALID =1;
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRS_RRES_X)

    `g2u_display ("pass_AXI_ERRS_RRES_X")
    RVALID = 1'b1;
    `g2u_display ("Driving RVALID to 1")
    RRESP = 2'b00;
    `g2u_display ("Driving RRESP to 00")
     wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRS_RRES_X")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRS_RRES_X
  //
  // Desc: A value of X on RRESP is not permitted when RVALID is HIGH
  //   Unit test for CIP_ID: AXI_ERRS_RRES_X
  //   RRESP = x, RVALID=0
  //   Expected result: FAIL
  //************************************************************
   `SVTEST(fail_AXI_ERRS_RRES_X)

    `g2u_display ("fail_AXI_ERRS_RRES_X")
     RVALID = 1'b1;
    `g2u_display ("Driving RVALID to 1")
    RRESP = 2'bxx;
    `g2u_display ("Driving RRESP to x")
    wait_for_n_clks (10);
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRS_RRES_X")
    `g2u_display ("End fail_AXI_ERRS_RRES_X")

  `SVTEST_END

