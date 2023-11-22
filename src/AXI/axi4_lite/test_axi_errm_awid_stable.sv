//************************************************************
  // Test:
  //   pass_axi_errm_awid_stable
  //
  // Desc:
  //   Unit test for CIP_ID: axi_errm_awid_stable
  //   ARESETn = 1, AWVALID = 1, AWREADY = 0 and same clock  AWID is stable
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_axi_errm_awid_stable)

    `g2u_display ("pass_axi_errm_awid_stable")
    `g2u_display ("Driving ARESETn to 1 ")
    ARESETn = 1'b1;
    `g2u_display ("Driving AWVALID to 1 ")
    AWVALID = 1'b1;
    `g2u_display ("Driving AWREADY to 0 ")
    AWREADY = 1'b0;
    `g2u_display ("Driving AWID to 4'b0001 ")
    AWID=4'b0001;
    wait_for_n_clks (1); 
    `g2u_display ("Driving AWID to 4'b0001 ")
    AWID = 4'b0001;
    wait_for_n_clks (10); 
    `g2u_display ("End pass_axi_errm_awid_stable")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_axi_errm_awid_stable
  //
  // Desc:
  //   Unit test for CIP_ID:axi_errm_awid_stable
  //   ARESETn = 1, AWVALID = 1, AWREADY = 0 and same clock  AWID is not stable
  //   Expected result: FAIL
  //************************************************************
`SVTEST(fail_axi_errm_awid_stable)

  
    `g2u_display ("fail_axi_errm_awid_stable")
    `g2u_display ("Driving ARESETn to 1 ")
     ARESETn = 1'b1;
    `g2u_display ("Driving AWVALID to 1 ")
     AWVALID=1'b1;
    `g2u_display ("Driving AWREADY to 0 ")
     AWREADY=1'b0;
    `g2u_display ("Driving AWID to 4'b0001 ")
     AWID=4'b0001;
     wait_for_n_clks (1); 
    `g2u_display ("Driving AWID to 4'b0010 ")
     AWID = 4'b0010;
     wait_for_n_clks (10); 
    `FAIL_IF_LOG(1, "Expected FAIL axi_errm_awid_stable")
    `g2u_display ("End fail_axi_errm_awid_stable")

  `SVTEST_END


