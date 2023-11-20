//import uvm_pkg::*;
//`include "uvm_macros.svh"
`define AF_CIP_ERROR(ID, MSG) \
  `uvm_error (ID, MSG) 
interface ahb_sva_cip();
  parameter valid_low = 16'h0000;
  parameter valid_high = 16'hffff;
  parameter ADDR_WIDTH=16;
  bit hclk,hresetn;
  logic hsel,hresp,hready,hready_out;
  logic [1:0]htrans;
  logic [2:0]hburst;
  logic [ADDR_WIDTH-1:0]haddr;
  
  /*-------------------------------------------------------------------------*/
  /*----------- AHB LITE SLAVE ASSERTION SPECFICATION -----------------------*/
  /*-------------------------------------------------------------------------*/
  
  //When active low reset, hready should be pulled low.
  Hreadycheck_A : assert property ( @(posedge hclk)
                    (hresetn==1'b0) |-> (hready==1'b0))  
  else
    `AF_CIP_ERROR("Hreadycheck_A","Hready should not be pulled low");
    
  //HREADY should be pulled low in first cylce of error response
  one_cycle_error_A : assert property (@(posedge hclk)
    (hresp==1'b1) |-> (hready==1'b0))
    
  else
     `AF_CIP_ERROR("one_cycle_error_A","HREADY should be not pulled low");
    
  //HREADY should be pulled high in the second cycle of error response
  two_cycle_error_A : assert property (@(posedge hclk)
    (hresp==1'b1) |=> (hready==1))
    
  else
    `AF_CIP_ERROR("two_cycle_error_A","HREADY should be not pulled high");
    
  //When a particular slave is not selected, its HREADY should be low
  slave_not_sel_A : assert property (@(posedge hclk)
    (hsel!=1'b0 && hsel!=1'b1) |-> (hready==1'b0))
    
  else
    `AF_CIP_ERROR("slave_not_sel_A","HREADY should be not pulled high");
    
  //When a particular slave is not selected, it should give an OKAY reponse
    
  slave_not_sel_okay_A : assert property (@(posedge hclk)
    (hsel!=1'b0 && hsel!=1'b1) |-> (hresp==1'b0))
  else
    `AF_CIP_ERROR("slave_not_sel_okay_A","HREADY should be not be OKAY");
    
  //Max No of wait states must not be more than 16
  //Commented verilator not supporting [*15] verilator not supporting max_no_wait_check_A: assert property (@(posedge hclk)
  //Commented verilator not supporting [*15]   $fell(hready) |=> (!(hready==1'b0)[*15]))
  //Commented verilator not supporting [*15]   
  //Commented verilator not supporting [*15] else
  //Commented verilator not supporting [*15]   `AF_CIP_ERROR("max_no_wait_check_A", "Max no.of wait states must not_be more than 16 condition is Failed"); 
      
  //Slave should come back with an zero cycle okay response for IDLE or BUSY
  slave_responce_at_zero_cycle_A: assert property(@(posedge hclk)
    ((htrans==2'b00 || htrans==2'b01) |-> (hready && (hresp==1'b0))))
    
  else
    `AF_CIP_ERROR("slave_responce_at_zero_cycle_A", "slave should not come back with Zero cylce OKAY responce");
    
  //hresp should remain unchanged when new hready_out is seen
  hresp_unchange_check_A: assert property(@(posedge hclk)
   (hready_out==1'b1)  |-> ($stable(hresp)))
    
  else
   `AF_CIP_ERROR("hresp_unchange_check_A", "hresp is changing when new ready_out is seen");
    
 /*---------------------------------------------------------------------------------*/
 /*------------------AHB LITE MASTER ASSERTION SPECFICATION-------------------------*/
 /*---------------------------------------------------------------------------------*/
    
 //HTRANS must not be driven to busy after an idle transfer is seen in previous cycle
 htrans_not_driven_busy_check_A: assert property(@(posedge hclk) disable iff(!hresetn)
   (htrans==2'b00) |-> (htrans!=2'b01))
   
 else
   `AF_CIP_ERROR("htrans_not_driven_busy_check_A","htrans is driven to busy after an idle transfer");
   
   //Addresses greater than valid low and high should not be generated
 valid_high_low_check_A: assert property(@(posedge hclk) disable iff(!hresetn)
   (!(haddr < valid_low) |-> !(haddr > valid_high)))
   
 else
   `AF_CIP_ERROR("valid_high_low_check_A","Address greater than valid low and high should generated");
   
 //After an IDLE transfer,next clock transfer type be either IDLE or NSEQ
 idle_transfer_check_A: assert property (@(posedge hclk)
   ((htrans==2'b01) |=> ((htrans==2'b01) || (htrans==2'b10))))
   
 else
   `AF_CIP_ERROR("idle_tranfer_check_A","After idle transfer  next clock tranfer type neither idle nor NSEQ ");
   
 //When HBURST is of type SINGLE, transfer type must be NSEQ
 single_burst_check_A: assert property (@(posedge hclk)
   (hburst==3'b000) |-> (htrans==2'b10))
   
 else
   `AF_CIP_ERROR("single_burst_check_A","When Hburst is single Transfer type is not NSEQ");
   
 //When BUSY cycles are induced within a transfer, Address should not change
 busy_transfer_addr_not_change_check_A: assert property (@(posedge hclk)
   (htrans==2'b01) |-> ($stable(haddr)))
 else
   `AF_CIP_ERROR("busy_transfer_addr_not_change_check_A","Address is changing when busy cycle is induced ");
   
 //Address should not change withn wait states
 addr_not_change_wait_check_A: assert property(@(posedge hclk)
   (hready==1'b0) |-> ($stable(haddr)))
   
 else
   `AF_CIP_ERROR("addr_not_change_wait_check_A","address is changing with in wait states");
   
 //Nseq must be followed by seq or burst for incr and wrap bursts
 nseq_seq_incr_wrap_burst_check_A: assert property(@(posedge hclk)
    (htrans==2'b11) || (htrans==2'b10) |=> (hburst==3'b001 && hburst==3'b010))
   
 else
   `AF_CIP_ERROR("nseq_seq_incr_wrap_burst_check_A","Nseq not floowed by seq or burst for incr & wrap");
                 
 //Busy should be followed by a busy or nseq, except for undefined length bursts
 busy_nseq_undefined_length_bursts_A: assert property(@(posedge hclk) disable iff(!hburst==3'b001)
   (htrans==2'b01) |=> (htrans==2'b01 || htrans==2'b10))
   
 else
   `AF_CIP_ERROR("busy_nsq_undefined_length_bursts_A","Busy should not followed by busy or nseq");
   
 //At Reset, htrans should be idle and hresp should be okay
 at_reset_idle_and_okay_A: assert property (@(posedge hclk) disable iff(!hresetn)
   (hresetn) |-> ((hresp==1'b0) && (htrans==2'b00)))
   
 else
   `AF_CIP_ERROR("at_reset_idle_and_okay_A","Htrans is not idle and hresp is not okay at reset ");
   
 //For Single nseq is never followed by a seq or busy
 single_nseq_check_A: assert property(@(posedge hclk)
   (htrans==2'b10) |-> !(htrans==2'b11 || htrans==2'b01))
   
 else
   `AF_CIP_ERROR("single_nseq_check_A","single nseq is followed by seq or busy");
   
 //For Busy transfer, zero wait state okay response should be seen
 busy_transfer_zero_wait_check_A: assert property (@(posedge hclk)
   (htrans==2'b01) |-> ((hready==1'b0) && (hresp==1'b0)))
   
 else
   `AF_CIP_ERROR("busy_transfer_zero_wait_check_A","For busy transfer wait state okay responce is not seen ");
   
 //Idle cycles should be followed by a zero wait state okay response
 idle_okay_responce_check_A: assert property (@(posedge hclk)
   (htrans==2'b00) |-> ((hready==1'b0) && (hresp==1'b0)))
   
 else
   `AF_CIP_ERROR("idle_okay_responce_check_A","Idle cycles not followed by zero wait state okay response");
   
 //Control signals will be constant within a burst
 control_signal_cons_burst_check_A: assert property(@(posedge hclk)
   (hburst) |-> ($stable(hresp) && $stable(htrans) && $stable(hready)))
   
 else
   `AF_CIP_ERROR("control_signal_cons_burst_check_A","control signals are not constant with the burst");
   
 //Controls signals should never be driven to x
 control_signal_check_A: assert property (@(posedge hclk)
   (hburst!=3'bX) |-> (hresp!=1'bX))
   
 else
   `AF_CIP_ERROR("control_signal_check_A","Control signals driven to X");
   
//When active low reset, hready should be pulled low.
  Hreadycheck_B : assert property (@(posedge hclk)
    (hresetn==1'b0) |-> (hready==1'b1))
    
  else
    `AF_CIP_ERROR("Hreadycheck_B","Hready should not be pulled low");
    
    
    initial begin : init
      `g2u_display("Using_CIP");
    end : init
endinterface : ahb_sva_cip

