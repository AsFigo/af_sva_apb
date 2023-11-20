//************************************************************
// Test:
//   AXI_ERRS_BREADY_X
//
// Desc:
//   Unit test for CIP_ID: AXI_ERRM_BREADY_X
//   Driving ARESETn=0, BREADY != X
//   Expected result: PASS
//************************************************************

`SVTEST(pass_AXI_ERRM_BREADY_X)
  `g2u_display ("pass_AXI_ERRM_BREADY_X)")
  `g2u_display (" Driving ARESETn to 0 ")
   ARESETn =1'b0;
  `g2u_display("Driving BREADY to !X")
  //wait_for_n_clks (1);
  BREADY  != 1'bx ;
  wait_for_n_clks (2);
  BREADY ! = 1'bx ;
  wait_for_n_clks (1);
  `g2u_display ("End pass_AXI_ERRM_BREADY_X)")
`SVTEST_END

//************************************************************
// Test:
//   AXI_ERRM_BREADY_X
//
// Desc:
//   Unit test for CIP_ID: AXI_ERRM_BREADY_X
//   Driving ARESETn=0, BREADY != X
//   Expected result: FAIL
//************************************************************

`SVTEST(fail_AXI_ERRM_BREADY_X)
  `g2u_display ("fail_AXI_ERRM_BREADY_X ")
  ` g2u_display (" Driving ARESETn to 0 ")
   ARESETn =1'b0;
  `g2u_display("Driving BREADY to !X")
  //wait_for_n_clks (1);
  BREADY  = 1'bx ;
  wait_for_n_clks (2);
  BREADY = 1'bx ;
  wait_for_n_clks (1);
  `g2u_display ("End fail_AXI_ERRM_BREADY_X ")
`SVTEST_END

