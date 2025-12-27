


package uart_test_pkg;

	// import the UVM package
	import uvm_pkg::*; 

	//include the "uvm_macros.svh", "tb_defs.sv","write_xtn.sv", 
	//"agent_config.sv", "driver.sv",
	//"monitor.sv","sequencer.sv", 
	//"agent.sv", "agt_top.sv",
	//include "seqs.sv", "uart_test.sv" files

	

	`include "uvm_macros.svh"

	
	`include "agent_config.sv"
	`include "uart_reg.sv"
	`include "reg_block.sv"
	
	`include "uart_env_config.sv"
	
	`include "xtn.sv"
	`include "seqs.sv"
	`include "sequencer.sv"
	`include "driver.sv"
	`include "monitor.sv"

	`include "agent.sv"
	
	`include "uart_virtual_sequencer.sv"
	`include "uart_virtual_seqs.sv"
	  `include "uart_sb.sv"
	
	
	`include "uart_tb.sv"
	`include "uart_vtest_lib.sv"
	

endpackage