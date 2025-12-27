

//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------


// Extend uart_tb from uvm_env
class uart_tb extends uvm_env;


	`uvm_component_utils(uart_tb)

	uart_virtual_sequencer vseqrh;
 
	agent agnt[];
	uart_env_config m_cfg;
	uart_sb sbh;
			

	extern function new(string name = "uart_tb",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);

endclass
	


function uart_tb::new(string name = "uart_tb", uvm_component parent);
		super.new(name,parent);
endfunction




function void uart_tb::build_phase(uvm_phase phase);	
	super.build_phase(phase);
	if(!uvm_config_db #(uart_env_config)::get(this,"","uart_env_config",m_cfg))
		`uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?")
		
		
	if (m_cfg.has_virtual_sequencer) vseqrh = uart_virtual_sequencer::type_id::create("vseqrh", this);	
	
	if(m_cfg.has_agent) 
					begin
		agnt=new[m_cfg.no_of_agents];
		foreach(agnt[i])
					begin
					uvm_config_db #(agent_config)::set(this , $sformatf("agt[%0d]*",i),"agent_config",m_cfg.m_agent_cfg[i]);
					agnt[i]=agent::type_id::create($sformatf("agt[%0d]",i), this);
					end
					end
		super.build_phase(phase);
	  if (m_cfg.has_scoreboard) sbh = uart_sb::type_id::create("sbh", this);
endfunction
   
function void uart_tb::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  if (m_cfg.has_virtual_sequencer && m_cfg.has_agent) begin
    foreach (vseqrh.seqrh[i]) begin
      vseqrh.seqrh[i] = agnt[i].seqrh;
    end
  end
 if (m_cfg.has_scoreboard && m_cfg.has_agent) begin
    foreach (agnt[i]) begin
      agnt[i].monh.mon_analysis_port.connect(sbh.fifo_h[i].analysis_export);
    end
  end
endfunction : connect_phase

   
  
   


