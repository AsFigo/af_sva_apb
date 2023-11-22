//************************************************************
// Test:
//   pass_AXI_ERRS_BVALID_STABLE
//
// Desc:
//   Unit test for CIP_ID: AXI_ERRS_BVALID_STABLE
//   Driving BVALID=1, BREADY=0
//   Expected result: PASS
//************************************************************

`SVTEST(pass_AXI_ERRS_BVALID_STABLE)
  `g2u_display ("pass_AXI_ERRS_BVALID_STABLE ")
  `g2u_display (" Driving BVALID to 1 ")
   BVALID =1'b1;
  `g2u_display("Driving BREADY to 0")
   BREADY=1'b0;
  `g2u_display("Driving BVALID to 1 ")
  wait_for_n_clks (1);
  BVALID =1'b1;
  `g2u_display("Driving BREADY to 1")
   BREADY=1'b1;
  wait_for_n_clks (1);
  `g2u_display ("End pass_AXI_ERRS_BVALID_STABLE ")
`SVTEST_END

//************************************************************
// Test:
//   AXI_ERRS_BVALID_STABLE
//
// Desc:
//   Unit test for CIP_ID: AXI_ERRS_BVALID_STABLE
//   Driving BVALID=1, BREADY=0
//   Expected result: FAIL
//************************************************************

`SVTEST(fail_AXI_ERRS_BVALID_STABLE)
  `g2u_display ("fail_AXI_ERRS_BVALID_STABLE ")
  `g2u_display (" Driving BVALID to 1 ")
   BVALID =1'b1;
  `g2u_display("Driving BREADY to 0")
   BREADY=1'b0;
  `g2u_display("Driving BVALID to 1 ")
  wait_for_n_clks (1);
  BVALID =1'b1;
  `g2u_display("Driving BREADY to 0")
  BREADY=1'b0;
  wait_for_n_clks (1);
  `g2u_display ("End fail_AXI_ERRS_BVALID_STABLE ")
`SVTEST_END
