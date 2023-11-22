//************************************************************
// Test:
//   pass_AXI_ERRM_AWLEN_X
//
// Desc:
//   Unit test for CIP_ID: AXI_ERRM_AWLEN_X
//   Driving AWVALID = 1 and AWREADY =0
//   Expected result: PASS
//************************************************************
`SVTEST(pass_AXI_ERRM_AWLEN_X)
  `g2u_display ("pass_AXI_ERRM_AWLEN_X ")
  `g2u_display("Driving ARESETn to 0")
   ARESETn =1'b0;
  `g2u_display("Driving AWVALID to 1")
  AWVALID=1'b1;
  `g2u_display("Driving AWREADY to 0")
  AWREADY=1'b0;
  `g2u_display("Driving AWLEN to 01 ")
  //wait_for_n_clks (1);
  AWLEN = 8'h01;
  wait_for_n_clks (1);  
  `g2u_display ("End pass_AXI_ERRM_AWLEN_X ")
`SVTEST_END

//************************************************************
// Test:
//   fail_AXI_ERRM_AWLEN_X
//
// Desc:
//   Unit test for CIP_ID: AXI_ERRM_AWLEN_X
//   Driving AWVALID = 1 and AWREADY =0
//   Expected result: FAIL
//************************************************************
`SVTEST(fail_AXI_ERRM_AWLEN_X)
  `g2u_display ("fail_AXI_ERRM_AWLEN_X ")
  `g2u_display("Driving ARESETn to 0")
  ARESETn =1'b0;
  `g2u_display("Driving AWVALID to 1")
  AWVALID=1'b1;
  `g2u_display("Driving AWREADY to 0")
  AWREADY=1'b0;
  `g2u_display("Driving AWLEN to x ")
  //wait_for_n_clks (1);
  AWLEN = 8'bx;
  wait_for_n_clks (2); 
 `FAIL_IF_LOG(1, "Expected FAIL AXI_ERRM_AWLEN_X") 
  `g2u_display ("End fail_AXI_ERRM_AWLEN_X")
`SVTEST_END
