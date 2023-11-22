`include "svunit_defines.svh"

module ahb_slave_unit_test;
  import svunit_pkg::svunit_testcase;


  string name = "ahb_slave_ut";
  svunit_testcase svunit_ut;

  logic [7:0] addr;
  logic [31:0] data, rdata;


  //===================================
  // This is the UUT that we're 
  // running the Unit Tests on
  //===================================
  reg         hclk;
  reg         hresetn;
  reg [7:0]   haddr;
  reg         hwrite;
  bit         hready;
  reg         hsel;
  reg [2:0]   hsize;
  reg [2:0]   hburst;
  reg [3:0]   hprot;
  reg         hresp;
  reg         hmastlock;
  reg [1:0]   htrans;
  reg         henable;
  reg [31:0]  hwdata;
  wire [31:0] hrdata;
  reg        hready_out;

  assign hready = 1'b1;

  parameter CLK_PERIOD = 10;
  // hclk generator
  initial begin
    hclk = 0;
    forever begin
      #(CLK_PERIOD/2) hclk = ~hclk;
    end
  end

  task wait_for_n_clks (input int num_hclk = 1);
    repeat (num_hclk) begin
      @ (negedge hclk);
    end
  endtask : wait_for_n_clks 

  /*
  default clocking dcb @(posedge hclk);
  endclocking : dcb
  */

  ahb_slave my_ahb_slave(.*);


  //===================================
  // Build
  //===================================
  function void build();
    svunit_ut = new(name);
  endfunction


  //===================================
  // Setup for running the Unit Tests
  //===================================
  task setup();
    svunit_ut.setup();

    //-----------------------------------------
    // move the bus into the IDLE state
    // before each test
    //-----------------------------------------
    idle();

    //-----------------------------
    // then do a reset for the uut
    //-----------------------------
    hresetn = 0;
    repeat (8) @(posedge hclk);
    hresetn = 1;
  endtask


  //===================================
  // Here we deconstruct anything we 
  // need after running the Unit Tests
  //===================================
  task teardown();
    svunit_ut.teardown();
    /* Place Teardown Code Here */
  endtask


  //===================================
  // All tests are defined between the
  // SVUNIT_TESTS_BEGIN/END macros
  //
  // Each individual test must be
  // defined between `SVTEST(_NAME_)
  // `SVTEST_END
  //
  // i.e.
  //   `SVTEST(mytest)
  //     <test code>
  //   `SVTEST_END
  //===================================
  `SVUNIT_TESTS_BEGIN


    idle ();
    wait_for_n_clks (10); 
    `ifdef VW_GLS
    `else
      `include "test_Hreadycheck_A.sv"
      `include "test_addr_not_change_wait_check_A.sv"
      `include "test_at_reset_idle_and_okay_A.sv"
      `include "test_busy_nseq_undefined_length_bursts_A.sv"
      `include "test_busy_transfer_addr_not_change_check_A.sv"
      `include "test_busy_transfer_zero_wait_check_A.sv"
      `include "test_control_signal_check_A.sv"
      `include "test_control_signal_cons_burst_check_A.sv"
      `include "test_hresp_unchange_check_A.sv"
      `include "test_htrans_not_driven_busy_check_A.sv"
      `include "test_idle_okay_responce_check_A.sv"
      `include "test_idle_transfer_check_A.sv"
      `include "test_max_no_wait_check_A.sv"
      `include "test_nseq_seq_incr_wrap_burst_check_A.sv"
      `include "test_one_cycle_error_A.sv"
      `include "test_single_burst_check_A.sv"
      `include "test_single_nseq_check_A.sv"
      `include "test_slave_not_sel_A.sv"
      `include "test_slave_not_sel_okay_A.sv"
      `include "test_slave_responce_at_zero_cycle_A.sv"
      `include "test_two_cycle_error_A.sv"
      `include "test_valid_high_low_check_A.sv"
    `endif // VW_GLS


  `SVUNIT_TESTS_END


  //-------------------------------------------------------------------------------
  //
  // write ()
  //
  // Simple write method used in the unit tests. Includes options for back-to-back
  // writes and protocol errors on the hsel and hwrite.
  //
  //-------------------------------------------------------------------------------
  task write(logic [7:0] addr,
             logic [31:0] data,
             logic back2back = 0,
             logic setup_hsel = 1,
             logic setup_hwrite = 1);

    // if !back2back, insert an idle cycle before the write
    if (!back2back) begin
      @(negedge hclk);
      hsel = 0;
      henable = 0;
    end

    // this is the SETUP state where the hsel,
    // hwrite, haddr and hdata are set
    //
    // NOTE:
    //   setup_hsel == 0 for protocol errors on the hsel
    //   setup_hwrite == 0 for protocol errors on the hwrite
    @(negedge hclk);
    hsel = setup_hsel;
    hwrite = setup_hwrite;
    haddr = addr;
    hwdata = data;
    henable = 0;

    // this is the ENABLE state where the henable is asserted
    @(negedge hclk);
    hwrite = 1;
    henable = 1;
    hsel = 1;
  endtask


  //-------------------------------------------------------------------------------
  //
  // read ()
  //
  // Simple read method used in the unit tests. Includes options for back-to-back
  // reads.
  //
  //-------------------------------------------------------------------------------
  task read(logic [7:0] addr, output logic [31:0] data, input logic back2back = 0);

    // if !back2back, insert an idle cycle before the read
    if (!back2back) begin
      @(negedge hclk);
      hsel = 0;
      henable = 0;
    end

    // this is the SETUP state where the hsel, hwrite and haddr
    @(negedge hclk);
    hsel = 1;
    haddr = addr;
    henable = 0;
    hwrite = 0;

    // this is the ENABLE state where the henable is asserted
    @(negedge hclk);
    henable = 1;

    // the hrdata should be flopped after the subsequent posedge
    @(posedge hclk);
    #1 data = hrdata;
  endtask


  //-------------------------------------------------------------------------------
  //
  // idle ()
  //
  // Clear the all the inputs to the uut (i.e. move to the IDLE state)
  //
  //-------------------------------------------------------------------------------
  task idle();
    hsel = 0;
    henable = 0;
    hwrite = 0;
    haddr = 0;
    hwdata = 0;
    @(negedge hclk);
    @(negedge hclk);
  endtask

  initial begin
    $timeformat (-9, 3, " ns", 10);
    $dumpfile ("cip.vcd");
    $dumpvars();
    $display ("%m DUMP");
  end
  vw_go2uvm_sim_utils u_vw_go2uvm_sim_utils ();
endmodule : ahb_slave_unit_test

`include "af_ahb_cip.sv"


