	//************************************************************
	  // Test:
	  //   pass_ idle_okay_responce_check_A
	  //
	  // Desc:
	  //   Unit test for CIP_ID:  idle_okay_responce_check_A
	  //  Driving htrans,hready and hresp
	  //   Expected result: PASS
	  //************************************************************
	  `SVTEST(pass_idle_okay_responce_check_A)
	   `g2u_display ("pass_ idle_okay_responce_check_A")
	   `g2u_display ("Driving htrans to 0")
	    htrans=2'b00;
	   `g2u_display("Driving hready to 0")
	    hready=1'b0;
	   `g2u_display("Driving hresp to 0")  
	    hresp=1'b0 ; 
	    wait_for_n_clks (1);
	   `g2u_display ("End pass_ idle_okay_responce_check_A")
	  `SVTEST_END
	
	  //************************************************************
	  // Test:
	  //   fail_ idle_okay_responce_check_A
	  //
	  // Desc:
	  //   Unit test for CIP_ID:  idle_okay_responce_check_A
	  //   Driving htrans,hready and hresp
	  //   Expected result: FAIL
	  //************************************************************
	  `SVTEST(fail_idle_okay_responce_check_A)
           `g2u_display ("fail_ idle_okay_responce_check_A")
	   `g2u_display ("Driving htrans to 0")
	    htrans=2'b00;
	   `g2u_display("Driving hready to 0")
	    hready=1'b0;
	   `g2u_display("Driving hresp to 1")  
	    hresp=1'b1 ; 
	    wait_for_n_clks (1);
	   `FAIL_IF_LOG(1, "Expected FAIL  idle_okay_responce_check_A ")
	   `g2u_display ("End fail_ idle_okay_responce_check_A")
	  `SVTEST_END
