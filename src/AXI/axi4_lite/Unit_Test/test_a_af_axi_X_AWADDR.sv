//************************************************************
// Test:
//   pass_a_af_axi_X_AWADDR
//
// Desc:
//   Unit test for CIP_ID: a_af_axi_X_AWADDR
//   Driving ARESETn and AWVALID
//   Expected result: PASS
//************************************************************
`SVTEST(pass_a_af_axi_X_AWADDR)
   `g2u_display ("pass_a_af_axi_X_AWADDR")
   `g2u_display (" Driving ARESETn to 0 ")
   ARESETn=1'b0;
   `g2u_display("Driving AWVALID to 1")
   AWVALID=1'b1;
  `g2u_display("Driving AWADDR to not equal x")    
   AWADDR != 'bx;
   wait_for_n_clks (1);
   `g2u_display ("End pass_a_af_axi_X_AWADDR")
`SVTEST_END
		
 //************************************************************
// Test:
//   fail_a_af_axi_X_AWADDR
//
// Desc:
//   Unit test for CIP_ID: a_af_axi_X_AWADDR
//   Driving ARESETn and AWVALID
//   Expected result: FAIL
 //************************************************************
     `SVTEST(fail_a_af_axi_X_AWADDR)
       `g2u_display ("fail_a_af_axi_X_AWADDR")   
       `g2u_display (" Driving ARESETn to 0 ")
        ARESETn=1'b0;
       `g2u_display("Driving AWVALID to 1")
       AWVALID=1'b1;
       `g2u_display("Driving AWADDR to x")    
        AWADDR = 'bx;
        wait_for_n_clks (1);
       `g2u_display ("End fail_a_af_axi_X_AWADDR")
   `SVTEST_END
