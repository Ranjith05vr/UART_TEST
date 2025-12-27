class uart_env_config extends uvm_object;

`uvm_object_utils(uart_env_config)

//------------------------------------------
// Data Members
//------------------------------------------
// Whether env analysis components are used:
bit has_functional_coverage = 0;
bit has_wagent_functional_coverage = 0;
bit has_scoreboard = 1;
// Whether the various agents are used:
bit has_agent = 1;

// Whether the virtual sequencer is used:
bit has_virtual_sequencer = 1;
// LAB :  Declare dynamic array of handles for the sub_components
// uart_wr_agent_config & uart_rd_agent_config as m_wr_agent_cfg
// & m_rd_agent_cfg
agent_config m_agent_cfg[];

// LAB :  Declare variable no_of_duts as int which can be set to the required dut value

int no_of_agents=2;
uart_reg_block regmodel;





//------------------------------------------
// Methods
//------------------------------------------
// Standard UVM Methods:
extern function new(string name = "uart_env_config");

endclass: uart_env_config
//-----------------  constructor new method  -------------------//

function uart_env_config::new(string name = "uart_env_config");
  super.new(name);
endfunction


