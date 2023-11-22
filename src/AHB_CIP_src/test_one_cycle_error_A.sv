//************************************************************
	  // Test:
	  //   pass_one_cycle_error_A
	  //
	  // Desc:
	  //   Unit test for CIP_ID: one_cycle_error_A
	  //   Driving hresp and hready 
	  //   Expected result: PASS
	  //************************************************************
	  `SVTEST(pass_one_cycle_error_A)
	
	    `g2u_display ("pass_one_cycle_error_A")
	    `g2u_display ("Driving hresp and hready")
	    hresp=1'b1;
	    `g2u_display("Driving hresp to 1")
	    hready=1'b0;
	    wait_for_n_clks (10);
	    `g2u_display("Driving hready to 0")
	    `g2u_display ("End pass_one_cycle_error_A")
	  `SVTEST_END
	
	  //************************************************************
	  // Test:
	  //   fail_one_cycle_error_A
	  //
	  // Desc:
	  //   Unit test for CIP_ID: one_cycle_error_A
	  //  Driving hresp and hready
	  //   Expected result: FAIL
	  //************************************************************
	  `SVTEST(fail_one_cycle_error_A)
	    `g2u_display ("fail_one_cycle_error_A")
	    `g2u_display ("Driving hresp and hready")
	     hresp=1'b1;
	    `g2u_display("Driving hresp to 1")
	     hready=1'b1;
	     wait_for_n_clks (10);
	    `g2u_display("Driving hready to 1")
	    `FAIL_IF_LOG(1, "Expected FAIL one_cycle_error_A")
	    `g2u_display ("End fail_one_cycle_error_A")
	
	  `SVTEST_END
	
	
