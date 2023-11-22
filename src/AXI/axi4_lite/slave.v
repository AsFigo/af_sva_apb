//AXI4-Lite slave

//`timescale 1ns/1ns
`define ADDR_WIDTH 32
`define DATA_WIDTH 32
`define MEMORY_DEPTH 64 
`define CHANNEL_LEN 32

`define OKAY 2'b00
`define SLVERR 2'b10
`define DECERR 2'b11
module slave (   
               output reg                      AWREADY,       
               output reg                      WREADY,         
               output reg [ 1 : 0 ]            BRESP,          
               output reg                      BVALID,         
               output reg                      ARREADY,        
               output reg [ `DATA_WIDTH - 1 : 0 ] RDATA,          
               output reg [ 1 : 0 ]            RRESP,          
               output reg                      RVALID,         
 
               input             	       ACLK,
               input                           ARESETn,
               input  [ `ADDR_WIDTH - 1 : 0 ]  AWADDR,            
               input                           AWVALID,           
               input  [ 2 : 0 ]                AWPROT,            
               input  [ `DATA_WIDTH - 1 : 0 ]  WDATA,             
               input  [ 3 : 0 ]                WSTRB,             
               input                           WVALID,            
               input                           BREADY,            
               input  [ `ADDR_WIDTH - 1 : 0 ]  ARADDR,            
               input  [ 2 : 0 ]                ARPROT,            
               input                           ARVALID,           
               input                           RREADY             
             );
  
  reg  [ `DATA_WIDTH - 1 : 0 ]  slave_memory   [ 0 : `MEMORY_DEPTH - 1 ];
  reg  [ `ADDR_WIDTH - 1 : 0 ]  awaddr_temp;
  reg  [ `ADDR_WIDTH - 1 : 0 ]  araddr_temp;
  reg  write_tran_complete = 1'b1;
  reg  write_data_loop = 1'b0;
  reg  read_data_loop = 1'b0;
  reg  read_tran_complete = 1'b1;

  integer counter = 0;              
  integer time_out; 



// Write Transaction  

  always @ ( posedge ACLK ) begin 
    if ( ! ARESETn ) begin 
      awaddr_temp <= 32'd0;
      AWREADY <= 1'b1; 
      WREADY  <= 1'b1;
      BRESP   <= 2'bx;
      BVALID  <= 1'b0;
      write_tran_complete <= 1'b1; 
      write_data_loop <= 1'b0;
      time_out <= 1'b0;
    end 

    else begin
      if ( AWVALID ) begin
        	if ( write_tran_complete == 1'b1 ) begin 
         		 AWREADY <= 1'b1;
          		 write_tran_complete <= 1'b0;
		          write_data_loop = 1'b1;
		          $display ( "tran complete set signal loop" );
        		end 
        	else begin
          		AWREADY <= 1'b0;
       			 end 
                end
     
      else begin
        AWREADY <= 1'b1;
           end 
      if ( AWVALID == 1'b1 && AWREADY == 1'b1 ) begin
        awaddr_temp <= AWADDR;
        $display ( "write addr is accessed" );
                                               end  
      else begin
        awaddr_temp <= awaddr_temp;
           end 
      if ( write_data_loop == 1'b1 ) begin
        if ( WVALID ) begin
          WREADY <= 1'b1;
          if ( WVALID && WREADY ) begin 
            if ( counter != `MEMORY_DEPTH - 1 && ( slave_memory [ awaddr_temp ] === 32'dx || slave_memory [ awaddr_temp ] == 32'd0 )) begin
              slave_memory [ awaddr_temp ] <= WDATA;
	      BVALID <= 1'b1;
              BRESP = `OKAY;
              counter     <= counter + 1;
              write_tran_complete <= 1'b1;
              write_data_loop   <= 1'b0;
              time_out    <= 0;
              awaddr_temp <= 32'd0;
            end
            else begin
              BRESP  <= `SLVERR; 
	      BVALID <= 1'b1;
              write_tran_complete <= 1'b1;
              write_data_loop <= 1'b0;
              $display ( " error in the slave " );
            end 
          end
          else begin
            WREADY <= 1'b1;
            $display ( "slave is not ready " );
          end     
        end
        else begin
          time_out <= time_out + 1;
          WREADY   <= 1'b1;
          if ( time_out == 1 ) begin
            BRESP <= `SLVERR;
	    BVALID <= 1'b1;
            write_tran_complete <= 1'b1;
            write_data_loop <= 1'b0;
            awaddr_temp <= 32'd0;
            time_out <= 0;
          end
          else begin
            BVALID <= 1'b0;
          end 
        end
      end
      else begin
        AWREADY <= 1'b1;
        WREADY  <= 1'b1;
      end 
    end
  end

  always @ ( posedge ACLK ) begin

    if ( !ARESETn ) begin 
      ARREADY <= 1'b1;
      RRESP   <= 2'bx;
      RVALID  <= 1'b0;
      read_tran_complete <= 1'b1;  
    end 
    else 
    begin
      if ( ARVALID ) begin
        if ( read_tran_complete )  begin
          ARREADY = 1'b1;
          read_tran_complete <= 1'b0;
          read_data_loop <= 1'b1;
        end 
        else begin
          ARREADY <= 1'b0;
        end
      end
      else begin
        ARREADY <= 1'b1;
      end
      if ( ARVALID && ARREADY ) begin
        araddr_temp <= ARADDR; 
      end
      else begin
        araddr_temp <= araddr_temp;
      end
      if ( read_data_loop ) begin
        if (slave_memory [ araddr_temp ] !== 32'dx && slave_memory [ araddr_temp ] != 32'd0 ) begin

          RVALID  <= 1'b1;
          RDATA   <= slave_memory [ araddr_temp ];
          RRESP   <= `OKAY;
          //counter <= counter - 1;
          //slave_memory [ araddr_temp ] <= 32'd0;
          read_tran_complete <= 1'b1;
          read_data_loop <= 1'b0;
          araddr_temp <= 32'd0;
         end
        else 
	begin
          RRESP  <= `SLVERR;
          read_tran_complete <= 1'b1;
          read_data_loop     <= 1'b0;
          araddr_temp <= 32'd0;
        end
      end
      else begin
        ARREADY <= 1'b1;
      end
      if ( RVALID && RREADY ) begin
        RVALID <= 1'b0;
      end
      else begin
        ARREADY <= 1'b1;
      end
    end
  end      
endmodule
