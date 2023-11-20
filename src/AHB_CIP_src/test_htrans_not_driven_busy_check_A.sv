//************************************************************
 //Test:
 //pass_htans_not_driven_busy_check_A
 //
 //Desc:
 //Unit test for CIP_ID: htans_not_driven_busy_check_A
 //htrans = 2'b00 , same clock htrans = 2'b10
 //Expected result: PASS
 //************************************************************
 `SVTEST(pass_htans_not_driven_busy_check_A)
   `g2u_display("Pass_htans_not_driven_busy_check_A")
   `g2u_display("Driving htrans to 2'b00 (IDLE)")
   htrans = 2'b00;  //IDLE
   `g2u_display("Driving htrans to 2'b10 (NONSEQ)")
   htrans= 2'b10;  //NONSEQ
   wait_for_n_clks(2);
   `g2u_display("End Pass_htans_not_driven_busy_check_A")
 `SVTEST_END
 //************************************************************
 //Test:
 //Fail_htans_not_driven_busy_check_A
 //
 //Desc:
 //Unit test for CIP_ID: htans_not_driven_busy_check_A
 //htrans = 2'b00 , same clock htrans = 2'b01
 //Expected result: FAIL
 //************************************************************
 `SVTEST(Fail_htans_not_driven_busy_check_A)
  `g2u_display("Fail_htans_not_driven_busy_check_A")
  `g2u_display("Driving htrans to 2'b00 (IDLE)")
  htrans = 2'b00;  //IDLE
  `g2u_display("Driving htrans to 2'b01 (BUSY)")
  htrans = 2'b01;  //BUSY
  wait_for_n_clks(2);
  `FAIL_IF_LOG(1, "Expected FAIL htans_not_driven_busy_check_A")
  `g2u_display("End Fail_htans_not_driven_busy_check_A")
 `SVTEST_END
