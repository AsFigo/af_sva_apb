//************************************************************
  // Test:
  //   pass_AXI_ERRS_RVALID_RESET
  //
  // Desc: RVALID is LOW for the first cycle after ARESETn goes HIGH  
  //   Unit test for CIP_ID: AXI_ERRS_RVALID_RESET
  //   ARESETn= 1, RVALID =1'b1
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_AXI_ERRS_RVALID_RESET)

    `g2u_display ("pass_AXI_ERRS_RVALID_RESET")
     ARESETn = 1'b1;
    `g2u_display ("Driving ARESETn to 1") 

     wait_for_n_clks (1);
     RVALID = 1'b0;
    `g2u_display ("Driving RVALID to 0")
     wait_for_n_clks (10); 
    `g2u_display ("End pass_AXI_ERRS_RVALID_RESET")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_AXI_ERRS_RVALID_RESET
  //
  // Desc:RVALID is LOW for the first cycle after ARESETn goes HIGH 
  //   Unit test for CIP_ID: AXI_ERRS_RVALID_RESET
  //   ARESETn = 1, RVALID = 1'b1 
  //   Expected result: FAIL
  //************************************************************
   `SVTEST(fail_AXI_ERRS_RVALID_RESET)

    `g2u_display ("fail_AXI_ERRS_RVALID_RESET")
     ARESETn = 1'b1;
    `g2u_display ("Driving ARESETn to 1")

     wait_for_n_clks (1);
     RVALID = 1'b1;
    `g2u_display ("Driving RVALID to 1")
     wait_for_n_clks (10);
    `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRS_RVALID_RESET")
    `g2u_display ("End fail_AXI_ERRS_RVALID_RESET")

  `SVTEST_END

