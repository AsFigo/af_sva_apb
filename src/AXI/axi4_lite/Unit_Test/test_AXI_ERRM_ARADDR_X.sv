//************************************************************
  // Test:
  //   pass_AXI_ERRM_ARADDR_X
  //
  // Desc:A value of X on ARADDR is not permitted when ARVALID is HIGH 
  //   Unit test for CIP_ID: AXI_ERRM_ARADDR_X
  //   ARVALID= 1, ARADDR =0, ARADDR  =1;
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRM_ARADDR_X)

    `g2u_display ("pass_AXI_ERRM_ARADDR_X")
    ARVALID = 1'b1;
    `g2u_display ("Driving ARVALID to 1")
    ARADDR = 32'b0;
    `g2u_display ("Driving ARADDR to 0")
    wait_for_n_clks (1); 
    ARADDR = 32'b1;
    `g2u_display ("Driving ARADDR to 1")
    wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRM_ARADDR_X")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRM_ARADDR_X
  //
  // Desc: A value of X on ARADDR is not permitted when ARVALID is HIGH
  //   Unit test for CIP_ID: AXI_ERRM_ARADDR_X
  //   ARVALID = 1, ARADDR = 1'b1 , ARADDR  = 1'bX
  //   Expected result: FAIL
  //************************************************************
   `SVTEST(fail_AXI_ERRM_ARADDR_X)

    `g2u_display ("fail_AXI_ERRM_ARADDR_X")
    ARVALID = 1'b1;
    `g2u_display ("Driving ARVALID to 1")
    ARADDR = 32'b1;
    `g2u_display ("Driving ARADDR to 1")
    wait_for_n_clks (1); 
    ARADDR = 32'bx;
    `g2u_display ("Driving ARADDR to X")
    wait_for_n_clks (10);
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_ARADDR_X")
    `g2u_display ("End fail_AXI_ERRM_ARADDR_X")

  `SVTEST_END

