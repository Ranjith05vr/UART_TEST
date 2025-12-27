//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------


// Extend driver from uvm_driver parameterized by write_xtn
class driver extends uvm_driver #(uart_xtn);



	`uvm_component_utils(driver)
	agent_config m_cfg;
	virtual uart_if.DRV_MP vif;
 
 
	extern function new(string name ="driver",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
	extern task send_to_dut(uart_xtn xtn);
	
endclass





function driver::new(string name = "driver", uvm_component parent);
		super.new(name,parent);
endfunction


function void driver::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if (!uvm_config_db#(agent_config)::get(this, "", "agent_config", m_cfg))
    `uvm_fatal("UART_DRIVER", "GET failed")
endfunction : build_phase


function void driver::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
    vif = m_cfg.vif;
endfunction : connect_phase




task driver::run_phase(uvm_phase phase);
  @(vif.drv_cb);
  vif.drv_cb.Presetn <= 1'b0;
  @(vif.drv_cb);
  vif.drv_cb.Presetn <= 1'b1;
    forever begin
		seq_item_port.get_next_item(req);
		send_to_dut(req);
		seq_item_port.item_done();
	end
endtask


task driver::send_to_dut(uart_xtn xtn);
		// Print the transaction
         // `uvm_info("DRIVER",$sformatf("printing from driver \n %s", xtn.sprint()),UVM_LOW) 
		  vif.drv_cb.Psel <= 1'b1;
		  vif.drv_cb.Pwrite <= xtn.Pwrite;
		  vif.drv_cb.Paddr <= xtn.Paddr;
		  vif.drv_cb.Pwdata <= xtn.Pwdata;
		  @(vif.drv_cb);
		  vif.drv_cb.Penable <= 1'b1;
		  while(vif.drv_cb.Pready !== 1'b1) @(vif.drv_cb);
		  if(xtn.Paddr == 32'h08 && xtn.Pwrite == 1'h0) begin
			while(vif.drv_cb.IRQ !== 1'b1) @(vif.drv_cb);
			xtn.iir = vif.drv_cb.Prdata;
			seq_item_port.put_response(xtn);
		  end
		  vif.drv_cb.Psel <= 1'b0;
		  vif.drv_cb.Pwrite <= 1'b0;
		  vif.drv_cb.Penable <= 1'b0;
		  @(vif.drv_cb);
		//`uvm_info("DRIVER",$sformatf("printing from driver \n %s", xtn.sprint()),UVM_LOW) 
endtask

