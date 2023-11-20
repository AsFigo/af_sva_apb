  //************************************************************
  // Test:
  //   pass_idle_transfer_check_A
  //
  // Desc:
  //   Unit test for CIP_ID: idle_transfer_check_A
  //   HTRANS = 2'b01 next clock HTRANS = 2'b01 OR HTRANS = 2'b10
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_idle_transfer_check_A)

    `g2u_display ("pass_idle_transfer_check_A")
    wait_for_n_clks (1); 
    `g2u_display ("Driving HTRAN to 2'b01 ")
    htrans = 2'b01;
    wait_for_n_clks (1); 
    `g2u_display ("Driving HTRAN to 2'b10 ")
    htrans = 2'b10;
    wait_for_n_clks (4); 
    
    `g2u_display ("End pass_idle_transfer_check_A")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_idle_transfer_check_A
  //
  // Desc:
  //   Unit test for CIP_ID: idle_transfer_check_A
  //   HTRANS = 2'b01 next clock HTRANS != 2'b01 OR HTRANS != 2'b10
  //   Expected result: FAIL
  //************************************************************
  `SVTEST(fail_idle_transfer_check_A)

    `g2u_display ("fail_idle_transfer_check_A")
    wait_for_n_clks (1); 
    `g2u_display ("Driving HTRAN to 2'b01 ")
    htrans = 2'b01;
    wait_for_n_clks (1); 
    `g2u_display ("Driving HTRAN to 2'b00 ")
    htrans = 2'b00;
    wait_for_n_clks (4); 
    
    `FAIL_IF_LOG(1, "Expected FAIL idle_transfer_check_A")
    `g2u_display ("End fail_idle_transfer_check_A")

  `SVTEST_END

