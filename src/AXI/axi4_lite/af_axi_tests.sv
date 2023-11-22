`timescale 1ns/1ns
`include "svunit_defines.svh"
//------------------------------------------------------------------------------
// AXI Standard Defines
//------------------------------------------------------------------------------
`include "Axi.v"
`include "slave.v"
`include "af_axi_cip.sv"
module axi4_lite_unit_test;

  string name = "axi_slave_ut";
  import svunit_pkg::svunit_testcase;
  svunit_testcase svunit_ut;
	
  parameter ADDR_WIDTH = 32;         // address bus width, default = 32-bit
  parameter DATA_WIDTH = 64;         // data bus width, default = 64-bit
  parameter ID_WIDTH = 4;          // (A|W|R|B)ID width
  // Select the size of the USER buses, default = 32-bit
  parameter AWUSER_WIDTH = 32; // width of the user AW sideband field
  parameter WUSER_WIDTH  = 32; // width of the user W  sideband field
  parameter BUSER_WIDTH  = 32; // width of the user B  sideband field
  parameter ARUSER_WIDTH = 32; // width of the user AR sideband field
  parameter RUSER_WIDTH  = 32; // width of the user R  sideband field

  // Write-interleave Depth of monitored slave interface
  parameter WDEPTH = 1;

  // Size of CAMs for storing outstanding read bursts, this should match or
  // exceed the number of outstanding read addresses accepted into the slave
  // interface
  parameter MAXRBURSTS = 16;

  // Size of CAMs for storing outstanding write bursts, this should match or
  // exceed the number of outstanding write bursts into the slave  interface
  parameter MAXWBURSTS = 16;

  parameter EXMON_WIDTH = 4;         // exclusive access width, default = 4-bit
  // Maximum number of cycles between VALID -> READY high before a warning is
  // generated
  parameter MAXWAITS = 16;
  parameter DATA_MAX   = DATA_WIDTH-1; // data max index
  parameter ADDR_MAX   = ADDR_WIDTH-1; // address max index
  parameter STRB_WIDTH = DATA_WIDTH/8; // WSTRB width
  parameter STRB_MAX   = STRB_WIDTH-1; // WSTRB max index
  parameter ID_MAX     = ID_WIDTH-1;   // ID max index
  parameter EXMON_MAX  = EXMON_WIDTH-1;       // EXMON max index
  parameter AWUSER_MAX = AWUSER_WIDTH-1; // AWUSER max index
  parameter  WUSER_MAX =  WUSER_WIDTH-1; // WUSER  max index
  parameter  BUSER_MAX =  BUSER_WIDTH-1; // BUSER  max index
  parameter ARUSER_MAX = ARUSER_WIDTH-1; // ARUSER max index
  parameter  RUSER_MAX =  RUSER_WIDTH-1; // RUSER  max index

   /*AUTOWIRE*/
   /*AUTOREG*/
   /*AUTOINPUT*/
   // Beginning of automatic inputs (from unused autoinst inputs)
   bit		ACLK;			// To u_AxiPC of AxiPC.v
   logic [ADDR_MAX:0]	ARADDR;			// To u_AxiPC of AxiPC.v
   logic [1:0]		ARBURST;		// To u_AxiPC of AxiPC.v
   logic [3:0]		ARCACHE;		// To u_AxiPC of AxiPC.v
   logic		ARESETn;		// To u_AxiPC of AxiPC.v
   logic [ID_MAX:0]	ARID;			// To u_AxiPC of AxiPC.v
   logic [3:0]		ARLEN;			// To u_AxiPC of AxiPC.v
   logic [1:0]		ARLOCK;			// To u_AxiPC of AxiPC.v
   logic [2:0]		ARPROT;			// To u_AxiPC of AxiPC.v
   logic		ARREADY;		// To u_AxiPC of AxiPC.v
   logic [2:0]		ARSIZE;			// To u_AxiPC of AxiPC.v
   logic [ARUSER_MAX:0]	ARUSER;			// To u_AxiPC of AxiPC.v
   logic		ARVALID;		// To u_AxiPC of AxiPC.v
   logic [ADDR_MAX:0]	AWADDR;			// To u_AxiPC of AxiPC.v
   logic [1:0]		AWBURST;		// To u_AxiPC of AxiPC.v
   logic [3:0]		AWCACHE;		// To u_AxiPC of AxiPC.v
   logic [ID_MAX:0]	AWID;			// To u_AxiPC of AxiPC.v
   logic [3:0]		AWLEN;			// To u_AxiPC of AxiPC.v
   logic [1:0]		AWLOCK;			// To u_AxiPC of AxiPC.v
   logic [2:0]		AWPROT;			// To u_AxiPC of AxiPC.v
   logic		AWREADY;		// To u_AxiPC of AxiPC.v
   logic [2:0]		AWSIZE;			// To u_AxiPC of AxiPC.v
   logic [AWUSER_MAX:0]	AWUSER;			// To u_AxiPC of AxiPC.v
   logic		AWVALID;		// To u_AxiPC of AxiPC.v
   logic [ID_MAX:0]	BID;			// To u_AxiPC of AxiPC.v
   logic		BREADY;			// To u_AxiPC of AxiPC.v
   logic [1:0]		BRESP;			// To u_AxiPC of AxiPC.v
   logic [BUSER_MAX:0]	BUSER;			// To u_AxiPC of AxiPC.v
   logic		BVALID;			// To u_AxiPC of AxiPC.v
   logic		CACTIVE;		// To u_AxiPC of AxiPC.v
   logic		CSYSACK;		// To u_AxiPC of AxiPC.v
   logic		CSYSREQ;		// To u_AxiPC of AxiPC.v
   logic [DATA_MAX:0]	RDATA;			// To u_AxiPC of AxiPC.v
   logic [ID_MAX:0]	RID;			// To u_AxiPC of AxiPC.v
   logic		RLAST;			// To u_AxiPC of AxiPC.v
   logic		RREADY;			// To u_AxiPC of AxiPC.v
   logic [1:0]		RRESP;			// To u_AxiPC of AxiPC.v
   logic [RUSER_MAX:0]	RUSER;			// To u_AxiPC of AxiPC.v
   logic		RVALID;			// To u_AxiPC of AxiPC.v
   logic [DATA_MAX:0]	WDATA;			// To u_AxiPC of AxiPC.v
   logic [ID_MAX:0]	WID;			// To u_AxiPC of AxiPC.v
   logic		WLAST;			// To u_AxiPC of AxiPC.v
   logic		WREADY;			// To u_AxiPC of AxiPC.v
   logic [STRB_MAX:0]	WSTRB;			// To u_AxiPC of AxiPC.v
   logic [WUSER_MAX:0]	WUSER;			// To u_AxiPC of AxiPC.v
   logic		WVALID;			// To u_AxiPC of AxiPC.v
   // End of automatics
 
 
   AxiPC u_AxiPC (/*AUTOINST*/
		  // Inputs
		  .ACLK			(ACLK),
		  .ARESETn		(ARESETn),
		  .AWID			(AWID[ID_MAX:0]),
		  .AWADDR		(AWADDR[ADDR_MAX:0]),
		  .AWLEN		(AWLEN[3:0]),
		  .AWSIZE		(AWSIZE[2:0]),
		  .AWBURST		(AWBURST[1:0]),
		  .AWCACHE		(AWCACHE[3:0]),
		  .AWPROT		(AWPROT[2:0]),
		  .AWLOCK		(AWLOCK[1:0]),
		  .AWUSER		(AWUSER[AWUSER_MAX:0]),
		  .AWVALID		(AWVALID),
		  .AWREADY		(AWREADY),
		  .WID			(WID[ID_MAX:0]),
		  .WDATA		(WDATA[DATA_MAX:0]),
		  .WSTRB		(WSTRB[STRB_MAX:0]),
		  .WUSER		(WUSER[WUSER_MAX:0]),
		  .WLAST		(WLAST),
		  .WVALID		(WVALID),
		  .WREADY		(WREADY),
		  .BID			(BID[ID_MAX:0]),
		  .BRESP		(BRESP[1:0]),
		  .BUSER		(BUSER[BUSER_MAX:0]),
		  .BVALID		(BVALID),
		  .BREADY		(BREADY),
		  .ARID			(ARID[ID_MAX:0]),
		  .ARADDR		(ARADDR[ADDR_MAX:0]),
		  .ARLEN		(ARLEN[3:0]),
		  .ARSIZE		(ARSIZE[2:0]),
		  .ARBURST		(ARBURST[1:0]),
		  .ARCACHE		(ARCACHE[3:0]),
		  .ARPROT		(ARPROT[2:0]),
		  .ARLOCK		(ARLOCK[1:0]),
		  .ARUSER		(ARUSER[ARUSER_MAX:0]),
		  .ARVALID		(ARVALID),
		  .ARREADY		(ARREADY),
		  .RID			(RID[ID_MAX:0]),
		  .RDATA		(RDATA[DATA_MAX:0]),
		  .RRESP		(RRESP[1:0]),
		  .RUSER		(RUSER[RUSER_MAX:0]),
		  .RLAST		(RLAST),
		  .RVALID		(RVALID),
		  .RREADY		(RREADY),
		  .CACTIVE		(CACTIVE),
		  .CSYSREQ		(CSYSREQ),
		  .CSYSACK		(CSYSACK));
   
    default clocking dcb @(posedge ACLK);
    endclocking : dcb

    always #10 ACLK = ~ACLK;
	
    task wait_for_n_clks (input int num_clk = 1);
    repeat (num_clk) begin
      @ (negedge ACLK);
    end
  endtask : wait_for_n_clks	
  
  function void build();
    svunit_ut = new(name);
  endfunction

 
  //===================================
  // Setup for running the Unit Tests
  //===================================
  task setup();
    svunit_ut.setup();

    //-----------------------------
    // then do a reset for the uut
    //-----------------------------
    ARESETn = 0;
    repeat (8) @(posedge ACLK);
    ARESETn = 1;
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
    `g2u_display ("Start..")
    wait_for_n_clks (10);  

  
