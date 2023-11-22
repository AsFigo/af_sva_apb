//************************************************************
  // Test:
  //   pass_test_AXI_ERRM_AWID_STABLE
  //
  // Desc:
  //   Unit test for CIP_ID: test_AXI_ERRM_AWID_STABLE.sv
  //   AWVALID = 1, AWREADY = 0, AWID =1 ,  WID  = $STABLE
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRM_AWID_STABLE)

    `g2u_display ("pass_AXI_ERRM_AWID_STABLE")
    AWVALID = 1'b1;
    `g2u_display ("Driving AWVALID to 1")
    AWID = 4'b001;
   `g2u_display ("Driving AWIDto 1")
    AWREADY = 1'b0;
    `g2u_display ("Driving AWREADY to 0")
    wait_for_n_clks (1); 
    `g2u_display ("Driving AWREADY to 0")
    AWREADY = 1'b0;
    wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRM_AWID_STABLE")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRM_AWID_STABLE
  //
  // Desc:
  //   Unit test for CIP_ID: AXI_ERRM_AWID_STABLE
  //   AWVALID = 1, AWREADY = 0, AWID =1 ,  WID  = $STABLE
  //   Expected result: FAIL
  //************************************************************
   `SVTEST(fail_AXI_ERRM_AWID_STABLE)

    `g2u_display ("fail_AXI_ERRM_AWID_STABLE")
    AWVALID = 1'b1;
    `g2u_display ("Driving AWVALID to 1")
    AWID = 4'b0010;
    `g2u_display ("Driving AWID to 2")
    AWREADY = 1'b0;
    `g2u_display ("Driving AWREADY to 0")
    wait_for_n_clks (1); 
    `g2u_display ("Driving AWID to 3")
    AWID = 4'b0011;
    wait_for_n_clks (10); 
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_AWID_STABLE")
    `g2u_display ("End fail_AXI_ERRM_AWID_STABLE")

  `SVTEST_END


