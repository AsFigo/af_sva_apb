//************************************************************
  // Test:
  //   pass_AXI_ERRM_ARSIZE_X
  //
  // Desc: A value of X on ARSIZE is not permitted when ARVALID is HIGH
  //   Unit test for CIP_ID: AXI_ERRM_ARSIZE_X
  //   ARVALID= 1, ARSIZE =3'b101, ARSIZE =3'b100 
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRM_ARSIZE_X)

    `g2u_display ("pass_AXI_ERRM_ARSIZE_X")
    ARVALID = 1'b1;
    `g2u_display ("Driving ARVALID to 1")
    ARSIZE = 3'b101;
    `g2u_display ("Driving ARSIZE to 3'b101")
	wait_for_n_clks (10);
	ARSIZE = 3'b100;
    `g2u_display ("Driving ARSIZE to 3'b100")
      wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRM_ARSIZE_X")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRM_ARSIZE_X
  //
  // Desc: A value of X on ARSIZE is not permitted when ARVALID is HIGH
  //   Unit test for CIP_ID: AXI_ERRM_ARSIZE_X
  //   ARVALID = 1, ARSIZE = 3'bxxx
  //   Expected result: FAIL
  //************************************************************
   `SVTEST(fail_AXI_ERRM_ARSIZE_X)

    `g2u_display ("fail_AXI_ERRM_ARSIZE_X")
    ARVALID = 1'b1;
    `g2u_display ("Driving ARVALID to 1")
    ARSIZE = 3'bX;
    `g2u_display ("Driving ARSIZE to 3'bX")
    wait_for_n_clks (1);
    ARSIZE = 3'bX;
    `g2u_display ("Driving ARSIZE to 3'bX")
    wait_for_n_clks (10);
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_ARSIZE_X")
    `g2u_display ("End fail_AXI_ERRM_ARSIZE_X")

  `SVTEST_END