/*
  `include "test_AXI_ERRM_AWID_STABLE.sv"
  `include "test_AXI_ERRM_AWID_VALID.sv"
  `include "test_AXI_ERRM_AWADDR_STABLE.sv"
  `include "test_AXI_ERRM_AWADDR_X.sv" 
  `include "test_AXI_ERRM_WRAP_LENGTH.sv"
  `include "test_AXI_ERRM_AWLEN_STABLE.sv"
  `include "test_AXI_ERRM_AWLEN_X.sv"
  `include "test_AXI_ERRM_AWSIZE_STABLE.sv" 
  `include "test_AXI_ERRM_AWBURST.sv" 
  `include "test_AXI_ERRM_AWBURST_STABLE.sv"
  `include "test_AXI_ERRM_AWBURST_X.sv"
  `include "test_AXI_ERRM_AWLOCK.sv"        
 */ 

    
/*
  `include "test_AXI_ERRM_WID_STABLE.sv"
  `include "test_AXI_ERRM_WID_X.sv"   
  `include "test_AXI_ERRM_WDATA_STABLE.sv" 
  `include "test_AXI_ERRM_WDATA_X.sv"
  `include "test_AXI_ERRM_WSTRB_STABLE.sv"
  `include "test_AXI_ERRM_WSTRB_X.sv"
  `include "test_AXI_ERRM_WLAST_STABLE.sv"
  `include "test_AXI_ERRM_WLAST_X.sv"
  `include "test_AXI_ERRM_WVALID_RESET.sv"
  `include "test_AXI_ERRM_WVALID_STABLE.sv"  
  `include "test_AXI_ERRM_WVALID_X.sv" 
  `include "test_AXI_ERRS_WREADY_X.sv" 
*/
 


