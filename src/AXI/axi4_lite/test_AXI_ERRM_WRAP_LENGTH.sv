    //************************************************************
	  // Test:
	  //   pass_AXI_ERRM_WRAP_LENGTH
	  //
	  // Desc:
	  //   Unit test for CIP_ID: AXI_ERRM_WRAP_LENGTH
	  //  Driving ARESETn and AWVALID
	  //   Expected result: PASS
	  //************************************************************
	 `SVTEST(pass_AXI_ERRM_WRAP_LENGTH)
	   `g2u_display ("pass_AXI_ERRM_WRAP_LENGTH")
	   `g2u_display (" Driving ARESETn to 0 ")
	    ARESETn=1'b0;
	   `g2u_display("Driving AWVALID to 1")
	    AWVALID=1'b1;
	   `g2u_display("Driving AWBURST to 2'10")    
	    AWBURST=2'b10;
           `g2u_display("Driving AWLEN to 1")    
	    AWLEN=2'b01;   
	    wait_for_n_clks (10);
            `g2u_display (" Driving ARESETn to 1 ")
            ARESETn=1'b1;
            wait_for_n_clks (10);
            `g2u_display (" Driving ARLEN to 2'10 ")
            AWLEN=2'b10;
	    wait_for_n_clks (10);
	   `g2u_display ("End pass_AXI_ERRM_WRAP_LENGTH")
	 `SVTEST_END
	
	  //************************************************************
	  // Test:
	 //   fail_AXI_ERRM_WRAP_LENGTH
	  //
	  // Desc:
	  //   Unit test for CIP_ID: AXI_ERRM_WRAP_LENGTH
	  //  Driving ARESETn and AWVALID
	  //   Expected result: FAIL
	  //************************************************************
	  `SVTEST(fail_WRAP_length)
	   `g2u_display ("fail_AXI_ERRM_WRAP_LENGTH")   
	    `g2u_display (" Driving ARESETn to 0 ")
	    ARESETn=1'b0;
	   `g2u_display("Driving AWVALID to 1")
	    AWVALID=1'b1;
	   `g2u_display("Driving AWBURST to 2'10")    
	    AWBURST=2'b10;
           `g2u_display("Driving AWLEN to 1")    
	    AWLEN=2'b00;   
	    wait_for_n_clks (10);
            `g2u_display (" Driving ARESETn to 1 ")
            ARESETn=1'b1;
            wait_for_n_clks (10);
            `g2u_display (" Driving ARLEN to 2'b00 ")
            AWLEN=2'b00;
	    wait_for_n_clks (10);

	   `g2u_display ("End fail_AXI_ERRM_WRAP_LENGTH")
   `SVTEST_END
