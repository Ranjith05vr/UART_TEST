
class uart_virtual_sequencer extends uvm_sequencer #(uvm_sequence_item) ;
   
	`uvm_component_utils(uart_virtual_sequencer)
	sequencer seqrh[];
  	uart_env_config m_cfg;
	
 	extern function new(string name = "uart_virtual_sequencer",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	endclass


	function uart_virtual_sequencer::new(string name="uart_virtual_sequencer",uvm_component parent);
		super.new(name,parent);
	endfunction
	
	function void uart_virtual_sequencer::build_phase(uvm_phase phase); 
	  if(!uvm_config_db #(uart_env_config)::get(this,"","uart_env_config",m_cfg))
		`uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?")
    	super.build_phase(phase);
		seqrh = new[m_cfg.no_of_agents];    		
	endfunction
