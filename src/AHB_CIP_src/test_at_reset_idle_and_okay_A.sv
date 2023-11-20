  //************************************************************
  // Test:
  //   pass_at_reset_idle_and_okay_A
  //
  // Desc:
  //   Unit test for CIP_ID: at_reset_idle_and_okay_A
  //   HRESETn = 1'b0, next clock HRESP = 1'b0 and HTRANS = 2'b00
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_at_reset_idle_and_okay_A)

    `g2u_display ("pass_at_reset_idle_and_okay_A")
     wait_for_n_clks (1);
    `g2u_display ("Driving HRESETn to 1'b0")
    hresetn = 1'b0;
    wait_for_n_clks (1); 
    `g2u_display ("Driving HRESP to 1'b0 and HTRANS 2'b00")
    hresp = 1'b0;
    htrans = 2'b00;
    wait_for_n_clks (4); 
  
 
    `g2u_display ("End pass_at_reset_idle_and_okay_A")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_at_reset_idle_and_okay_A
  //
  // Desc:
  //   Unit test for CIP_ID: at_reset_idle_and_okay_A
  //   HRESETn = 1'b0, next clock HRESP != 1'b0 and HTRANS != 2'b00
  //   Expected result: FAIL
  //************************************************************
  `SVTEST(fail_at_reset_idle_and_okay_A)

    `g2u_display ("fail_at_reset_idle_and_okay_A")
    wait_for_n_clks (1); 
    `g2u_display ("Driving HRESETn to 1'b0")
    hresetn = 1'b0;
    wait_for_n_clks (2); 
    `g2u_display ("Driving HRESP to 1'b0")
    hresp = 1'b1;
    htrans = 2'b01;
    wait_for_n_clks (4); 
    
    `FAIL_IF_LOG(1, "Expected FAIL at_reset_idle_and_okay_A")
    `g2u_display ("End fail_at_reset_idle_and_okay_A")

  `SVTEST_END

