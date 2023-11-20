//************************************************************
  //Test:
  //pass_busy_transfer_zero_wait_check_A
  //
  //Desc:
  //Unit test for CIP_ID: busy_transfer_zero_wait_check_A
  //htrans = 1, clock hready = 0, hresp=0;
  //Expected result: PASS
  //************************************************************
  `SVTEST(pass_busy_transfer_zero_wait_check_A)

    `g2u_display("pass_busy_transfer_zero_wait_check_A")
    `g2u_display("Driving htrans to 1")
     htrans =2'b01;
    `g2u_display("Driving hready to 0")
     hready =1'b0;
     hresp =1'b0;
     wait_for_n_clks (4);
    `g2u_display("End pass_busy_transfer_zero_wait_check_A")

  `SVTEST_END

  //************************************************************
  //Test:
 //Fail_busy_transfer_zero_wait_check_A
  //
  //Desc:
  //Unit test for CIP_ID: busy_transfer_zero_wait_check_A
  //htrans = 1, clock hready = 1, hresp = 1;
  //Expected result: FAIL
  //************************************************************
  `SVTEST(fail_busy_transfer_zero_wait_check_A)   
    `g2u_display("pass_busy_transfer_zero_wait_check_A")
    `g2u_display("Driving htrans to 1")
     htrans =2'b01;
    `g2u_display("Driving hready to 1")
     hready =1'b1;
     hresp =1'b1;
     wait_for_n_clks (4);
    `FAIL_IF_LOG(1, "Expected FAIL busy_transfer_zero_wait_check_A")
    `g2u_display("End fail_busy_transfer_zero_wait_check_A")

  `SVTEST_END
