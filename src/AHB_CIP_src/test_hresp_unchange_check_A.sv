	//************************************************************
	  // Test:
	  //   pass_hresp_unchange_check_A
	  //
	  // Desc:
	  //   Unit test for CIP_ID: hresp_unchange_check_A
	  //	Driving hready_out and hresp
	  //   Expected result: PASS
	  //************************************************************
	  `SVTEST(pass_hresp_unchange_check_A)
	
	    `g2u_display ("pass_hresp_unchange_check_A")
	    `g2u_display ("Driving hready_out to 1")
	     hready_out=1'b1;
	    `g2u_display("Driving hresp to 0")
	     hresp=1'b0;
	    `g2u_display("Driving hresp to 0")    
	     wait_for_n_clks (1);
	     hresp=1'b0;
	     wait_for_n_clks (1);
	    `g2u_display ("End pass_hresp_unchange_check_A")
	  `SVTEST_END
	
	  //************************************************************
	  // Test:
	  //   fail_hresp_unchange_check_A
	  //
	  // Desc:
	  //   Unit test for CIP_ID: hresp_unchange_check_A
	  //
	  //   Expected result: FAIL
	  //************************************************************
	  `SVTEST(fail_hresp_unchange_check_A)
	   `g2u_display ("fail_hresp_unchange_check_A")
	   `g2u_display ("Driving hready_out to 1")
	    hready_out=1'b1;
	   `g2u_display("Driving hresp to 0")
	    hresp=1'b0;
	   `g2u_display("Driving hresp to 1")    
	    wait_for_n_clks (1);
	    hresp=1'b1;
	    wait_for_n_clks (1);
	   `FAIL_IF_LOG(1, "Expected FAIL hresp_unchange_check_A")
	   `g2u_display ("End fail_hresp_unchange_check_A")
	  `SVTEST_END
