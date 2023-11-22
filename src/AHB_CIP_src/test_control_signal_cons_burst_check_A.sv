//************************************************************
 //Test:
 //pass_control_signal_cons_burst_check_A
 //
 //Desc:
 //Unit test for CIP_ID: control_signal_cons_burst_check_A
 //hburst is INCR and driving hresp, htrans, hready , next clock checking the same
 //Expected result: PASS
 //************************************************************
 `SVTEST(pass_control_signal_cons_burst_check_A)
   `g2u_display("Pass_control_signal_cons_burst_check_A")
   `g2u_display("Driving hburst to 3'b001 is INCR")
   hburst = 3'b001; //INCR
   `g2u_display("Driving hresp && htrans && hready")
   hresp = 1;
   htrans = 2'b10; 
   hready = 1;
   wait_for_n_clks(1);
   `g2u_display("Driving hresp is 1 && htrans is 2'b10 && hready is 1")
   hresp = 1;
   htrans = 2'b10; 
   hready = 1;
   wait_for_n_clks(5);
   `g2u_display("End Pass_control_signal_cons_burst_check_A")
 `SVTEST_END
 //************************************************************
 //Test:
 //Fail_control_signal_cons_burst_check_A
 //
 //Desc:
 //Unit test for CIP_ID: control_signal_cons_burst_check_A
 ///hburst is INCR and driving hresp, htrans, hready , next clock checking the same
 //Expected result: FAIL
 //************************************************************
 `SVTEST(Fail_control_signal_cons_burst_check_A)
  `g2u_display("Fail_control_signal_cons_burst_check_A")
  `g2u_display("Driving hburst to 3'b001 is INCR")
   hburst = 3'b001; //INCR
   `g2u_display("Driving hresp && htrans && hready")
   hresp = 1;
   htrans = 2'b10; 
   hready = 0;
   wait_for_n_clks(1);
   `g2u_display("Driving hresp is 0 && htrans is 2'b10 && hready is 1")
   hresp = 0;
   htrans = 2'b10; 
   hready = 1;
   wait_for_n_clks(5); 
   `FAIL_IF_LOG(1, "Expected FAIL control_signal_cons_burst_check_A")
   `g2u_display("End Fail_control_signal_cons_burst_check_A")
 `SVTEST_END
