//************************************************************
// Test:
//   pass_ AXI_ERRS_RLAST_X
//
// Desc:
//   Unit test for CIP_ID: AXI_ERRS_RLAST_X
//   Driving RVALID=1, RLAST != x
//   Expected result: PASS
//************************************************************

`SVTEST(pass_ AXI_ERRS_RLAST_X)
  `g2u_display ("pass_ AXI_ERRS_RLAST_X ")
  `g2u_display (" Driving RVALID to 1 ")
   RVALID =1'b1;
  `g2u_display("Driving RLAST to !x")
   RLAST !=1'bx;
  `g2u_display("Driving RLAST to !x ")
   wait_for_n_clks (1);
   RLAST !=1'bx;
   wait_for_n_clks (2);
  `g2u_display ("End pass_ AXI_ERRS_RLAST_X ")
`SVTEST_END

//************************************************************
// Test:
//   fail_AXI_ERRS_RLAST_X
//
// Desc:
//   Unit test for CIP_ID: AXI_ERRS_RLAST_X
//   Driving RVALID=1, RLAST != x
//   Expected result: FAIL
//************************************************************

`SVTEST(fail_AXI_ERRS_RLAST_X)
  `g2u_display ("fail_AXI_ERRS_RLAST_X ")
  `g2u_display (" Driving RVALID to 1 ")
   RVALID =1'b1;
  `g2u_display("Driving RLAST to x")
   RLAST =1'bx;
  `g2u_display("Driving RLAST to x ")
   wait_for_n_clks (1);
   RLAST =1'bx;
   wait_for_n_clks (2);
  `g2u_display ("End fail_AXI_ERRS_RLAST_X ")
`SVTEST_END
