 //************************************************************
 // Test:
 //   pass_AXI_ERRM_ARADDR_WRAP_ALIGN
 //
 // Desc:
 //   Unit test for CIP_ID: AXI_ERRM_ARADDR_WRAP_ALIGN
 //  Driving ARESETn and ARVALID
 //   Expected result: PASS
 //************************************************************
 `SVTEST(pass_AXI_ERRM_ARADDR_WRAP_ALIGN)
   `g2u_display ("pass_AXI_ERRM_ARADDR_WRAP_ALIGN")
   `g2u_display (" Driving ARESETn to 0 ")
   ARESETn=1'b0;
   `g2u_display("Driving ARVALID to 1")
   ARVALID=1'b0;
   `g2u_display("Driving ARREADY to 0")
   ARREADY=1'b0;
   `g2u_display("Driving ARBURST to 3'b001")    
   AWBURST=3'b001;
   `g2u_display("Driving ARADDR to 32'bx")    
   ARADDR=22'bxxxxxxxx;   
   wait_for_n_clks (10);
   `g2u_display (" Driving ARESETn to 1 ")
   ARESETn=1'b1;
   wait_for_n_clks (10);
   `g2u_display (" Driving ARVALID to 1 ")
   AWVALID=1'b1;
   `g2u_display("Driving ARREADY to 1")
   ARREADY=1'b1;
   wait_for_n_clks (10);
   `g2u_display ("End pass_AXI_ERRM_ARADDR_WRAP_ALIGN")
 `SVTEST_END

 //************************************************************
 // Test:
 //   fail_AXI_ERRM_ARADDR_WRAP_ALIGN
 //
 // Desc:
 //   Unit test for CIP_ID: AXI_ERRM_ARADDR_WRAP_ALIGN
 //  Driving ARESETn and AWVALID
 //   Expected result: FAIL
 //************************************************************
`SVTEST(fail_AXI_ERRM_ARADDR_WRAP_ALIGN)
  `g2u_display ("fail_AXI_ERRM_ARADDR_WRAP_ALIGN")   
  `g2u_display (" Driving ARESETn to 0 ")
   ARESETn=1'b0;
   `g2u_display("Driving ARVALID to 1")
   ARVALID=1'b0;
   `g2u_display("Driving ARREADY to 0")
   ARREADY=1'b0;
   `g2u_display("Driving ARBURST to 3'b001")    
   AWBURST=3'b001;
   `g2u_display("Driving ARADDR to 32'bx")    
   ARADDR=22'b00000010;   
   wait_for_n_clks (10);
   `g2u_display (" Driving ARESETn to 1 ")
   ARESETn=1'b1;
   wait_for_n_clks (10);
   `g2u_display (" Driving ARVALID to 1 ")
   AWVALID=1'b1;
   `g2u_display("Driving ARREADY to 1")
   ARREADY=1'b1;
   wait_for_n_clks (10);
   `g2u_display ("End fail_AXI_ERRM_ARADDR_WRAP_ALIGN")
   `SVTEST_END
