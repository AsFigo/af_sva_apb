//************************************************************
// Test:
//   pass_AXI_ERRS_BID_STABLE
//
// Desc:
//   Unit test for CIP_ID: AXI_ERRS_BID_STABLE
//   Driving BVALID=1, BREADY=0
//   Expected result: PASS
//************************************************************

`SVTEST(pass_AXI_ERRS_BID_STABLE)

   `g2u_display ("pass_AXI_ERRS_BID_STABLE")
   `g2u_display (" Driving BVALID to 1 ")
   BVALID =1'b1;
   `g2u_display("Driving BREADY to 0")
   BREADY=1'b0;
   `g2u_display("Driving BID to 1")
   BID  = 4'b0001;
    wait_for_n_clks (1);
   `g2u_display("Driving BREADY to 0")
   BREADY=1'b0;
   wait_for_n_clks (10);

  `g2u_display ("End pass_AXI_ERRS_BID_STABLE")

`SVTEST_END

//************************************************************
// Test:
//   AXI_ERRS_BID_STABLE
//
// Desc:
//   Unit test for CIP_ID: AXI_ERRS_BID_STABLE
//   Driving BVALID=1, BREADY=0
//   Expected result: FAIL
//************************************************************

`SVTEST(fail_AXI_ERRS_BID_STABLE)

  `g2u_display ("fail_AXI_ERRS_BID_STABLE")
  `g2u_display (" Driving BVALID to 1 ")
   BVALID =1'b1;
  `g2u_display("Driving BREADY to 0")
   BREADY=1'b0;
  `g2u_display("Driving BID to 1")
  BID  = 4'b1000 ;
  wait_for_n_clks (2);
  `g2u_display ("Driving WID to 3")
  BID = 4'b0011;
  wait_for_n_clks (10);
  `g2u_display ("End fail_AXI_ERRS_BID_STABLE ")

`SVTEST_END
