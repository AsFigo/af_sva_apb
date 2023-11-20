  //************************************************************
  // Test:
  //   pass_slave_not_sel_okay_A
  //
  // Desc:
  //   Unit test for CIP_ID: slave_not_sel_okay_A
  //   hsel = 1'bx, next clock hresp = 1'b0
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_slave_not_sel_okay_A)

    `g2u_display ("pass_slave_not_sel_okay_A")
    wait_for_n_clks (1); 
    `g2u_display ("Driving HSEL to x")
    hsel = 1'bx;
    wait_for_n_clks (1); 
    `g2u_display ("Driving HRESP to 1'b0")
    hresp = 1'b0;
    wait_for_n_clks (4); 
    
    `g2u_display ("End pass_slave_not_sel_okay_A")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_slave_not_sel_okay_A
  //
  // Desc:
  //   Unit test for CIP_ID: slave_not_sel_okay_A
  //   HSEL = 1, next clock hresp = 1'b1
  //   Expected result: FAIL
  //************************************************************
  `SVTEST(fail_slave_not_sel_okay_A)

    `g2u_display ("fail_slave_not_sel_okay_A")
    wait_for_n_clks (1); 
    `g2u_display ("Driving HSEL to x")
    hsel = 1'bx;
    wait_for_n_clks (1); 
    `g2u_display ("Driving HRESP to 1'b0")
    hresp =1'b1;
    wait_for_n_clks (4); 
   
    `FAIL_IF_LOG(1, "Expected FAIL slave_not_sel_okay_A")
    `g2u_display ("End fail_slave_not_sel_okay_A")

  `SVTEST_END

