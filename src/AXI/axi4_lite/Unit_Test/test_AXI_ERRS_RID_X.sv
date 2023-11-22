//************************************************************
// Test:
//   pass_ AXI_ERRS_RID_X
//
// Desc:
//   Unit test for CIP_ID: AXI_ERRS_RID_X
//   Driving RVALID=1, RID !=x
//   Expected result: PASS
//************************************************************

`SVTEST(pass_AXI_ERRS_RID_X)
  `g2u_display ("pass_AXI_ERRS_RID_X")
  `g2u_display (" Driving RVALID to 1 ")
   RVALID =1'b1;
  `g2u_display("Driving RID to 1")
  //wait_for_n_clks (1);
  RID  != 2'bx ;
  wait_for_n_clks (2);
  RID != 2'bx ;
  wait_for_n_clks (1);
  `g2u_display ("End pass_AXI_ERRS_RID_X")
`SVTEST_END

//************************************************************
// Test:
//   AXI_ERRS_RID_X
//
// Desc:
//   Unit test for CIP_ID: AXI_ERRS_RID_X
//   Driving RVALID=1, RID !=x
//   Expected result: FAIL
//************************************************************

`SVTEST(fail_AXI_ERRS_RID_X)
  `g2u_display ("fail_AXI_ERRS_RID_X ")
  `g2u_display (" Driving RVALID to 1 ")
   RVALID =1'b1;
  `g2u_display("Driving RID to 1")
  //wait_for_n_clks (1);
  RID  = 2'bx ;
  wait_for_n_clks (2);
  RID = 2'bx ;
  wait_for_n_clks (1);
  `g2u_display ("End fail_AXI_ERRS_RID_X ")
`SVTEST_END
