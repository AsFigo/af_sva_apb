  //************************************************************
  // Test:
  //   pass_a_af_axi_errm_awlock_x
  //
  // Desc:
  //   Unit test for CIP_ID: a_af_axi_errm_awlock_x
  //   AWVALID = 1,  ARESETn=1
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_a_af_axi_errm_awlock_x)

   `g2u_display ("pass_a_af_axi_errm_awlock_x")
   `g2u_display ("Driving ARESETn to 1")
    ARESETn=1'b1;
   `g2u_display ("Driving AWVALID to 1")
    AWVALID = 1'b1;
   `g2u_display ("Driving AWLOCK to 1")
    AWLOCK=1'b1;
    wait_for_n_clks (1); 
   `g2u_display ("Driving AWLOCK to 1")
    AWLOCK = 1'b1;
    wait_for_n_clks (10); 
   `g2u_display ("End pass_a_af_axi_errm_awlock_x")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_a_af_axi_errm_awlock_x
  //
  // Desc:
  //   Unit test for CIP_ID: a_af_axi_errm_awlock_x
  //   ARESETn=1. AWVALID=1
  //   Expected result: FAIL
  //************************************************************
  `SVTEST(fail_a_af_axi_errm_awlock_x)


   `g2u_display ("fail_a_af_axi_errm_awlock_x")
   `g2u_display ("Driving ARESETn to 1")
    ARESETn=1'b1;
   `g2u_display ("Driving AWALID to 1")
    AWVALID = 1'b1;
   `g2u_display ("Driving AWLOCK to x")
    AWLOCK=1'bx;
    wait_for_n_clks (1); 
   `g2u_display ("Driving AWLOCK to x")
    AWLOCK = 1'bx;
    wait_for_n_clks (10); 
   `FAIL_IF_LOG(1, "Expected FAIL a_af_axi_errm_awlock_x")
   `g2u_display ("End fail_a_af_axi_errm_awlock_x")

  `SVTEST_END

