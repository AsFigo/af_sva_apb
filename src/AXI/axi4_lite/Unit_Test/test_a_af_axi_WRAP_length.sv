    //************************************************************
	  // Test:
	  //   pass_WRAP_length
	  //
	  // Desc:
	  //   Unit test for CIP_ID: WRAP_length
	  //  Driving ARESETn and AWVALID
	  //   Expected result: PASS
	  //************************************************************
	 `SVTEST(pass_WRAP_length)
	   `g2u_display ("pass_WRAP_length")
	   `g2u_display (" Driving ARESETn to 0 ")
	    ARESETn=1'b0;
	   `g2u_display("Driving AWVALID to 1")
	    AWVALID=1'b1;
	   `g2u_display("Driving AWBURST to 1")    
	    AWBURST=2'b10;
	   `g2u_display("Driving AWLEN ")    
	    wait_for_n_clks (1);
	    AWLEN == (2'b01 || 2'b10 || 2'b11);
	    wait_for_n_clks (1);
	   `g2u_display ("End pass_WRAP_length")
	 `SVTEST_END
	
	  //************************************************************
	  // Test:
	 //   fail_WRAP_length
	  //
	  // Desc:
	  //   Unit test for CIP_ID: WRAP_length
	  //  Driving ARESETn and AWVALID
	  //   Expected result: FAIL
	  //************************************************************
	  `SVTEST(fail_WRAP_length)
	   `g2u_display ("fail_WRAP_length")   
	   `g2u_display (" Driving ARESETn to 0 ")
	    ARESETn=1'b0;
	   `g2u_display("Driving AWVALID to 1")
	    AWVALID=1'b1;
	   `g2u_display("Driving AWBURST to 1")    
	    AWBURST=2'b10;
	   `g2u_display("Driving AWLEN ")    
	    wait_for_n_clks (1);
	    AWLEN == 2'b00;
	    wait_for_n_clks (1);
	   `g2u_display ("End fail_WRAP_length")
   `SVTEST_END
