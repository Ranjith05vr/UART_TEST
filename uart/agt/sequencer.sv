//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------


// Extend sequencer from uvm_sequencer parameterized by write_xtn
class sequencer extends uvm_sequencer #(uart_xtn);

	// Factory registration using `uvm_component_utils
	`uvm_component_utils(sequencer)

	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Standard UVM Methods:
	extern function new(string name = "sequencer",uvm_component parent);
endclass

//-----------------  constructor new method  -------------------//

function sequencer::new(string name="sequencer",uvm_component parent);
	super.new(name,parent);
endfunction
