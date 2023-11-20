//************************************************************
  //Test:
  //pass_single_nseq_check_A
  //
  //Desc:
  //Unit test for CIP_ID: single_nseq_check_A
  //htrans = 2'b10  , clock htrans =( 2'b11 or 2'b01)
  //Expected result: PASS
  //************************************************************
  `SVTEST(pass_single_nseq_check_A)

    `g2u_display("pass_single_nseq_check_A")
    `g2u_display("Driving htrans to 10")
    htrans = 2'b10; 
     wait_for_n_clks(1); 
    `g2u_display("Driving hready to 11 0r 01")
    htrans = (2'b11 || 2'b01);
    wait_for_n_clks(4); 
    `g2u_display("End pass_single_nseq_check_A")

  `SVTEST_END

  //************************************************************
  //Test:
  //Fail_single_nseq_check_A
  //
  //Desc:
  //Unit test for CIP_ID: single_nseq_check_A
  //htrans = 10, clock htrans  = 00
  //Expected result: FAIL
  //************************************************************
  `SVTEST(Fail_single_nseq_check_A)

    `g2u_display("Fail_single_nseq_check_A")
    `g2u_display("Driving htrans to 10")
    htrans = 2'b10; 
     wait_for_n_clks(1); 
    `g2u_display("Driving htrans to 0")
    htrans = 2'b00;
    wait_for_n_clks(4); 
    `FAIL_IF_LOG(1, "Expected FAIL single_nseq_check_A")
    `g2u_display("End fail_single_nseq_check_A")

  `SVTEST_END
