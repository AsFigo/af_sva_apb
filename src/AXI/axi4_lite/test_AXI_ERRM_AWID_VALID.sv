//************************************************************
  // Test:
  //   pass_AXI_ERRM_AWID_VALID
  //
  // Desc:
  //   Unit test for CIP_ID: AXI_ERRM_AWID_VALID.sv
  //   AWVALID = 1, AWID =  
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRM_AWID_VALID)

    `g2u_display ("pass_AXI_ERRM_AWID_VALID")
    AWVALID = 1'b1;
    `g2u_display ("Driving AWVALID to 1")
    AWID = 4'b1;
    `g2u_display ("Driving AWID to 1")
    wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRM_AWID_VALID")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRM_AWID_VALID  
  //
  // Desc:
  //   Unit test for CIP_ID: AXI_ERRM_AWID_VALID
  //   AWVALID = 1, AWID = 1, AWID = X 
  //   Expected result: FAIL
  //************************************************************

   `SVTEST(fail_AXI_ERRM_AWID_VALID)

    `g2u_display ("fail_AXI_ERRM_AWID_VALID")
    AWVALID = 1'b1;
    `g2u_display ("Driving AWVALID to 1")
    AWID = 4'b1;
    `g2u_display ("Driving AWID to 1")
    wait_for_n_clks (1); 
    AWID = 4'bx;
    `g2u_display ("Driving AWID to x")
    wait_for_n_clks (10);
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_AWID_VALID")
    `g2u_display ("End fail_AXI_ERRM_AWID_VALID")

  `SVTEST_END
