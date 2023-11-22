//************************************************************
  // Test:
  //   pass_test_AXI_ERRM_WDATA_STABLE
  //
  // Desc:
  //   Unit test for CIP_ID: AXI_ERRM_WDATA_STABLE
  //   WVALID = 1, WREADY = 0, WSTRB =8'b1, WDATA  = $STABLE
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRM_WSTRB_STABLE)

    `g2u_display ("pass_AXI_ERRM_WSTRB_STABLE")
    WVALID = 1'b1;
    `g2u_display ("Driving WVALID to 1")
    WSTRB = 8'b1;
    `g2u_display ("Driving WSTRB to 8'b1")
    WREADY = 1'b0;
    `g2u_display ("Driving WREADY to 0")
    wait_for_n_clks (1); 
    `g2u_display ("Driving WREADY to 1")
    WREADY = 1'b0;
    wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRM_WSTRB_STABLE")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRM_WSTRB_STABLE
  //
  // Desc:
  //   Unit test for CIP_ID: AXI_ERRM_WSTRB_STABLE
  //   WVALID = 1, WREADY = 0, WSTRB = 8'b1 , WSTRB  = 8'bx
  //   Expected result: FAIL
  //************************************************************
   `SVTEST(fail_AXI_ERRM_WSTRB_STABLE)

    `g2u_display ("fail_AXI_ERRM_WSTRB_STABLE")
    WVALID = 1'b1;
    `g2u_display ("Driving WVALID to 1")
    WSTRB = 8'b00000001;
    `g2u_display ("Driving WSTRB to 1")
    WREADY = 1'b0;
    `g2u_display ("Driving WREADY to 0")
    wait_for_n_clks (1); 
   `g2u_display ("Driving WSTRB to 3")
    WSTRB = 8'b00000011;
    wait_for_n_clks (10); 
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_WSTRB_STABLE")
    `g2u_display ("End fail_AXI_ERRM_WSTRB_STABLE")

  `SVTEST_END
