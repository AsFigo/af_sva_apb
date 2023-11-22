//************************************************************
// Test:
//   pass_AXI_ERRS_BID_X
//
// Desc:
//   Unit test for CIP_ID: AXI_ERRS_BID_X
//   Driving BVALID=1, BID != X
//   Expected result: PASS
//************************************************************

`SVTEST(pass_AXI_ERRS_BID_X)
  `g2u_display ("pass_AXI_ERRS_BID_X ")
  `g2u_display (" Driving BVALID to 1 ")
   BVALID =1'b1;
  `g2u_display("Driving BID to 1")
  //wait_for_n_clks (1);
  BID  = 4'b01;
  wait_for_n_clks (10);
  `g2u_display ("End pass_AXI_ERRS_BID_X")
`SVTEST_END

//************************************************************
// Test:
//   AXI_ERRS_BID_X
//
// Desc:
//   Unit test for CIP_ID: AXI_ERRS_BID_X
//   Driving BVALID=1, BID = X
//   Expected result: FAIL
//************************************************************

`SVTEST(fail_AXI_ERRS_BID_X)
  `g2u_display ("fail_AXI_ERRS_BID_X ")
  `g2u_display (" Driving BVALID to 1 ")
  BVALID =1'b1;
  `g2u_display("Driving BID to X")
  //wait_for_n_clks (1);
  BID  = 4'bx;
  wait_for_n_clks (10);
  `g2u_display ("End fail_AXI_ERRS_BID_X ")
`SVTEST_END
