  //************************************************************
  // Test:
  //   pass_busy_transfer_addr_not_change_check_A
  //
  // Desc:
  //   Unit test for CIP_ID: busy_transfer_addr_not_change_check_A
  //   htrans = 2'b01, haddr = 16'b0000000000000001
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_busy_transfer_addr_not_change_check_A)

    `g2u_display ("pass_busy_transfer_addr_not_change_check_A")
    `g2u_display ("Driving htrans to 2'b01")
    htrans = 2'b01;
    //wait_for_n_clks (1); 
    `g2u_display ("Driving haddr = 16'b0000000000000001")
    haddr = 16'b0000000000000001;

    wait_for_n_clks (1); 
    `g2u_display ("Driving haddr = 16'b0000000000000001")
    haddr = 16'b0000000000000001;

    wait_for_n_clks (10); 
    `g2u_display ("End pass_busy_transfer_addr_not_change_check_A")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_busy_transfer_addr_not_change_check_A
  //
  // Desc:
  //   Unit test for CIP_ID: busy_transfer_addr_not_change_check_A
  //   htrans = 2'b01, haddr = 16'b0000000000000011
  //   Expected result: FAIL
  //************************************************************
  `SVTEST(fail_busy_transfer_addr_not_change_check_A)

    `g2u_display ("fail_busy_transfer_addr_not_change_check_A")
    `g2u_display ("Driving htrans to 2'b01")
    htrans = 2'b01;
    //wait_for_n_clks (1); 
    `g2u_display ("Driving haddr = 16'b0000000000000001")
    haddr = 16'b0000000000000001;


    wait_for_n_clks (1); 
    `g2u_display ("Driving haddr = 16'b0000000000000011")
    haddr = 16'b0000000000000011;

    wait_for_n_clks (10); 
    `FAIL_IF_LOG(1, "Expected FAIL busy_transfer_addr_not_change_check_A")
    `g2u_display ("End fail_busy_transfer_addr_not_change_check_A")

  `SVTEST_END

