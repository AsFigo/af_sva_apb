//************************************************************
  // Test:
  //   pass_AXI_ERRM_ARSIZE_STABLE
  //
  // Desc:ARSIZE remains stable when ARVALID is asserted and ARREADY is LOW
  //   Unit test for CIP_ID: AXI_ERRM_ARSIZE_STABLE
  //   ARVALID= 1, ARREADY = 0, ARSIZE =3'b0, ARSIZE  = $STABLE
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRM_ARSIZE_STABLE)

    `g2u_display ("pass_AXI_ERRM_ARSIZE_STABLE")
    ARVALID = 1'b1;
    `g2u_display ("Driving ARVALID to 1")
    ARREADY = 1'b0;
    `g2u_display ("Driving ARREADY to 0")
    ARSIZE = 3'b000;
`g2u_display ("Driving ARSIZE to 3'b000")
    wait_for_n_clks (1); 
    ARSIZE = 3'b000;
`g2u_display ("Driving ARSIZE to 3'b000")
    wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRM_ARSIZE_STABLE")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRM_ARSIZE_STABLE
  //
  // Desc: ARSIZE remains stable when ARVALID is asserted and ARREADY is LOW
  //   Unit test for CIP_ID: AXI_ERRM_ARSIZE_STABLE
  //   ARVALID = 1, ARREADY = 0, ARSIZE = 3'b000 , ARSIZE  = 3'b100
  //   Expected result: FAIL
  //************************************************************
   `SVTEST(fail_AXI_ERRM_ARSIZE_STABLE)

    `g2u_display ("fail_AXI_ERRM_ARSIZE_STABLE")
    ARVALID = 1'b1;
    `g2u_display ("Driving ARVALID to 1")
    ARREADY = 1'b0;
    `g2u_display ("Driving ARREADY to 0")
    ARSIZE = 3'b000;
`g2u_display ("Driving ARSIZE to 3'b000")
    wait_for_n_clks (1); 
    ARSIZE = 3'b100;
    `g2u_display ("Driving ARSIZE to 3'b100")
    wait_for_n_clks (10);
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_ARSIZE_STABLE")
    `g2u_display ("End fail_AXI_ERRM_ARSIZE_STABLE")

  `SVTEST_END

