  //************************************************************
  // Test:
  //   pass_a_af_axi_errm_awlen_stable
  //
  // Desc:
  //   Unit test for CIP_ID: a_af_axi_errm_awlen_stable
  //   ARESETn = 1, AWVALID = 1, AWREADY = 0, same clock AWLEN stable
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_a_af_axi_errm_awlen_stable)

    `g2u_display ("pass_a_af_axi_errm_awlen_stable")
    `g2u_display ("Driving ARESETn to 1")
    ARESETn = 1'b1;
    `g2u_display ("Driving AWVALID to 1")
    AWVALID = 1'b1;
    `g2u_display ("Driving AWREADY to 0")
    AWREADY = 1'b0;
    `g2u_display ("Driving AWLEN to 1")
    AWLEN = 1'b1;
    wait_for_n_clks (1); 
    `g2u_display ("Driving AWLEN to 1")
    AWLEN = 1'b1;
    wait_for_n_clks (10); 
    `g2u_display ("End pass_a_af_axi_errm_awlen_stable")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_a_p_af_axi_errm_awlen_stable
  //
  // Desc:
  //   Unit test for CIP_ID: a_p_af_axi_errm_awlen_stable
  //   ARESETn = 1, AWVALID = 1, AWREADY = 0, same clock AWLEN not stable
  //   Expected result: FAIL
  //************************************************************
  `SVTEST(fail_a_p_af_axi_errm_awlen_stable)

    `g2u_display ("fail_a_p_af_axi_errm_awlen_stable")
    `g2u_display ("Driving ARESETn to 1")
    ARESETn = 1'b1;
    `g2u_display ("Driving AWVALID to 1")
    AWVALID = 1'b1;
    `g2u_display ("Driving AWREADY to 0")
    AWREADY = 1'b0;
    `g2u_display ("Driving AWLEN to 1")
    AWLEN = 1'b1;
    wait_for_n_clks (1); 
    `g2u_display ("Driving AWLEN to 0")
    AWLEN = 1'b0;
    wait_for_n_clks (10); 
    `FAIL_IF_LOG(1, "Expected FAIL a_p_af_axi_errm_awlen_stable")
    `g2u_display ("End fail_a_p_af_axi_errm_awlen_stable")
  `SVTEST_END

