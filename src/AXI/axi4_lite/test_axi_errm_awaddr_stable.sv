//************************************************************
  // Test:
  //   pass_axi_errm_awaddr_stable
  //
  // Desc:
  //   Unit test for CIP_ID: axi_errm_awaddr_stable
  //   AWVALID = 1,  AWREADY AWADDR
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_axi_errm_awaddr_stable)

    `g2u_display ("pass_axi_errm_awaddr_stable")
    `g2u_display ("Driving ARESETn ")
     ARESETn = 1'b1;
    `g2u_display ("Driving Avalid ")
     AWVALID=1'b1;
    `g2u_display ("Driving AWREADY ")
     AWREADY=1'b0;
    `g2u_display ("Driving AWADDR ")
     AWADDR=1'b1;
     wait_for_n_clks (1); 
    `g2u_display ("Driving AWADDR ")
     AWADDR = 1'b1;
     wait_for_n_clks (10); 
    `g2u_display ("End pass_axi_errm_awaddr_stable")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_axi_errm_awaddr_stable
  //
  // Desc:
  //   Unit test for CIP_ID:axi_errm_awaddr_stable
  //   AWVALID = 1,  AWREADY AWADDR 
  //   Expected result: FAIL
  //************************************************************
`SVTEST(fail_axi_errm_awaddr_stable)

  
    `g2u_display ("fail_axi_errm_awaddr_stable")
    `g2u_display ("Driving ARESETn ")
     ARESETn = 1'b1;
    `g2u_display ("Driving Avalid ")
     AWVALID=1'b1;
    `g2u_display ("Driving AWREADY ")
     AWREADY=1'b0;
    `g2u_display ("Driving AWADDR ")
     AWADDR=1'b1;
     wait_for_n_clks (1); 
    `g2u_display ("Driving AWADDR ")
     AWADDR = 1'b0;
     wait_for_n_clks (10); 
    `FAIL_IF_LOG(1, "Expected FAIL axi_errm_awaddr_stable")
    `g2u_display ("End fail_axi_errm_awaddr_stable")

  `SVTEST_END
