//************************************************************
  // Test:
  //   pass_AXI_ERRM_WDATA_STABLE
  //
  // Desc:
  //   Unit test for CIP_IDA: test_AXI_ERRM_WDATA_X.sv
  //   WVALID = 1,  WDATA =8'b1
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRM_WDATA_X)

    `g2u_display ("pass_AXI_ERRM_WDATA_X")
    WVALID = 1'b1;
    `g2u_display ("Driving WVALID to 1")
    WDATA = 8'b1;
    `g2u_display ("Driving WDATA to 1")
    wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRM_WDATA_X")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRM_WDATA_X
  //
  // Desc:
  //   Unit test for CIP_ID: AXI_ERRM_WDATA_X
  //   WVALID = 1,  WID =8'bx 
  //   Expected result: FAIL
  //************************************************************

   `SVTEST(fail_AXI_ERRM_WDATA_X)
    `g2u_display ("fail_AXI_ERRM_WDATA_X")
    WDATA = 8'b1;
    `g2u_display ("Driving WDATA to 8'b1")
    WVALID = 1'b1;
    `g2u_display ("Driving WVALID to 1")
    WDATA = 8'bx;
   `g2u_display ("Driving WDATA to 8'bx")
    wait_for_n_clks (10); 
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_WDATA_X")
    `g2u_display ("End pass_AXI_ERRM_WDATA_X")

  `SVTEST_END
