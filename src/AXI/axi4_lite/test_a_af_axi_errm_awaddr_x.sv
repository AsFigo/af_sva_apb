  //************************************************************
  // Test:
  //   pass_a_af_axi_errm_awaddr_x
  //
  // Desc:
  //   Unit test for CIP_ID: a_af_axi_errm_awaddr_x
  //   AWVALID = 1,  ARESETn=1
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_a_af_axi_errm_awaddr_x)

   `g2u_display ("pass_a_af_axi_errm_awaddr_x")
   `g2u_display ("Driving ARESETn to 1")
    ARESETn=1'b1;
   `g2u_display ("Driving AWVALID to 1")
    AWVALID = 1'b1;
   `g2u_display ("Driving AWADDR to 1")
    AWADDR=1'b1;
    wait_for_n_clks (1); 
   `g2u_display ("Driving AWADDR to 1")
    AWADDR = 1'b1;
    wait_for_n_clks (10); 
   `g2u_display ("End pass_a_af_axi_errm_awaddr_x")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_a_af_axi_errm_awaddr_x
  //
  // Desc:
  //   Unit test for CIP_ID: a_af_axi_errm_awaddr_x
  //   ARESETn=1. AWVALID=1
  //   Expected result: FAIL
  //************************************************************
`SVTEST(fail_a_af_axi_errm_awaddr_x)


   `g2u_display ("fail_a_af_axi_errm_awaddr_x")
   `g2u_display ("Driving ARESETn to 1")
    ARESETn=1'b1;
   `g2u_display ("Driving AWALID to 1")
    AWVALID = 1'b1;
   `g2u_display ("Driving AWADDR to x")
    AWADDR=1'bx;
    wait_for_n_clks (1); 
   `g2u_display ("Driving AWADDR to x")
    AWADDR = 1'bx;
    wait_for_n_clks (10); 
   `FAIL_IF_LOG(1, "Expected FAIL a_af_axi_errm_awaddr_x")
   `g2u_display ("End fail_a_af_axi_errm_awaddr_x")

  `SVTEST_END

