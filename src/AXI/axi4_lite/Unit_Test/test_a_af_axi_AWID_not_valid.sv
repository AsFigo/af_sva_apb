  //************************************************************
  // Test:
  //   pass_AWID_not_valid
  //
  // Desc:
  //   Unit test for CIP_ID: AWID_not_valid
  //  Driving ARESETn and AWVALID
  //   Expected result: PASS
  //************************************************************
	  
	 
  `SVTEST(pass_AWID_not_valid)
    `g2u_display ("pass_AWID_not_valid")
    `g2u_display (" Driving ARESETn to 0 ")
    ARESETn=1'b0;
    `g2u_display("Driving AWVALID to 1")
    AWVALID=1'b1;
    `g2u_display("Driving AWID to !x ")    
    //wait_for_n_clks (1);
    AWID !== 'bx ;
    wait_for_n_clks (1);
   `g2u_display ("End pass_AWID_not_valid")
 `SVTEST_END

	
 //************************************************************
  // Test:
  //   fail_AWID_not_valid
  //
  // Desc:
  //   Unit test for CIP_ID: AWID_not_valid
  //  Driving ARESETn and AWVALID
  //   Expected result: FAIL
  //************************************************************
	  
	 
`SVTEST(fail_AWID_not_valid)
  `g2u_display ("fail_AWID_not_valid")
  `g2u_display (" Driving ARESETn to 0 ")
  ARESETn=1'b0;
  `g2u_display("Driving AWVALID to 1")
  AWVALID=1'b1;
  `g2u_display("Driving AWID to x ")    
  //wait_for_n_clks (1);
  AWID == 'bx ;
  wait_for_n_clks (1);
`g2u_display ("End fail_AWID_not_valid")`SVTEST_END
`SVTEST_END
