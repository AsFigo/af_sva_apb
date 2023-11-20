  //************************************************************
  // Test:
  //   pass_Hreadycheck_B
  //
  // Desc:
  //   Unit test for CIP_ID: Hreadycheck_B
  //   HRESETn = 1'b0, next clock HREADY = 1'b1
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_Hreadycheck_B)

    `g2u_display ("pass_Hreadycheck_B")
    wait_for_n_clks (1);
    `g2u_display ("Driving HRESETn to 1'b0 ")
    HRESETn = 1'b0;
    wait_for_n_clks (1); 
    `g2u_display ("Driving HREADY to 1'b1")
    HREADY = 1'b1;
    wait_for_n_clks (4);
    
    `g2u_display ("End pass_Hreadycheck_B")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_Hreadycheck_B
  //
  // Desc:
  //   Unit test for CIP_ID: Hreadycheck_B
  //   HRESETn = 1'b0, next clock HREADY != 1'b1
  //   Expected result: FAIL
  //************************************************************
  `SVTEST(fail_Hreadycheck_B)

    `g2u_display ("fail_Hreadycheck_B")
    wait_for_n_clks (1); 
    `g2u_display ("Driving HRESETn to 1'b0 ")
    HRESETn = 1'b0;
    wait_for_n_clks (1); 
    `g2u_display ("Driving HREADY to 1'b0")
    HRESP =1'b0;
    wait_for_n_clks (4); 
   
    `FAIL_IF_LOG(1, "Expected FAIL Hreadycheck_B")
    `g2u_display ("End fail_Hreadycheck_B")

  `SVTEST_END

