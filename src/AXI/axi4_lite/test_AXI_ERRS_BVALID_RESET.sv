//************************************************************
// Test:
//   pass_AXI_ERRS_BVALID_RESET
//
// Desc:
//   Unit test for CIP_ID: AXI_ERRS_BVALID_RESET
//   Driving ARESETn = 1, next clk BVALID=0
//   Expected result: PASS
//************************************************************

`SVTEST(pass_AXI_ERRS_BVALID_RESET)
  `g2u_display ("pass_AXI_ERRS_BVALID_RESET ")
  `g2u_display("Driving ARESETn to 0")
   ARESETn  = 1'b0;
  `g2u_display (" Driving BVALID to 1")
   BVALID =1'b1;
   wait_for_n_clks (1);
  `g2u_display("Driving ARESETn to 1")
   ARESETn  = 1'b1;
   wait_for_n_clks (1);
  `g2u_display (" Driving BVALID to 0 ")
   BVALID =1'b0;
   wait_for_n_clks (1);
  `g2u_display (" Driving BVALID to 1")
   BVALID =1'b1;
   wait_for_n_clks (1);
  `g2u_display ("End pass_AXI_ERRS_BVALID_RESET ")
`SVTEST_END

//************************************************************
// Test:
//   fail_AXI_ERRS_BVALID_RESET
//
// Desc:
//   Unit test for CIP_ID: AXI_ERRS_BVALID_RESET
//   ARESETn = 1, next clk BVALID=0
//   Expected result: FAIL
//************************************************************

`SVTEST(fail_AXI_ERRS_BVALID_RESET)
  `g2u_display ("fail_AXI_ERRS_BVALID_RESET ")
  `g2u_display("Driving ARESETn to 0")
   ARESETn  = 1'b0;
  `g2u_display (" Driving BVALID to 1")
   BVALID =1'b1;
   wait_for_n_clks (1);
  `g2u_display("Driving ARESETn to 1")
   ARESETn  = 1'b1;
   wait_for_n_clks (1);
  `g2u_display (" Driving BVALID to 1 ")
   BVALID =1'b1;
   wait_for_n_clks (1);
  `g2u_display ("End fail_AXI_ERRS_BVALID_RESET ")
`SVTEST_END
