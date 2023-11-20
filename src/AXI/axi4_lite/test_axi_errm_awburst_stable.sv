//************************************************************
  // Test:
  //   pass_axi_errm_awbust_stable
  //
  // Desc:
  //   Unit test for CIP_ID: axi_errm_awbust_stable
  //   AWVALID ,  AWREADY AWBURST
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_axi_errm_awbust_stable)

    `g2u_display ("pass_axi_errm_awbust_stable")
    `g2u_display ("Driving ARESETn ")
    ARESETn = 1'b1;
    `g2u_display ("Driving Avalid ")
    AWVALID = 1'b1;
    `g2u_display ("Driving AWREADY ")
    AWREADY = 1'b0;
    `g2u_display ("Driving AWBURST ")
    AWBURST=2'b01;
    wait_for_n_clks (1); 
    `g2u_display ("Driving AWBURST ")
    AWBURST = 2'b01;
    wait_for_n_clks (10); 
    `g2u_display ("End pass_axi_errm_awbust_stable")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_axi_errm_awbust_stable
  //
  // Desc:
  //   Unit test for CIP_ID:axi_errm_awbust_stable
  //   AWVALID ,  AWREADY AWBURST 
  //   Expected result: FAIL
  //************************************************************
  `SVTEST(fail_axi_errm_awbust_stable)

  
    `g2u_display ("fail_axi_errm_awbust_stable")
    `g2u_display ("Driving ARESETn ")
     ARESETn = 1'b1;
    `g2u_display ("Driving Avalid ")
     AWVALID=1'b1;
    `g2u_display ("Driving AWREADY ")
     AWREADY=1'b0;
    `g2u_display ("Driving AWBURST ")
     AWBURST=2'b01;
     wait_for_n_clks (1); 
    `g2u_display ("Driving AWBURST ")
     AWBURST = 2'b10;
     wait_for_n_clks (10); 
    `FAIL_IF_LOG(1, "Expected FAIL axi_errm_awbust_stable")
    `g2u_display ("End fail_axi_errm_awbust_stable")

  `SVTEST_END

