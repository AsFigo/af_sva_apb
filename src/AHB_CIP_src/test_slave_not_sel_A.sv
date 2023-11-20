  //************************************************************
  // Test:
  //   pass_slave_not_sel_A
  //
  // Desc:
  //   Unit test for CIP_ID: slave_not_sel_A
  //   hsel = 1'b1, hready =1'b0, hsel = 1'b0
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_slave_not_sel_A)

    `g2u_display ("pass_slave_not_sel_A")
    `g2u_display ("Driving hsel to 0 ")
    hsel = 1'b0;
    `g2u_display ("Driving hready to 0")
    hready = 1'b0;
    `g2u_display ("Driving hsel to 1")
    hsel = 1'b1;

    `g2u_display ("Driving hready to 0")
    hready = 2'b01;
    wait_for_n_clks (10); 
    `g2u_display ("End pass_slave_not_sel_A")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_slave_not_sel_A
  //
  // Desc:
  //   Unit test for CIP_ID: slave_not_sel_A
  //   hsel = 1'b1, hready =1'b0, hsel = 1'b0
  //   Expected result: FAIL
  //************************************************************
  `SVTEST(fail_slave_not_sel_A)

    `g2u_display ("fail_slave_not_sel_A")
    `g2u_display ("Driving hsel to 0")
    hsel = 1'b0;
    `g2u_display ("Driving hready to 1")
    hready = 1'b1;
    `g2u_display ("Driving hsel to 1")
    hsel = 1'b1;

    `g2u_display ("Driving hready to 01")
    hready = 1'b1;
    wait_for_n_clks (10); 
    `FAIL_IF_LOG(1, "Expected FAIL slave_not_sel_A")
    `g2u_display ("End fail_slave_not_sel_A")

  `SVTEST_END

