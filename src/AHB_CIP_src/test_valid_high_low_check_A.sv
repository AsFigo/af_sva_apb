  //************************************************************
  // Test:
  //   pass_valid_high_low_check_A
  //
  // Desc:
  //   Unit test for CIP_ID: valid_high_low_check_A
  //   Driving haddr
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_valid_high_low_check_A)
    `g2u_display ("pass_valid_high_low_check_A")
    `g2u_display ("Driving haddr")
     haddr = 1'b1; 
    `g2u_display ("Driving haddr")
     haddr = 1'b1;
     wait_for_n_clks (10); 
    `g2u_display ("End pass_valid_high_low_check_A")
  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_valid_high_low_check_A
  //
  // Desc:
  //   Unit test for CIP_ID: valid_high_low_check_A
  //   Driving haddr
  //   Expected result: FAIL
  //************************************************************
  `SVTEST(fail_valid_high_low_check_A)
    `g2u_display ("fail_valid_high_low_check_A")
    `g2u_display ("Driving haddr ")
     haddr = 1'bx; 
    `g2u_display ("Driving haddr ")
     haddr = 1'bx;
     wait_for_n_clks (10); 
    `FAIL_IF_LOG(1, "Expected FAIL valid_high_low_check_A")
    `g2u_display ("End fail_valid_high_low_check_A")
  `SVTEST_END

