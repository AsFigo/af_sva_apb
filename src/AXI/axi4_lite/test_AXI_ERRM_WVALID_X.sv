//************************************************************
  // Test:
  //   pass_AXI_ERRM_WVALID_X
  //
  // Desc: A value of X on WVALID is not permitted when not in reset
  //   Unit test for CIP_ID: AXI_ERRM_WVALID_X
  //   WVALID= 1, ARESETn =1;
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRM_WVALID_X)

    `g2u_display ("pass_AXI_ERRM_WVALID_X")
    ARESETn = 1'b1;
    `g2u_display ("Driving ARESETn to 1")
    WVALID = 1'b1;
    `g2u_display ("Driving WVALID to 1")
     wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRM_WVALID_X")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRM_WVALID_X
  //
  // Desc: A value of X on WVALID is not permitted when not in reset
  //   Unit test for CIP_ID: AXI_ERRM_WVALID_X
  //   WVALID = x, ARESETn=0
  //   Expected result: FAIL
  //************************************************************
   `SVTEST(fail_AXI_ERRM_WVALID_X)

    `g2u_display ("fail_AXI_ERRM_WVALID_X")
     ARESETn = 1'b0;
    `g2u_display ("Driving ARESETn to 0")
    WVALID = 1'b0;
    `g2u_display ("Driving WVALID to 0")
    ARESETn = 1'b0;
    `g2u_display ("Driving ARESETn to 0")
    WVALID = 1'bx;
    `g2u_display ("Driving WVALID to x")

    wait_for_n_clks (10);
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_WVALID_X")
    `g2u_display ("End fail_AXI_ERRM_WVALID_X")

  `SVTEST_END
