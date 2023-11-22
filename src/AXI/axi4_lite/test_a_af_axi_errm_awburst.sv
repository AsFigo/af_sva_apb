  //************************************************************
  // Test:
  //   pass_a_af_axi_errm_awburst
  //
  // Desc:
  //   Unit test for CIP_ID: a_af_axi_errm_awburst
  //   AWVALID = 1, next clock AWBURST = 2'b01
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_a_af_axi_errm_awburst)

    `g2u_display ("pass_a_af_axi_errm_awburst")
    `g2u_display ("Driving Avalid to 1")
    AWVALID = 1'b1;
    wait_for_n_clks (1); 
    `g2u_display ("Driving AWBURST to 2'b01 for incr burst type")
    AWVALID = 1'b1;
    AWBURST = 2'b01;
    wait_for_n_clks (10); 
    `g2u_display ("End pass_a_af_axi_errm_awburst")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_a_p_af_axi_errm_awburst
  //
  // Desc:
  //   Unit test for CIP_ID: a_p_af_axi_errm_awburst
  //   AWVALID = 1, next clock AWBURST = 2'b11
  //   Expected result: FAIL
  //************************************************************
`SVTEST(fail_a_af_axi_errm_awburst)

  /*
    `g2u_display ("fail_a_p_af_axi_errm_awburst")
    `g2u_display ("Driving Avalid to 1")
    AWVALID = 1'b1;
    wait_for_n_clks (1);
    `g2u_display ("Driving AWBURST to 2'b11")
    AWVALID = 1'b1;
    AWBURST = 2'b11;
    wait_for_n_clks (10);
    `FAIL_IF_LOG(1, "Expected FAIL a_p_af_axi_errm_awburst")
    `g2u_display ("End fail_a_p_af_axi_errm_awburst")
*/
  `SVTEST_END

