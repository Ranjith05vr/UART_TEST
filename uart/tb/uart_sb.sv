class uart_sb extends uvm_scoreboard;

  `uvm_component_utils(uart_sb)
  
uart_env_config m_cfg;
uvm_tlm_analysis_fifo#(uart_xtn) fifo_h[];
uart_xtn uart1 , uart2;
uart_xtn cov_data;
uart_reg_block regmodel;
uvm_status_e status;
bit[7:0] reg_lcr, reg_ier, reg_iir, reg_fcr, reg_mcr, reg_lsr;

int thr1size , thr2size , rbr1size , rbr2size;

covergroup apb_signals_cov;
		option.per_instance=1;
		
		ADDRESS : coverpoint cov_data.Paddr {bins add ={[0:255]};}
		WR_ENB : coverpoint cov_data.Pwrite {bins add ={[0:255]};}
endgroup

	
covergroup uart_lcr_cov;
		option.per_instance=1;
	CHAR_SIZE: coverpoint cov_data.lcr[1:0] {bins five={2'b00};
												bins eight={2'b11};}
	STOP_BIT: coverpoint cov_data.lcr[2] {bins one={1'b0};
												bins more={1'b1};}	
	PARITY: coverpoint cov_data.lcr[3] {bins no_parity={1'b0};
												bins parity_en={1'b1};}	
	EV_ODD_PARITY: coverpoint cov_data.lcr[4] {bins odd_parity={1'b0};bins even_parity={1'b1};}			
endgroup


covergroup uart_ier_cov;
	option.per_instance=1;
	
	RCVD_INT: coverpoint cov_data.ier[0] {bins dis={1'b0};
												bins en={1'b1};}
	THRE_INT: coverpoint cov_data.ier[1] {bins dis={1'b0};
												bins en={1'b1};}

	LSR_INT: coverpoint cov_data.ier[2] {bins dis={1'b0};
												bins en={1'b1};}

	IER_RST: coverpoint cov_data.ier[7:0] {bins ier_rst={8'd0};}
endgroup



covergroup uart_fcr_cov;
	option.per_instance=1;
	
	RFIF0: coverpoint cov_data.fcr[1] {bins dis = {1'b0};
										bins clr = {1'b1};}

	TFIF0: coverpoint cov_data.fcr[2] {bins dis = {1'b0};
										bins clr = {1'b1};}
	TRG_LVL: coverpoint cov_data.fcr[7:6] {bins one = {2'b00};
										bins eight = {2'b10};
										bins fourteen = {2'b11};}
endgroup



covergroup uart_mcr_cov;
	option.per_instance=1;
	
	LB: coverpoint cov_data.mcr[4]{bins dis ={1'b0};
									bins en = {1'b1};}
	
	MCR_RST: coverpoint cov_data.mcr[7:0]{bins lcr_rst={8'd0};}
	
endgroup	
	


covergroup uart_iir_cov;
	option.per_instance=1;
	
	IIR: coverpoint cov_data.iir[3:1] {bins lsr ={3'b011};
										bins rdf ={3'b010};
										bins ti_o ={3'b110};
												}
endgroup

covergroup uart_lsr_cov;
		option.per_instance=1;
		
		DATA_READY: coverpoint cov_data.lsr[0] {bins fifoempty={1'b0};
												bins datarcvd = {1'b1};}
												
		OVER_RUN: coverpoint cov_data.lsr[1] {bins nooverrun={1'b0};
												bins overrun = {1'b1};}												

		PARITY_ERR: coverpoint cov_data.lsr[2] {bins noparityerr={1'b0};
												bins parityerr = {1'b1};}	
												
		FRAME_ERR: coverpoint cov_data.lsr[3] {bins frameerr={1'b0};}	
												
		BRAKE_ERR: coverpoint cov_data.lsr[4] {bins nobreakint={1'b0};
												bins breakint={1'b1};}	

		b1: coverpoint cov_data.lsr[5] {bins a1 = {1'b0};
										bins a2 = {1'b1};}
endgroup
												
function new(string name="scoreboard", uvm_component parent);
	super.new(name, parent);
	apb_signals_cov=new();
	uart_lcr_cov=new();
	uart_ier_cov=new();
	uart_fcr_cov=new();
	uart_mcr_cov=new();
	uart_iir_cov=new();
	uart_lsr_cov=new();
endfunction

function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(uart_env_config)::get(this,"","uart_env_config", m_cfg))
		`uvm_fatal("CONFIG","Cannot get config")
		regmodel =m_cfg.regmodel;
		fifo_h=new[2];
		
		foreach(fifo_h[i]) fifo_h[i] =new($sformatf("fifo_h[%0d]",i),this);
