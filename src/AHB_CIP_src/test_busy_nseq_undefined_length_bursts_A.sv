 //************************************************************
  // Test:
  //   pass_busy_nseq_undefined_length_bursts_A
  //
  // Desc:
  //   Unit test for CIP_ID: busy_nseq_undefined_length_bursts_A
  //   Driving hburst as WRAP4, htrans as BUSY and next clock htrans as BUSY or NONSEQ
  //   Expected result: PASS
  //************************************************************
  `SVTEST(pass_busy_nseq_undefined_length_bursts_A)
    `g2u_display ("Pass_busy_nseq_undefined_length_bursts_A")
    `g2u_display ("Driving hburst to 3'b010 WRAP4 ")
    hburst = 3'b010;  //WRAP4
    `g2u_display ("Driving htrans to 2'b01 BUSY")
    htrans = 2'b01;  //BUSY
    wait_for_n_clks (1); 
    `g2u_display ("Driving htrans to 2'b01 BUSY")
    htrans = 2'b01;  //BUSY
    wait_for_n_clks (1); 
    `g2u_display ("Driving htrans to 2'b10 NONSEQ")
    htrans = 2'b10;  //NONSEQ
    wait_for_n_clks (10); 
    `g2u_display ("End pass_busy_nseq_undefined_length_bursts_A")

  `SVTEST_END

  //************************************************************
  // Test:
  //   fail_busy_nseq_undefined_length_bursts_A
  //
  // Desc:
  //   Unit test for CIP_ID: busy_nseq_undefined_length_bursts_A
  //    Driving hburst as WRAP4, htrans as BUSY and next clock htrans as SEQ
  //   Expected result: FAIL
  //************************************************************
  `SVTEST(fail_busy_nseq_undefined_length_bursts_A)
    `g2u_display ("Fail_busy_nseq_undefined_length_bursts_A")
    `g2u_display ("Driving hburst to 3'b000 SINGLE")
    hburst = 3'b010;  //WRAP4
    `g2u_display ("Driving htrans to 2'b01 BUSY")
    htrans = 2'b01;  //BUSY
    wait_for_n_clks (1); 
    `g2u_display ("Driving htrans to 2'b11 SEQ")
    htrans = 2'b11;  //SEQ
    wait_for_n_clks (1); 
    `g2u_display ("Driving htrans to 2'b10 NONSEQ")
    htrans = 2'b10;  //NONSEQ
    wait_for_n_clks (10); 
    `FAIL_IF_LOG(1, "Expected FAIL busy_nseq_undefined_length_bursts_A")
    `g2u_display ("End Fail_busy_nseq_undefined_length_bursts_A")

  `SVTEST_END

