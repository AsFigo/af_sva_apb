//************************************************************
  // Test:
  //   pass_AXI_ERRM_AWADDR_STABLE
  //
  // Desc:
  //   Unit test for CIP_ID: AXI_ERRM_AWADDR_X.sv
  //   AWVALID = 1, AWADDR = 1 
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRM_AWADDR_X)

    `g2u_display ("pass_AXI_ERRM_AWADDR_X")
    AWVALID = 1'b1;
    `g2u_display ("Driving AWVALID to 1")
    AWADDR = 32'b00001;
    `g2u_display ("Driving AWADDR to 1")
    wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRM_AWADDR_X")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRM_AWADDR_X
  //
  // Desc:
  //   Unit test for CIP_ID: AXI_ERRM_AWADDR_X
 //   AWVALID = 1, AWADDR = 1, AWADDR = X 
  //   Expected result: FAIL
  //************************************************************

   `SVTEST(fail_AXI_ERRM_AWADDR_X)

    `g2u_display ("fail_AXI_ERRM_AWADDR_X")
    AWVALID = 1'b1;
    `g2u_display ("Driving AWVALID to ")
    AWADDR = 32'b00001;
    `g2u_display ("Driving AWADDR to 1")
    wait_for_n_clks (1); 
    AWADDR = 32'bx;
    `g2u_display ("Driving AWADDR to X")
    wait_for_n_clks (10);
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_AWADDR_X")
    `g2u_display ("End pass_AXI_ERRM_AWADDR_X")

  `SVTEST_END
