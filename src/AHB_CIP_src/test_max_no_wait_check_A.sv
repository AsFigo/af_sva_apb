//************************************************************
  //Test:
  //pass_max_no_wait_check_A
  //
  //Desc:
  //Unit test for CIP_ID: max_no_wait_check_A
  //hready = 0, after 16 clock hready = 1
  //Expected result: PASS
  //************************************************************
  `SVTEST(pass_max_no_wait_check_A)

    `g2u_display("pass_max_no_wait_check_A")
    `g2u_display("Driving hready to 0")
     hready =1'b0;
     wait_for_n_clks(16); 

    `g2u_display("Driving hready to 1")
     hready =1'b1;
    `g2u_display("End pass_max_no_wait_check_A")

  `SVTEST_END

  //************************************************************
  //Test:
  //fail_max_no_wait_check_A
  //
  //Desc:
  //Unit test for CIP_ID: max_no_wait_check_A
  //hready = 0, next 16 clock hready  = 0
  //Expected result: FAIL
  //************************************************************
  `SVTEST(fail_max_no_wait_check_A)

   `g2u_display("fail_max_no_wait_check_A")
   `g2u_display("Driving hready to 0")
     hready =1'b0;
     wait_for_n_clks(16); 

   `g2u_display("Driving hready to 0")
     hready =1'b0;
     wait_for_n_clks(1); 
    `FAIL_IF_LOG(1, "Expected FAIL max_no_wait_check_A")
    `g2u_display("End fail_max_no_wait_check_A")

  `SVTEST_END
