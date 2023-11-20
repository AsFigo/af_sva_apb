//************************************************************
  // Test:
  //   pass_AXI_ERRM_WSTRB_STABLE
  //
  // Desc:
  //   Unit test for CIP_ID: test_AXI_ERRM_WSTRB_X.sv
  //   WVALID = 1,  WSTRB =8'b1
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRM_WSTRB_X)

    `g2u_display ("pass_AXI_ERRM_WSTRB_X")
    WVALID = 1'b1;
    `g2u_display ("Driving WVALID to 1")
    WSTRB = 8'b1;
    `g2u_display ("Driving WSTRB to 1")
    wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRM_WSTRB_X")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRM_WSTRB_X
  //
  // Desc:
  //   Unit test for CIP_ID: AXI_ERRM_WSTRB_X
  //   WVALID = 1,  WSTRB =8'bX 
  //   Expected result: FAIL
  //************************************************************

   `SVTEST(fail_AXI_ERRM_WSTRB_X)

    `g2u_display ("fail_AXI_ERRM_WSTRB_X")
    WVALID = 1'b1;
    `g2u_display ("Driving WVALID to 1")
    WSTRB = 8'bx;
   `g2u_display ("Driving WSTRB to 8'bx")
    wait_for_n_clks (10); 
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_WSTRB_X")
    `g2u_display ("End pass_AXI_ERRM_WSTRB_X")

  `SVTEST_END
