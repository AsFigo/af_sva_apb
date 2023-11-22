//************************************************************
// Test:
//   pass_ AXI_ERRS_RRESP_STABLE
//
// Desc:
//   Unit test for CIP_ID: AXI_ERRS_RRESP_STABLE
//   Driving RVALID=1, RREADY=0
//   Expected result: PASS
//************************************************************

`SVTEST(pass_AXI_ERRS_RRESP_STABLE)
  `g2u_display ("pass_ AXI_ERRS_RRESP_STABLE")
  `g2u_display (" Driving RVALID to 1 ")
   RVALID =1'b1;
  `g2u_display("Driving RREADY to 0")
   RREADY=1'b0;
  `g2u_display("Driving RRESP to 1")
  //wait_for_n_clks (1);
  RRESP  = 2'b1 ;
  wait_for_n_clks (2);
  RRESP  = 2'b1 ;
  wait_for_n_clks (1);
  `g2u_display ("pass_ AXI_ERRS_RRESP_STABLE")
`SVTEST_END

//************************************************************
// Test:
//   fail_AXI_ERRS_RRESP_STABLE
//
// DescR
//   Unit test for CIP_ID: AXI_ERRS_RRESP_STABLE
//   Driving RVALID=1, RREADY=0
//   Expected result: FAIL
//************************************************************

`SVTEST(fail_AXI_ERRS_RRESP_STABLE)
  `g2u_display ("fail_AXI_ERRS_RRESP_STABLE ")
  `g2u_display (" Driving RVALID to 1 ")
   RVALID =1'b1;
  `g2u_display("Driving RREADY to 0")
   RREADY=1'b0;
  `g2u_display("Driving RRESP to 1")
  //wait_for_n_clks (1);
  RRESP  = 2'b1 ;
  wait_for_n_clks (2);
  RRESP  = 2'b0 ;
  wait_for_n_clks (1);
  `g2u_display ("End fail_AXI_ERRS_RRESP_STABLE ")
`SVTEST_END
