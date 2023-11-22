	//************************************************************
	  // Test:
	  //   pass_addr_not_change_wait_check_A
	  //
	  // Desc:
	  //   Unit test for CIP_ID: addr_not_change_wait_check_A
	  //  Driving hready and haddr
	  //   Expected result: PASS
	  //************************************************************
	  `SVTEST(pass_addr_not_change_wait_check_A)
	   `g2u_display ("pass_addr_not_change_wait_check_A")
	   `g2u_display ("Driving hready to 0")
	    hready=1'b0;
	   `g2u_display("Driving haddr to 1")
	    haddr=1'b1;
	   `g2u_display("Driving haddr to 1")    
	    wait_for_n_clks (1);
	    haddr=1'b1;
	    wait_for_n_clks (1);
	   `g2u_display ("End pass_addr_not_change_wait_check_A")
	  `SVTEST_END
	
	  //************************************************************
	  // Test:
	  //   fail_addr_not_change_wait_check_A
	  //
	  // Desc:
	  //   Unit test for CIP_ID: addr_not_change_wait_check_A
	  //   Driving hready and haddr
	  //   Expected result: FAIL
	  //************************************************************
	  `SVTEST(fail_addr_not_change_wait_check_A)
	   `g2u_display ("fail_addr_not_change_wait_check_A")
	   `g2u_display ("Driving hready to 0")
	    hready=1'b0;
	   `g2u_display("Driving haddr to 1")
	    haddr=1'b1;
	   `g2u_display("Driving haddr to 0")    
	    wait_for_n_clks (1);
	    haddr=1'b0;
	    wait_for_n_clks (1);
	   `FAIL_IF_LOG(1, "Expected FAIL addr_not_change_wait_check_A ")
	   `g2u_display ("End fail_addr_not_change_wait_check_A")
	  `SVTEST_END
