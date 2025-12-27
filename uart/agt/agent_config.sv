//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------

// extend agent_config from uvm_object

class agent_config extends uvm_object;


	// UVM Factory Registration Macro

	`uvm_object_utils(agent_config)
	virtual uart_if vif;

	
	uvm_active_passive_enum is_active = UVM_ACTIVE;

	extern function new(string name = "agent_config");

endclass: agent_config

//-----------------  constructor new method  -------------------//
function agent_config::new(string name = "agent_config");
  super.new(name);
endfunction
