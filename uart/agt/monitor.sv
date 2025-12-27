
class monitor extends uvm_monitor;

	`uvm_component_utils(monitor)
	virtual uart_if.MON_MP vif;
	uart_xtn xtn;
	agent_config m_cfg;
	uvm_analysis_port #(uart_xtn) mon_analysis_port;
	extern function new(string name = "monitor", uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
	extern task collect_data_from_dut;
	
endclass 


	function monitor::new(string name = "monitor", uvm_component parent);
		super.new(name,parent);
		mon_analysis_port = new("mon_analysis_port", this);
  	endfunction

function void monitor::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if (!uvm_config_db#(agent_config)::get(this, "", "agent_config", m_cfg))
  `uvm_fatal("Monitor", "GET failed")
  xtn = uart_xtn::type_id::create("xtn");
endfunction : build_phase

function void monitor::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  vif = m_cfg.vif;
endfunction : connect_phase


task monitor::run_phase(uvm_phase phase);
	repeat (2) @(vif.mon_cb);
	xtn.Presetn = vif.mon_cb.Presetn;
	mon_analysis_port.write(xtn);
	@(vif.mon_cb);
	forever begin
		collect_data_from_dut;
	end
       endtask


task monitor::collect_data_from_dut;
  while (vif.mon_cb.Pready !== 1'b1) @(vif.mon_cb);
  xtn.Presetn = vif.mon_cb.Presetn;
  xtn.Paddr = vif.mon_cb.Paddr;
  xtn.Psel = vif.mon_cb.Psel;
  xtn.Pwrite = vif.mon_cb.Pwrite;
  xtn.Penable = vif.mon_cb.Penable;
  xtn.Pwdata = vif.mon_cb.Pwdata;
  xtn.Prdata = vif.mon_cb.Prdata;
  xtn.Pready = vif.mon_cb.Pready;
  xtn.Pslverr = vif.mon_cb.Pslverr;
  xtn.IRQ = vif.mon_cb.IRQ;
  if (xtn.Paddr == 32'h8 && xtn.Pwrite == 1'b0) begin
    while (vif.mon_cb.IRQ !== 1'b1) @(vif.mon_cb);
    xtn.IRQ = vif.mon_cb.IRQ;
    xtn.Prdata = vif.mon_cb.Prdata;
    xtn.iir = xtn.Prdata;
  end
  @(vif.mon_cb);
  if (xtn.Pwrite == 1'b1) begin
    if (xtn.Paddr == 32'h00) xtn.thr.push_back(xtn.Pwdata);
    if (xtn.Paddr == 32'h04) xtn.ier = xtn.Pwdata;
    if (xtn.Paddr == 32'h08) xtn.fcr = xtn.Pwdata;
    if (xtn.Paddr == 32'h0c) xtn.lcr = xtn.Pwdata;
    if (xtn.Paddr == 32'h10) xtn.mcr = xtn.Pwdata;
    if (xtn.Paddr == 32'h1c)
	begin
	xtn.divisor[7:0] = xtn.Pwdata;
	xtn.dl_access = 1'b1;
	end
    if (xtn.Paddr == 32'h20)
	begin
		xtn.divisor[15:8] = xtn.Pwdata;
		xtn.dl_access = 1'b1;
	end
  end
  if (xtn.IRQ == 1'b1) begin
    if (xtn.Paddr == 32'h00) xtn.rbr.push_back(xtn.Prdata);
    if (xtn.Paddr == 32'h14) xtn.lsr = xtn.Prdata;
  end
  mon_analysis_port.write(xtn);
  //`uvm_info("MONITOR", $sformatf("\n%s", xtn.sprint), UVM_MEDIUM)
endtask 