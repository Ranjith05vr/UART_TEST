

//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------


// Extend write_xtn from uvm_sequence_item
class uart_xtn extends uvm_sequence_item;
  
	// UVM Factory Registration Macro
	`uvm_object_utils(uart_xtn)

	// Standard UVM Methods like constructor,do_compare,do_copy,do_print,post_randomize
	extern function new(string name = "uart_xtn");
	bit Presetn;
	rand bit [31:0] Paddr;
	bit Psel;
	rand bit Pwrite;
	bit Penable;
	rand bit [31:0] Pwdata;
	rand bit [31:0] Prdata;
	bit Pready;
	bit Pslverr;
	bit IRQ;
	
	
	bit [7:0] rbr[$];
	bit [7:0] thr[$];
	bit [7:0] ier;
	bit [7:0] iir;
	bit [7:0] fcr;
	bit [7:0] lcr;
	bit [7:0] lsr;
	bit [7:0] mcr;
	bit [25:0] divisor;
	bit dl_access;
	bit data_in_thr;
	bit data_in_rbr;
	
constraint a1{Pwrite dist {0:=10, 1:=10};}
function void do_print  (uvm_printer printer);
	super.do_print(printer);
	
printer.print_field("Presetn", this.Presetn,1,UVM_DEC);
printer.print_field("Paddr", this.Paddr,32,UVM_DEC);
printer.print_field("Psel", this.Psel,1,UVM_DEC);
printer.print_field("Pwrite", this.Pwrite,1,UVM_DEC);
printer.print_field("Penable", this.Penable,1,UVM_DEC);
printer.print_field("Pwdata", this.Pwdata,32,UVM_DEC);
printer.print_field("Prdata", this.Prdata,32,UVM_DEC);
printer.print_field("Pready", this.Pready,1,UVM_DEC);
printer.print_field("Pslverr", this.Pslverr,1,UVM_DEC);
printer.print_field("rbr", this.rbr.size,1,UVM_DEC);
printer.print_field("IRQ", this.IRQ,1,UVM_DEC);

foreach (rbr[i])
begin
printer.print_field($sformatf("rbr[%0d]",i), this.rbr[i],$bits(bit), UVM_DEC);
end

foreach (thr[i])
begin
printer.print_field($sformatf("thr[%0d]",i), this.thr[i],$bits(8), UVM_DEC);
end

printer.print_field("ier", this.ier,8,UVM_BIN);
printer.print_field("iir", this.iir,8,UVM_BIN);
printer.print_field("fcr", this.fcr,8,UVM_BIN);
printer.print_field("lcr", this.lcr,8,UVM_BIN);
printer.print_field("lsr", this.lsr,8,UVM_BIN);
printer.print_field("mcr", this.mcr,8,UVM_BIN);
printer.print_field("divisor", this.divisor,26,UVM_DEC);
printer.print_field("dl_access", this.dl_access,1,UVM_DEC);
printer.print_field("data_in_thr", this.data_in_thr,1,UVM_DEC);
printer.print_field("data_in_rbr", this.data_in_rbr,1,UVM_DEC);

endfunction
endclass


	
	
	
	
	



function uart_xtn::new(string name = "uart_xtn");
	super.new(name);
endfunction:new
	  