endfunction

task run_phase(uvm_phase phase);
	super.run_phase(phase);

forever
	fork
		begin
			fifo_h[0].get(uart1);
			uart1.print;
			thr1size=uart1.thr.size;
			rbr1size=uart1.rbr.size;
			$display("@@@@@@@@@@@@@@@@@@@@@@@%d", thr1size);
			$display("@@@@@@@@@@@@@@@@@@@@@@@%d", rbr1size);
			//`uvm_info("SCOREBOARD", $sformatf("printing from scoreboard of UART1\n%s", uart1.sprint()), UVM_LOW)
			
			cov_data=uart1;
			apb_signals_cov.sample();
			uart_lcr_cov.sample();
			uart_ier_cov.sample();
			uart_fcr_cov.sample();
			uart_mcr_cov.sample();
			uart_iir_cov.sample();
			uart_lsr_cov.sample();
		end
		
		begin
			fifo_h[1].get(uart2);
			uart2.print;
			thr2size=uart2.thr.size;
			rbr2size=uart2.rbr.size;
			$display("@@@@@@@@@@@@@@@@@@@@@@@%d", thr2size);
			$display("@@@@@@@@@@@@@@@@@@@@@@@%d", rbr2size);
			//`uvm_info("SCOREBOARD", $sformatf("printing from scoreboard of UART2\n%s", uart2.sprint()), UVM_LOW)
			
			cov_data=uart2;
			apb_signals_cov.sample();
			uart_lcr_cov.sample();
			uart_ier_cov.sample();
			uart_fcr_cov.sample();
			uart_mcr_cov.sample();
			uart_iir_cov.sample();
			uart_lsr_cov.sample();
			
			ral;
		end			
	join
endtask


