  //************************************************************
  // Test:
  //   pass_two_cycle_error_A
  //
  // Desc:
  //   Unit test for CIP_ID: two_cycle_error_A
  //   Driving hresp 1 and after 2 clocks hready 1
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_two_cycle_error_A)
    `g2u_display ("Pass_two_cycle_error_A")
    `g2u_display ("Driving hresp to 1")
    hresp = 1'b1;
    wait_for_n_clks (2); 
    `g2u_display ("Driving hready to 1")
    hready = 1'b1;
    wait_for_n_clks (10); 
    `g2u_display ("End pass_two_cycle_error_A")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_two_cycle_error_A
  //
  // Desc:
  //   Unit test for CIP_ID: two_cycle_error_A
  //    Driving hresp 1 and after 2 clocks hready 0
  //   Expected result: FAIL
  //************************************************************
  `SVTEST(fail_two_cycle_error_A)
    `g2u_display ("Fail_two_cycle_error_A")
    `g2u_display ("Driving hresp to 1")
    hresp = 1'b1;
    wait_for_n_clks (2); 
    `g2u_display ("Driving hready to 0")
    hready = 1'b0;
    wait_for_n_clks (10); 
    `FAIL_IF_LOG(1, "Expected FAIL two_cycle_error_A")
    `g2u_display ("End Fail_two_cycle_error_A")

  `SVTEST_END

