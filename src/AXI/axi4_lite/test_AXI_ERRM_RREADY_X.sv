//************************************************************
  // Test:
  //   pass_AXI_ERRM_RREADY_X
  //
  // Desc: A value of X on RREADY is not permitted when ARVALID is HIGH
  //   Unit test for CIP_ID: AXI_ERRM_RREADY_X
  //   ARESETn, RREADY 
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRM_RREADY_X)

    `g2u_display ("pass_AXI_ERRM_RREADY_X")
    ARESETn = 1'b0;
    `g2u_display ("Driving ARESETn to 0")
    RREADY = 1'b0;
    `g2u_display ("Driving RREADY to 1'b0")
    wait_for_n_clks (10); 
    ARESETn = 1'b1;
    `g2u_display ("Driving ARESETn to 1")
    wait_for_n_clks (10);
    `g2u_display ("End pass_AXI_ERRM_RREADY_X")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRM_RREADY_X
  //
  // Desc: A value of X on RREADY is not permitted when ARVALID is HIGH 
  //   Unit test for CIP_ID: AXI_ERRM_RREADY_X
  //   ARVALID = 1, RREADY  = 2'bXX
  //   Expected result: FAIL
  //************************************************************
   `SVTEST(fail_AXI_ERRM_RREADY_X)

    `g2u_display ("fail_AXI_ERRM_RREADY_X")
     ARESETn = 1'b0;
    `g2u_display ("Driving ARESETn to 0")
    RREADY = 1'b0;
    `g2u_display ("Driving RREADY to 1'b0")
    wait_for_n_clks (10); 
    ARESETn = 1'b1;
    `g2u_display ("Driving ARESETn to 1")
    wait_for_n_clks (10); 
    ARESETn = 1'b1;
    `g2u_display ("Driving ARESETn to 1")
    wait_for_n_clks (10);
    RREADY = 1'bx;
    `g2u_display ("Driving RREADY to 1'bx")
    wait_for_n_clks (10);

    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_RREADY_X")
    `g2u_display ("End fail_AXI_ERRM_RREADY_X")

  `SVTEST_END

