//************************************************************
  // Test:
  //   pass_axi_errm_awcache_stable
  //
  // Desc:
  //   Unit test for CIP_ID: axi_errm_awcache_stable
  //   AWVALID ,  AWREADY AWCACHE
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_axi_errm_awcache_stable)

    `g2u_display ("pass_axi_errm_awcache_stable")
    `g2u_display ("Driving ARESETn ")
     ARESETn = 1'b1;
    `g2u_display ("Driving Avalid ")
     AWVALID=1'b1;
    `g2u_display ("Driving AWREADY ")
     AWREADY=1'b0;
    `g2u_display ("Driving AWCACHE ")
     AWCACHE=4'b0001;
     wait_for_n_clks (1); 
    `g2u_display ("Driving AWCACHE ")
     AWCACHE = 4'b0001;
     wait_for_n_clks (10); 
    `g2u_display ("End pass_axi_errm_awcache_stable")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_axi_errm_awcache_stable
  //
  // Desc:
  //   Unit test for CIP_ID:axi_errm_awcache_stable
  //   AWVALID ,  AWREADY AWCACHE 
  //   Expected result: FAIL
  //************************************************************
`SVTEST(fail_axi_errm_awcache_stable)

  
     `g2u_display ("fail_axi_errm_awcache_stable")
     `g2u_display ("Driving ARESETn ")
      ARESETn = 1'b1;
     `g2u_display ("Driving Avalid ")
      AWVALID=1'b1;
     `g2u_display ("Driving AWREADY ")
      AWREADY=1'b0;
     `g2u_display ("Driving AWCACHE ")
      AWCACHE=4'b0001;
      wait_for_n_clks (1); 
     `g2u_display ("Driving AWCACHE ")
      AWCACHE = 4'b0011;
      wait_for_n_clks (10); 
     `FAIL_IF_LOG(1, "Expected FAIL axi_errm_awcache_stable")
     `g2u_display ("End fail_axi_errm_awcache_stable")

  `SVTEST_END
