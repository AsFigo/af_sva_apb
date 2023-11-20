//************************************************************
 //Test:
 //pass_nseq_seq_incr_wrap_burst_check_A
 //
 //Desc:
 //Unit test for CIP_ID: nseq_seq_incr_wrap_burst_check_A
 //Expected result: PASS
 //************************************************************
 `SVTEST(pass_nseq_seq_incr_wrap_burst_check_A)
   `g2u_display("Pass_nseq_seq_incr_wrap_burst_check_A")
   `g2u_display("Driving htrans to 2'b10 (NONSEQ)")
   htrans = 2'b10;  //NONSEQ
   wait_for_n_clks(1);
   `g2u_display("Driving hburst both at 3'b001 (INCR) && 3'b010 (WRAP4)")
   hburst = 3'b001;  //INCR
   hburst = 3'b010;  //WRAP4
   wait_for_n_clks(2);  
   `g2u_display("Driving htrans 2'b11 (SEQ)")
   htrans = 2'b11 ; //SEQ
   wait_for_n_clks(1);
    `g2u_display("Driving hburst both at 3'b001 (INCR) && 3'b010 (WRAP4)")
   hburst = 3'b001;  //INCR
   hburst = 3'b010;  //WRAP4
    wait_for_n_clks(10);
     `g2u_display("End Pass_nseq_seq_incr_wrap_burst_check_A")
 `SVTEST_END
 //************************************************************
 //Test:
 //Fail_nseq_seq_incr_wrap_burst_check_A
 //
 //Desc:
 //Unit test for CIP_ID: nseq_seq_incr_wrap_burst_check_A
 //Expected result: FAIL
 //************************************************************
 `SVTEST(Fail_nseq_seq_incr_wrap_burst_check_A)
  `g2u_display("Fail_nseq_seq_incr_wrap_burst_check_A")
  `g2u_display("Driving htrans to 2'b10 (NONSEQ)")
   htrans = 2'b10;  //NONSEQ
   wait_for_n_clks(1);
   `g2u_display("Driving hburst both at 3'b000 (SINGLE) && 3'b010 (WRAP4)")
   hburst = 3'b000;  //SINGLE
   hburst = 3'b010;  //WRAP4
   wait_for_n_clks(2);  
   `g2u_display("Driving htrans 2'b11 (SEQ)")
   htrans = 2'b11; //SEQ
   wait_for_n_clks(1);
    `g2u_display("Driving hburst both at 3'b001 (SINGLE) && 3'b010 (WRAP4)")
   hburst = 3'b000;  //SINGLE
   hburst = 3'b010;  //WRAP4  
   wait_for_n_clks(10);
   `FAIL_IF_LOG(1, "Expected FAIL nseq_seq_incr_wrap_burst_check_A")
   `g2u_display("End Fail_nseq_seq_incr_wrap_burst_check_A")
 `SVTEST_END