/*
  `include "test_AXI_ERRS_BID_STABLE.sv"
  `include "test_AXI_ERRS_BID_X.sv" 
  `include "test_AXI_ERRM_BREADY_X.sv"
  `include "test_AXI_ERRS_BVALID_STABLE.sv"
  `include "test_AXI_ERRS_BRESP_STABLE.sv"
  `include "test_AXI_ERRS_BRESP_X.sv" 
  `include "test_AXI_ERRS_BVALID_RESET.sv"
*/

/*
  `include "test_AXI_ERRM_ARID_STABLE.sv"
  `include "test_AXI_ERRM_ARID_X.sv" 
  `include "test_AXI_ERRM_ARADDR_STABLE.sv"
  `include "test_AXI_ERRM_ARADDR_X.sv" 
  `include "test_AXI_ERRM_ARLEN_STABLE.sv"
  `include "test_AXI_ERRM_ARLEN_X.sv"
  `include "test_AXI_ERRM_ARSIZE_STABLE.sv"
  `include "test_AXI_ERRM_ARSIZE_X.sv"  
  `include "test_AXI_ERRM_ARBURST_STABLE.sv"
  `include "test_AXI_ERRM_ARBURST.sv"
  `include "test_AXI_ERRM_ARBURST_X.sv" 
  `include "test_AXI_ERRM_ARADDR_WRAP_ALIGN.sv" */


/*
   `include "test_AXI_ERRS_RID_STABLE.sv"
   `include "test_AXI_ERRS_RID_X.sv"
   `include "test_AXI_ERRS_RVALID_RESET.sv"
   `include "test_AXI_ERRS_RDATA_STABLE.sv"
   `include "test_AXI_ERRS_RRESP_STABLE.sv"
   `include "test_AXI_ERRS_RRES_X.sv"
   `include "test_AXI_ERRS_RLAST_STABLE.sv"
   `include "test_AXI_ERRS_RLAST_X.sv"
   `include "test_AXI_ERRS_RVALID_X.sv"	
   `include "test_AXI_ERRS_RVALID_STABLE.sv"	
   `include "test_AXI_ERRM_RREADY_X.sv"	

*/
	
  `SVUNIT_TESTS_END

  initial begin
    $timeformat (-9, 3, " ns", 10);
    $dumpfile ("cip.vcd");
    $dumpvars();
    $display ("%m DUMP");
  end
  vw_go2uvm_sim_utils u_vw_go2uvm_sim_utils ();

endmodule