function void check_phase(uvm_phase phase);

  // -------------------------
  // Debug prints
  // -------------------------
  $display("thr1 size = %0d", uart1.thr.size());
  $display("thr2 size = %0d", uart2.thr.size());
  $display("rbr1 size = %0d", uart1.rbr.size());
  $display("rbr2 size = %0d", uart2.rbr.size());

  $display("Values sent by UART1 (THR) = %p", uart1.thr);
  $display("Values sent by UART2 (THR) = %p", uart2.thr);
  $display("Values received by UART1 (RBR) = %p", uart1.rbr);
  $display("Values received by UART2 (RBR) = %p", uart2.rbr);


  if ((uart1.mcr[4] == 1'b1) && (uart2.mcr[4] == 1'b1)) begin

    if ((uart1.thr == uart1.rbr) && (uart2.thr == uart2.rbr))
      `uvm_info(get_type_name(), "\n\n\n***********LOOPBACK TEST PASSED***********\n\n\n", UVM_LOW)
    else
      `uvm_error(get_type_name(), "\n\n\n***********LOOPBACK TEST FAILED***********\n\n\n")

  end


  else if ((uart1.rbr.size() != 0) && (uart2.rbr.size() != 0)) begin

    if ((uart1.thr == uart2.rbr) && (uart2.thr == uart1.rbr))
      `uvm_info(get_type_name(), "\n\n\n***********FULL-DUPLEX TEST PASSED***********\n\n\n", UVM_LOW)
    else
      `uvm_error(get_type_name(), "\n\n\n***********FULL-DUPLEX TEST FAILED***********\n\n\n")

  end


  else if ((uart1.rbr.size() != 0) ^ (uart2.rbr.size() != 0)) begin

    if ((uart1.thr == uart2.rbr) || (uart2.thr == uart1.rbr))
      `uvm_info(get_type_name(), "\n\n\n***********HALF-DUPLEX TEST PASSED***********\n\n\n", UVM_LOW)
    else
      `uvm_error(get_type_name(), "\n\n\n***********HALF-DUPLEX TEST FAILED***********\n\n\n")

  end


  else begin
    `uvm_warning(get_type_name(),
      "No UART received data (both RBR empty) — check stimulus or timing")
  end


  if ((uart1.iir[3:1] == 3'b011) || (uart2.iir[3:1] == 3'b011)) begin

    if ((uart1.lsr[1] == 1'b1) || (uart2.lsr[1] == 1'b1))
      `uvm_info(get_type_name(), "\n\n\n***********OVERRUN ERROR DETECTED***********\n\n\n", UVM_LOW)

    if ((uart1.lsr[2] == 1'b1) || (uart2.lsr[2] == 1'b1))
      `uvm_info(get_type_name(), "\n\n\n***********PARITY ERROR DETECTED***********\n\n\n", UVM_LOW)

    if ((uart1.lsr[3] == 1'b1) || (uart2.lsr[3] == 1'b1))
      `uvm_info(get_type_name(), "\n\n\n***********FRAMING ERROR DETECTED***********\n\n\n", UVM_LOW)

    if ((uart1.lsr[4] == 1'b1) || (uart2.lsr[4] == 1'b1))
      `uvm_info(get_type_name(), "\n\n\n***********BREAK ERROR DETECTED***********\n\n\n", UVM_LOW)

  end

  if ((uart1.iir[3:1] == 3'b110) || (uart2.iir[3:1] == 3'b110))
    `uvm_info(get_type_name(), "\n\n\n***********TIMEOUT ERROR DETECTED***********\n\n\n", UVM_LOW)

  if ((uart1.iir[3:1] == 3'b001) || (uart2.iir[3:1] == 3'b001))
    `uvm_info(get_type_name(), "\n\n\n***********THR EMPTY INTERUPT DETECTED***********\n\n\n", UVM_LOW)

endfunction


task ral;
  // LCR
  regmodel.lcr.read(status, reg_lcr, UVM_BACKDOOR, .map(regmodel.default_map));
  if(uart1.lcr==reg_lcr) begin `uvm_info("REG_COMP", "LCR COMP SUCCESS", UVM_LOW) end else begin `uvm_error("REG_COMP", "LCR COMP FAILED") end

  // IER
  regmodel.ier.read(status, reg_ier, UVM_BACKDOOR, .map(regmodel.default_map));
  if(uart1.ier==reg_ier) begin `uvm_info("REG_COMP", "IER COMP SUCCESS", UVM_LOW) end else begin `uvm_error("REG_COMP", "IER COMP FAILED") end

  // IIR
  regmodel.iir.read(status, reg_iir, UVM_BACKDOOR, .map(regmodel.default_map));
	 if((uart1.iir[3:0] == 4'h1) || (uart1.iir[3:0] inside {4'h0,4'h2,4'h4,4'h6,4'hC})) begin
	  `uvm_info("REG_COMP", "IIR VALID CODE", UVM_LOW)
	end else begin
	  `uvm_warning("REG_COMP", $sformatf("IIR INVALID: %h", uart1.iir))
	end
  
  // FCR
  regmodel.fcr.read(status, reg_fcr, UVM_BACKDOOR, .map(regmodel.default_map));
  if(uart1.fcr==reg_fcr) begin `uvm_info("REG_COMP", "FCR COMP SUCCESS", UVM_LOW) end else begin `uvm_info("REG_COMP", "FCR COMP FAILED",UVM_LOW) end

  // MCR
  regmodel.mcr.read(status, reg_mcr, UVM_BACKDOOR, .map(regmodel.default_map));
  if(uart1.mcr==reg_mcr) begin `uvm_info("REG_COMP", "MCR COMP SUCCESS", UVM_LOW) end else begin `uvm_error("REG_COMP", "MCR COMP FAILED") end

  // LSR
  regmodel.lsr.read(status, reg_lsr, UVM_BACKDOOR, .map(regmodel.default_map));
  if(uart1.lsr==reg_lsr) begin `uvm_info("REG_COMP", "LSR COMP SUCCESS", UVM_LOW) end else begin `uvm_error("REG_COMP", "LSR COMP FAILED") end
endtask



endclass