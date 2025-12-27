

//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------

// Extend agent from uvm_agent
class agent extends uvm_agent;

   // Factory Registration
	
	`uvm_component_utils(agent)

   // Declare handle for configuration class agent_config
        agent_config m_cfg;
        
   // Declare handles of monitor,sequencer and driver
   // with Handle names as monh, seqrh, drvh respectively
	
	//------------------------------------------
	// METHODS
	//------------------------------------------
	monitor monh;
	sequencer seqrh;
	driver drvh;

	// Standard UVM Methods :
	extern function new(string name = "agent", uvm_component parent = null);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);

endclass : agent
//-----------------  constructor new method  -------------------//
       function agent::new(string name = "agent", 
                               uvm_component parent = null);
         super.new(name, parent);
       endfunction
     
     
  
//-----------------  build() phase method  -------------------//
	// Call parent build phase
	// get the config object using uvm_config_db
	// Create monitor instance
	//If config parameter is_active=UVM_ACTIVE,
	
	// Create instance of driver and sequencer
	function void agent::build_phase(uvm_phase phase);
		super.build_phase(phase);
                // get the config object using uvm_config_db 
	  if(!uvm_config_db #(agent_config)::get(this,"","agent_config",m_cfg))
		`uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?") 
	        monh=monitor::type_id::create("monh",this);	
		if(m_cfg.is_active==UVM_ACTIVE)
		begin
		drvh=driver::type_id::create("drvh",this);
		seqrh=sequencer::type_id::create("seqrh",this);
		end
		else
		`uvm_error(get_type_name(), "creation FAILED")
		
	endfunction

      
//-----------------  connect() phase method  -------------------//
	//If config parameter is_active=UVM_ACTIVE, 
	//connect driver(TLM seq_item_port) and sequencer(TLM seq_item_export)


   
	function void agent::connect_phase(uvm_phase phase);
		if(m_cfg.is_active==UVM_ACTIVE)
		begin
		drvh.seq_item_port.connect(seqrh.seq_item_export);
  		end
	endfunction
   
   


