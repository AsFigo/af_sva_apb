  //************************************************************
  // Test:
  //   pass_a_af_axi_errm_awcache_x
  //
  // Desc:
  //   Unit test for CIP_ID: a_af_axi_errm_awcache_x
  //   AWVALID = 1,  ARESETn=1
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_a_af_axi_errm_awcache_x)

   `g2u_display ("pass_a_af_axi_errm_awcache_x")
   `g2u_display ("Driving ARESETn to 1")
    ARESETn=1'b1;
   `g2u_display ("Driving AWVALID to 1")
    AWVALID = 1'b1;
   `g2u_display ("Driving AWCACHE to 1")
    AWCACHE=4'b0001;
    wait_for_n_clks (1); 
   `g2u_display ("Driving AWCACHE to 1")
    AWCACHE = 4'b0001;
    wait_for_n_clks (10); 
   `g2u_display ("End pass_a_af_axi_errm_awcache_x")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_a_af_axi_errm_awcache_x
  //
  // Desc:
  //   Unit test for CIP_ID: a_af_axi_errm_awcache_x
  //   ARESETn=1. AWVALID=1
  //   Expected result: FAIL
  //************************************************************
  `SVTEST(fail_a_af_axi_errm_awcache_x)


   `g2u_display ("fail_a_af_axi_errm_awcache_x")
   `g2u_display ("Driving ARESETn to 1")
    ARESETn=1'b1;
   `g2u_display ("Driving AWALID to 1")
    AWVALID = 1'b1;
   `g2u_display ("Driving AWCACHE to x")
    AWCACHE=4'bxxxx;
    wait_for_n_clks (1); 
   `g2u_display ("Driving AWCACHE to x")
    AWCACHE = 4'bxxxx;
    wait_for_n_clks (10); 
   `FAIL_IF_LOG(1, "Expected FAIL a_af_axi_errm_awcache_x")
   `g2u_display ("End fail_a_af_axi_errm_awcache_x")

  `SVTEST_END

