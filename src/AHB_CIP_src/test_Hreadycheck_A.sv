  //************************************************************
  // Test:
  //   pass_Hreadycheck_A
  //
  // Desc:
  //   Unit test for CIP_ID: Hreadycheck_A
  //   hresetn = 0, hready = 0
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_Hreadycheck_A)

    `g2u_display ("pass_Hreadycheck_A")
    `g2u_display ("Driving hresetn to 0")
    hresetn = 1'b0;
    wait_for_n_clks (1); 
    `g2u_display ("Driving hready to 0")
    hready = 1'b0;
    wait_for_n_clks (10); 
    `g2u_display ("End pass_Hreadycheck_A")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_Hreadycheck_A
  //
  // Desc:
  //   Unit test for CIP_ID: Hreadycheck_A
  //   hresetn = 0, hready = 1
  //   Expected result: FAIL
  //************************************************************
  `SVTEST(fail_Hreadycheck_A)

    `g2u_display ("fail_Hreadycheck_A")
    `g2u_display ("Driving hresetn to 0")
    hresetn = 1'b0;
    wait_for_n_clks (1); 
    `g2u_display ("Driving hready to 1")
    hready = 1'b1;
    wait_for_n_clks (10); 
    `FAIL_IF_LOG(1, "Expected FAIL Hreadycheck_A")
    `g2u_display ("End fail_Hreadycheck_A")

  `SVTEST_END


