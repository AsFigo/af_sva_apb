//********************
  //Test:pass_control_signal_check_A
  //
  //Desc:
  //Unit test for CIP_ID: control_signal_check_A
  //hresp = 1,hburst = 3'b000, hresp=0 ,hburst = 3'b111 ;
  //Expected result: PASS
  //********************
  `SVTEST(pass_control_signal_check_A)

    `g2u_display("pass_control_signal_check_A")
    `g2u_display("Driving hburst to all 0's")
     hburst =3'b000;
    `g2u_display("Driving hburst to all 1's")
     hburst =3'b111;
    `g2u_display("Driving hresp to 0")
    hresp =1'b0;
    `g2u_display("Driving hresp to 1")
    hresp =1'b1;
    wait_for_n_clks (4);
    `g2u_display("End pass_control_signal_check_A")

  `SVTEST_END

  //********************
  //Test:Fail_control_signal_check_A
  //
  //Desc:
  //Unit test for CIP_ID: control_signal_check_A
  //hresp = 1'bX,hburst = 3'b000,hburst = 3'b111 ;
  //Expected result: FAIL
  //********************
  `SVTEST(fail_control_signal_check_A)   

    `g2u_display("fail_control_signal_check_A")
    `g2u_display("Driving hburst to all 0's")
    hburst =3'b000;
    `g2u_display("Driving hburst to all 1's")
    hburst =3'b111;
    `g2u_display("Driving hresp to 0")
    hresp =1'bX;
    wait_for_n_clks (4);
    `FAIL_IF_LOG(1, "Expected FAIL control_signal_check_A")
    `g2u_display("End fail_control_signal_check_A")

  `SVTEST_END 
