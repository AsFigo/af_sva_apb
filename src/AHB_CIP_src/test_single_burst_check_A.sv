 //************************************************************
  //Test:
  //pass_single_burst_check_A
  //
  //Desc:
  //Unit test for CIP_ID: single_burst_check_A
  //hburst =3'b000, clock htrans = 2'b10
  //Expected result: PASS
  //************************************************************
  `SVTEST(pass_single_burst_check_A)

    `g2u_display("pass_single_burst_check_A")
   // idle();
    `g2u_display("Driving hburst to 001 ")
    hburst =3'b001;
    htrans = 2'b00;
    wait_for_n_clks(2); 
    `g2u_display("Driving htrans to 0 ")
    hburst =3'b000;
    htrans= 2'b10;
    wait_for_n_clks(2); 
      `g2u_display("End pass_single_burst_check_A")

  `SVTEST_END

  //************************************************************
  //Test:
  //Fail_single_burst_check_A
  //
  //Desc:
  //Unit test for CIP_ID: single_burst_check_A
  //hburst =3'b000,  clock htrans = 2'b11
  //Expected result: FAIL
  //************************************************************
  `SVTEST(Fail_single_burst_check_A)
  
   `g2u_display("Fail_single_burst_check_A")
   // idle();
   `g2u_display("Driving hburst to 0 ")
    hburst =3'b000;
    htrans = 2'b00;
    wait_for_n_clks(2); 
   `g2u_display("Driving htrans to 11 ")
    hburst =3'b000; 
    htrans= 2'b11;
    wait_for_n_clks(2); 
      `g2u_display("End pass_single_burst_check_A")
  `SVTEST_END
