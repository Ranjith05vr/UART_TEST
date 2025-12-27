
class uart_base_test extends uvm_test;
  `uvm_component_utils(uart_base_test)

  uart_tb         uart_envh;
  uart_env_config m_tb_cfg;

  agent_config    m_cfg[];

  int no_of_agents = 2;
  int has_agent    = 1;
  uart_reg_block regmodel;

  function new(string name = "uart_base_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction



  function void config_uart();
    if (has_agent) begin
      m_cfg = new[no_of_agents];
      foreach (m_cfg[i]) begin
        m_cfg[i] = agent_config::type_id::create($sformatf("m_cfg[%0d]", i));
        if (m_cfg[i] == null) begin
          `uvm_fatal("CFG_CREATE", $sformatf("Failed to create agent_config[%0d]", i))
        end
    if (!uvm_config_db#(virtual uart_if)::get(this, "", $sformatf("vif%0d", i + 1), m_cfg[i].vif))
      `uvm_fatal("UART_TEST", "GET failed")

        m_cfg[i].is_active = UVM_ACTIVE;
        m_tb_cfg.m_agent_cfg[i] = m_cfg[i];
      end
    end


    m_tb_cfg.no_of_agents = no_of_agents;
    m_tb_cfg.has_agent    = has_agent;
  endfunction : config_uart


 
  function void build_phase(uvm_phase phase);
    m_tb_cfg = uart_env_config::type_id::create("m_tb_cfg");
    if (m_tb_cfg == null) begin
      `uvm_fatal("TB_CFG", "Failed to create uart_env_config via factory")
    end


    if (has_agent) begin
      m_tb_cfg.m_agent_cfg = new[no_of_agents];
    end

   
    config_uart();  
    uvm_config_db#(uart_env_config)::set(this, "*", "uart_env_config", m_tb_cfg);
    super.build_phase(phase);
	regmodel=uart_reg_block::type_id::create("regmodel");
	regmodel.build();
	m_tb_cfg.regmodel=this.regmodel;
    uart_envh = uart_tb::type_id::create("uart_envh", this);


  endfunction : build_phase

endclass : uart_base_test




class full_duplex_test extends uart_base_test;
  `uvm_component_utils(full_duplex_test)
  
  full_duplex_v_seq vseqh;
  
   	extern function new(string name = "full_duplex_test" , uvm_component parent);
    extern function void end_of_elaboration_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
endclass

function full_duplex_test::new(string name = "full_duplex_test" , uvm_component parent);
	super.new(name,parent);
endfunction


function void full_duplex_test::end_of_elaboration_phase(uvm_phase phase);
	uvm_top.print_topology();
endfunction



task full_duplex_test::run_phase(uvm_phase phase);

	phase.raise_objection(this);
 

	vseqh = full_duplex_v_seq::type_id::create("vseqh");
	vseqh.start(uart_envh.vseqrh);
	#50;
	phase.drop_objection(this);
  
endtask   


class half_duplex_test extends uart_base_test;
  `uvm_component_utils(half_duplex_test)
  
  half_duplex_v_seq vseqh;
  
   	extern function new(string name = "half_duplex_test" , uvm_component parent);
    extern function void end_of_elaboration_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
endclass

function half_duplex_test::new(string name = "half_duplex_test" , uvm_component parent);
	super.new(name,parent);
endfunction


function void half_duplex_test::end_of_elaboration_phase(uvm_phase phase);
	uvm_top.print_topology();
endfunction



task half_duplex_test::run_phase(uvm_phase phase);

	phase.raise_objection(this);
 

	vseqh = half_duplex_v_seq::type_id::create("vseqh");
	vseqh.start(uart_envh.vseqrh);
	#50;
	phase.drop_objection(this);
  
endtask   


class loopback_test extends uart_base_test;
  `uvm_component_utils(loopback_test)
  
  loopback_v_seq vseqh;
  
   	extern function new(string name = "loopback_test" , uvm_component parent);
    extern function void end_of_elaboration_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
endclass

function loopback_test::new(string name = "loopback_test" , uvm_component parent);
	super.new(name,parent);
endfunction


function void loopback_test::end_of_elaboration_phase(uvm_phase phase);
	uvm_top.print_topology();
endfunction



task loopback_test::run_phase(uvm_phase phase);

	phase.raise_objection(this);
 

	vseqh = loopback_v_seq::type_id::create("vseqh");
	vseqh.start(uart_envh.vseqrh);
	#50;
	phase.drop_objection(this);
  
endtask   


class parity_test extends uart_base_test;
  `uvm_component_utils(parity_test)
  
  parity_v_seq vseqh;
  
   	extern function new(string name = "parity_test" , uvm_component parent);
    extern function void end_of_elaboration_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
endclass

function parity_test::new(string name = "parity_test" , uvm_component parent);
	super.new(name,parent);
endfunction


function void parity_test::end_of_elaboration_phase(uvm_phase phase);
	uvm_top.print_topology();
endfunction



task parity_test::run_phase(uvm_phase phase);

	phase.raise_objection(this);
 

	vseqh = parity_v_seq::type_id::create("vseqh");
	vseqh.start(uart_envh.vseqrh);
	#50;
	phase.drop_objection(this);
  
endtask 


class break_test extends uart_base_test;
  `uvm_component_utils(break_test)
  
  break_v_seq vseqh;
  
   	extern function new(string name = "break_test" , uvm_component parent);
    extern function void end_of_elaboration_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
endclass

function break_test::new(string name = "break_test" , uvm_component parent);
	super.new(name,parent);
endfunction


function void break_test::end_of_elaboration_phase(uvm_phase phase);
	uvm_top.print_topology();
endfunction



task break_test::run_phase(uvm_phase phase);

	phase.raise_objection(this);
 

	vseqh = break_v_seq::type_id::create("vseqh");
	vseqh.start(uart_envh.vseqrh);
	#50;
	phase.drop_objection(this);
  
endtask 




class overrun_test extends uart_base_test;
  `uvm_component_utils(overrun_test)
  
  overrun_v_seq vseqh;
  
   	extern function new(string name = "overrun_test" , uvm_component parent);
    extern function void end_of_elaboration_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
endclass

function overrun_test::new(string name = "overrun_test" , uvm_component parent);
	super.new(name,parent);
endfunction


function void overrun_test::end_of_elaboration_phase(uvm_phase phase);
	uvm_top.print_topology();
endfunction



task overrun_test::run_phase(uvm_phase phase);

	phase.raise_objection(this);
 

	vseqh = overrun_v_seq::type_id::create("vseqh");
	vseqh.start(uart_envh.vseqrh);
	#50;
	phase.drop_objection(this);
  
endtask 


class framing_test extends uart_base_test;
  `uvm_component_utils(framing_test)
  
  framing_v_seq vseqh;
  
   	extern function new(string name = "framing_test" , uvm_component parent);
    extern function void end_of_elaboration_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
endclass

function framing_test::new(string name = "framing_test" , uvm_component parent);
	super.new(name,parent);
endfunction


function void framing_test::end_of_elaboration_phase(uvm_phase phase);
	uvm_top.print_topology();
endfunction



task framing_test::run_phase(uvm_phase phase);

	phase.raise_objection(this);
 

	vseqh = framing_v_seq::type_id::create("vseqh");
	vseqh.start(uart_envh.vseqrh);
	#50;
	phase.drop_objection(this);
  
endtask 


class empty_test extends uart_base_test;
  `uvm_component_utils(empty_test)
  
  empty_v_seq vseqh;
  
   	extern function new(string name = "empty_test" , uvm_component parent);
    extern function void end_of_elaboration_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
endclass

function empty_test::new(string name = "empty_test" , uvm_component parent);
	super.new(name,parent);
endfunction


function void empty_test::end_of_elaboration_phase(uvm_phase phase);
	uvm_top.print_topology();
endfunction



task empty_test::run_phase(uvm_phase phase);

	phase.raise_objection(this);
 

	vseqh = empty_v_seq::type_id::create("vseqh");
	vseqh.start(uart_envh.vseqrh);
	#50;
	phase.drop_objection(this);
  
endtask   


class timeout_test extends uart_base_test;
  `uvm_component_utils(timeout_test)
  
  timeout_v_seq vseqh;
  
   	extern function new(string name = "timeout_test" , uvm_component parent);
    extern function void end_of_elaboration_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
endclass

function timeout_test::new(string name = "timeout_test" , uvm_component parent);
	super.new(name,parent);
endfunction


function void timeout_test::end_of_elaboration_phase(uvm_phase phase);
	uvm_top.print_topology();
endfunction



task timeout_test::run_phase(uvm_phase phase);

	phase.raise_objection(this);
 

	vseqh = timeout_v_seq::type_id::create("vseqh");
	vseqh.start(uart_envh.vseqrh);
	#50;
	phase.drop_objection(this);
  
endtask   
