  //************************************************************
  // Test:
  //   pass_slave_responce_at_zero_cycle_A
  //
  // Desc:
  //   Unit test for CIP_ID: slave_responce_at_zero_cycle_A
  //   htrans = 2'b00, htrans = 2'b01, hready =1'b0, hresp==1’b0
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_slave_responce_at_zero_cycle_A)

    `g2u_display ("pass_slave_responce_at_zero_cycle_A")
    `g2u_display ("Driving htrans to 00 ")
    htrans = 2'b00;
    //wait_for_n_clks (1); 
    `g2u_display ("Driving hready to 1")
    hready = 1'b1;
    `g2u_display ("Driving hresp to 0")
    hresp = 1'b0;

    `g2u_display ("Driving htrans to 01")
    htrans = 2'b01;
    //wait_for_n_clks (1); 
    `g2u_display ("Driving hready to 1")
    hready = 1'b1;
    `g2u_display ("Driving hresp to 0")
    hresp = 1'b0;

    wait_for_n_clks (10); 
    `g2u_display ("End pass_slave_responce_at_zero_cycle_A")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_slave_responce_at_zero_cycle_A
  //
  // Desc:
  //   Unit test for CIP_ID: slave_responce_at_zero_cycle_A
  //   htrans = 2'b00, htrans = 2'b01, hready =1'b1, hresp==1’b1
  //   Expected result: FAIL
  //************************************************************
  `SVTEST(fail_slave_responce_at_zero_cycle_A)

    `g2u_display ("fail_slave_responce_at_zero_cycle_A")
    `g2u_display ("Driving htrans to 00")
    htrans = 2'b00;
    //wait_for_n_clks (1); 
    `g2u_display ("Driving hready to 1")
    hready = 1'b1;
    `g2u_display ("Driving hresp to 1")
    hresp = 1'b1;

    `g2u_display ("Driving htrans to 01")
    htrans = 2'b01;
    //wait_for_n_clks (1); 
    `g2u_display ("Driving hready to 1")
    hready = 1'b1;
    `g2u_display ("Driving hresp to 1")
    hresp = 1'b1;

    wait_for_n_clks (10); 
    `FAIL_IF_LOG(1, "Expected FAIL slave_responce_at_zero_cycle_A")
    `g2u_display ("End fail_slave_responce_at_zero_cycle_A")

  `SVTEST_END

