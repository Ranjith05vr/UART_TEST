// Extend base_seq from uvm_sequence parameterized by write_xtn 
class base_seqs extends uvm_sequence #(uart_xtn);  
	
	`uvm_object_utils(base_seqs)
    extern function new(string name ="base_seqs");
	
endclass

function base_seqs::new(string name ="base_seqs");
	super.new(name);
endfunction

class apb_agent_FD0_sequence extends base_seqs;

		`uvm_object_utils(apb_agent_FD0_sequence)

    extern function new(string name ="apb_agent_FD0_sequence");
    extern task body();
	
endclass


//-----------------  constructor new method  -------------------//

function apb_agent_FD0_sequence::new(string name = "apb_agent_FD0_sequence");
	super.new(name);
endfunction

	  
task apb_agent_FD0_sequence::body();
	begin
		req=uart_xtn::type_id::create("req");
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h20;Pwrite==1;Pwdata==0;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h1c;Pwrite==1;Pwdata==54;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h0c;Pwrite==1;Pwdata==32'h03;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==1;Pwdata==32'h6;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h04;Pwrite==1;Pwdata==32'h01;});
		finish_item(req); 	
		//THR
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==1;Pwdata inside {[1:255]};});
		finish_item(req); 	
		//IIR
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==0;});
		finish_item(req); 		
		
		if(req.iir[3:0] ==4)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==0;});
		finish_item(req);
		end
		
		
		if(req.iir[3:0] ==4'h6)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h14;Pwrite==0;});
		finish_item(req);
		end
		
		
	end
endtask


class apb_agent_FD1_sequence extends base_seqs;

		`uvm_object_utils(apb_agent_FD1_sequence)

    extern function new(string name ="apb_agent_FD1_sequence");
    extern task body();
	
endclass


//-----------------  constructor new method  -------------------//

function apb_agent_FD1_sequence::new(string name = "apb_agent_FD1_sequence");
	super.new(name);
endfunction

	  
task apb_agent_FD1_sequence::body();
	begin
		req=uart_xtn::type_id::create("req");
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h20;Pwrite==1;Pwdata==0;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h1c;Pwrite==1;Pwdata==27;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h0c;Pwrite==1;Pwdata==32'h03;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==1;Pwdata==32'h6;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h04;Pwrite==1;Pwdata==32'h01;});
		finish_item(req); 	
		//THR
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==1;Pwdata inside {[1:255]};});
		finish_item(req); 	
		//IIR
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==0;});
		finish_item(req); 		
		
		if(req.iir[3:0] ==4)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==0;});
		finish_item(req);
		end
		
		
		if(req.iir[3:0] ==4'h6)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h14;Pwrite==0;});
		finish_item(req);
		end
		
		
	end
endtask



class apb_agent_HD0_sequence extends base_seqs;

		`uvm_object_utils(apb_agent_HD0_sequence)

    extern function new(string name ="apb_agent_HD0_sequence");
    extern task body();
	
endclass


//-----------------  constructor new method  -------------------//

function apb_agent_HD0_sequence::new(string name = "apb_agent_HD0_sequence");
	super.new(name);
endfunction

	  
task apb_agent_HD0_sequence::body();
	begin
		req=uart_xtn::type_id::create("req");
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h20;Pwrite==1;Pwdata==0;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h1c;Pwrite==1;Pwdata==54;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h0c;Pwrite==1;Pwdata==32'h03;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==1;Pwdata==32'h6;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h04;Pwrite==1;Pwdata==32'h01;});
		finish_item(req); 	
		//THR
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==1;Pwdata inside {[1:255]};});
		finish_item(req); 	
		//IIR

		
	end
endtask





class apb_agent_HD1_sequence extends base_seqs;

		`uvm_object_utils(apb_agent_HD1_sequence)

    extern function new(string name ="apb_agent_HD1_sequence");
    extern task body();
	
endclass


//-----------------  constructor new method  -------------------//

function apb_agent_HD1_sequence::new(string name = "apb_agent_HD1_sequence");
	super.new(name);
endfunction

	  
task apb_agent_HD1_sequence::body();
	begin
		req=uart_xtn::type_id::create("req");
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h20;Pwrite==1;Pwdata==0;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h1c;Pwrite==1;Pwdata==27;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h0c;Pwrite==1;Pwdata==32'h03;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==1;Pwdata==32'h6;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h04;Pwrite==1;Pwdata==32'h01;});
		finish_item(req); 	
		//THR
		//IIR
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==0;});
		finish_item(req); 		
		
		 
		
		if(req.iir[3:0] ==4)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==0;});
		finish_item(req);
		end
		
		
		if(req.iir[3:0] ==4'h6)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h14;Pwrite==0;});
		finish_item(req);
		end
		
		
	end
endtask


class apb_agent_LB0_sequence extends base_seqs;

		`uvm_object_utils(apb_agent_LB0_sequence)

    extern function new(string name ="apb_agent_LB0_sequence");
    extern task body();
	
endclass



function apb_agent_LB0_sequence::new(string name = "apb_agent_LB0_sequence");
	super.new(name);
endfunction

	  
task apb_agent_LB0_sequence::body();
	begin
		req=uart_xtn::type_id::create("req");
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h20;Pwrite==1;Pwdata==0;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h1c;Pwrite==1;Pwdata==54;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h0c;Pwrite==1;Pwdata==32'h03;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==1;Pwdata==32'h6;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h10;Pwrite==1;Pwdata==32'h10;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h04;Pwrite==1;Pwdata==32'h01;});
		finish_item(req); 	
		//THR
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==1;Pwdata inside {[1:255]};});
		finish_item(req); 	

		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==0;});
		finish_item(req); 		
		
		if(req.iir[3:0] ==4)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==0;});
		finish_item(req);
		end
		
		
		if(req.iir[3:0] ==4'h6)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h14;Pwrite==0;});
		finish_item(req);
		end
		
		
	end
endtask


class apb_agent_LB1_sequence extends base_seqs;

		`uvm_object_utils(apb_agent_LB1_sequence)

    extern function new(string name ="apb_agent_LB1_sequence");
    extern task body();
	
endclass


function apb_agent_LB1_sequence::new(string name = "apb_agent_LB1_sequence");
	super.new(name);
endfunction

	  
task apb_agent_LB1_sequence::body();
	begin
		req=uart_xtn::type_id::create("req");
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h20;Pwrite==1;Pwdata==0;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h1c;Pwrite==1;Pwdata==27;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h0c;Pwrite==1;Pwdata==32'h03;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==1;Pwdata==32'h6;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h10;Pwrite==1;Pwdata==32'h10;});
		finish_item(req); 	
				
		start_item(req);
		assert(req.randomize with {Paddr==32'h04;Pwrite==1;Pwdata==32'h01;});
		finish_item(req); 	

		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==1;Pwdata inside {[1:255]};});
		finish_item(req); 	
	
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==0;});
		finish_item(req); 		
		
		if(req.iir[3:0] ==4)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==0;});
		finish_item(req);
		end
		
		
		
		if(req.iir[3:0] ==4'h6)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h14;Pwrite==0;});
		finish_item(req);
		end
		
		
	end
endtask

class apb_agent_PE0_sequence extends base_seqs;

		`uvm_object_utils(apb_agent_PE0_sequence)

    extern function new(string name ="apb_agent_PE0_sequence");
    extern task body();
	
endclass


function apb_agent_PE0_sequence::new(string name = "apb_agent_PE0_sequence");
	super.new(name);
endfunction

	  
task apb_agent_PE0_sequence::body();
	begin
		req=uart_xtn::type_id::create("req");
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h20;Pwrite==1;Pwdata==0;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h1c;Pwrite==1;Pwdata==54;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h0c;Pwrite==1;Pwdata==8'b00001011;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==1;Pwdata==8'b00000110;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h04;Pwrite==1;Pwdata==8'b00000101;});
		finish_item(req); 	

		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==1;Pwdata inside {[1:255]};});
		finish_item(req); 	
	
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==0;});
		finish_item(req); 		
		
		if(req.iir[3:0] ==4)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==0;});
		finish_item(req);
		end
		
		
		if(req.iir[3:0] ==4'h6)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h14;Pwrite==0;});
		finish_item(req);
		end
		
		
	end
endtask


class apb_agent_PE1_sequence extends base_seqs;

		`uvm_object_utils(apb_agent_PE1_sequence)

    extern function new(string name ="apb_agent_PE1_sequence");
    extern task body();
	
endclass


function apb_agent_PE1_sequence::new(string name = "apb_agent_PE1_sequence");
	super.new(name);
endfunction

	  
task apb_agent_PE1_sequence::body();
	begin
		req=uart_xtn::type_id::create("req");
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h20;Pwrite==1;Pwdata==0;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h1c;Pwrite==1;Pwdata==27;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h0c;Pwrite==1;Pwdata==8'b00011111;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==1;Pwdata==8'b00000110;});
		finish_item(req); 	
		

		start_item(req);
		assert(req.randomize with {Paddr==32'h04;Pwrite==1;Pwdata==8'b00000101;});
		finish_item(req); 	

		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==1;Pwdata inside {[1:255]};});
		finish_item(req); 	
	
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==0;});
		finish_item(req); 		
		
		if(req.iir[3:0] ==4)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==0;});
		finish_item(req);
		end
		
		
		if(req.iir[3:0] ==4'h6)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h14;Pwrite==0;});
		finish_item(req);
		end
		
		
	end
endtask

class apb_agent_BE0_sequence extends base_seqs;

		`uvm_object_utils(apb_agent_BE0_sequence)

    extern function new(string name ="apb_agent_BE0_sequence");
    extern task body();
	
endclass


//-----------------  constructor new method  -------------------//

function apb_agent_BE0_sequence::new(string name = "apb_agent_BE0_sequence");
	super.new(name);
endfunction

	  
task apb_agent_BE0_sequence::body();
	begin
		req=uart_xtn::type_id::create("req");
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h20;Pwrite==1;Pwdata==0;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h1c;Pwrite==1;Pwdata==32'h46;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h0c;Pwrite==1;Pwdata==8'b01000011;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==1;Pwdata==32'h6;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h04;Pwrite==1;Pwdata==8'b00000101;});
		finish_item(req); 	
		//THR
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==1;Pwdata inside {[1:255]};});
		finish_item(req); 	
		//IIR
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==0;});
		finish_item(req); 		
		
		if(req.iir[3:0] ==4)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==0;});
		finish_item(req);
		end
		
		
		if(req.iir[3:0] ==4'h6)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h14;Pwrite==0;});
		finish_item(req);
		end
		
		
	end
endtask

class apb_agent_BE1_sequence extends base_seqs;

		`uvm_object_utils(apb_agent_BE1_sequence)

    extern function new(string name ="apb_agent_BE1_sequence");
    extern task body();
	
endclass


//-----------------  constructor new method  -------------------//

function apb_agent_BE1_sequence::new(string name = "apb_agent_BE1_sequence");
	super.new(name);
endfunction

	  
task apb_agent_BE1_sequence::body();
	begin
		req=uart_xtn::type_id::create("req");
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h20;Pwrite==1;Pwdata==0;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h1c;Pwrite==1;Pwdata==32'h8c;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h0c;Pwrite==1;Pwdata==8'b01000011;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==1;Pwdata==32'h6;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h04;Pwrite==1;Pwdata==8'b00000101;});
		finish_item(req); 	
		//THR
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==1;Pwdata inside {[1:255]};});
		finish_item(req); 	
		//IIR
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==0;});
		finish_item(req); 		
		
		if(req.iir[3:0] ==4)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==0;});
		finish_item(req);
		end
		
		
		if(req.iir[3:0] ==4'h6)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h14;Pwrite==0;});
		finish_item(req);
		end
		
		
	end
endtask


class apb_agent_OE0_sequence extends base_seqs;

		`uvm_object_utils(apb_agent_OE0_sequence)

    extern function new(string name ="apb_agent_OE0_sequence");
    extern task body();
	
endclass


function apb_agent_OE0_sequence::new(string name = "apb_agent_OE0_sequence");
	super.new(name);
endfunction

	  
task apb_agent_OE0_sequence::body();
	begin
		req=uart_xtn::type_id::create("req");
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h20;Pwrite==1;Pwdata==0;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h1c;Pwrite==1;Pwdata==54;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h0c;Pwrite==1;Pwdata==32'h03;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==1;Pwdata==32'h6;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h04;Pwrite==1;Pwdata==32'h04;});
		finish_item(req); 	

		repeat (17) begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==1;});
		finish_item(req); 	
		end
	
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==0;});
		finish_item(req); 		
		
		if(req.iir[3:0] ==4)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==0;});
		finish_item(req);
		end
		
		
		if(req.iir[3:0] ==4'h6)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h14;Pwrite==0;});
		finish_item(req);
		end
		
		
	end
endtask



class apb_agent_OE1_sequence extends base_seqs;

		`uvm_object_utils(apb_agent_OE1_sequence)

    extern function new(string name ="apb_agent_OE1_sequence");
    extern task body();
	
endclass


function apb_agent_OE1_sequence::new(string name = "apb_agent_OE1_sequence");
	super.new(name);
endfunction

	  
task apb_agent_OE1_sequence::body();
	begin
		req=uart_xtn::type_id::create("req");
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h20;Pwrite==1;Pwdata==0;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h1c;Pwrite==1;Pwdata==27;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h0c;Pwrite==1;Pwdata==32'h03;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==1;Pwdata==32'h6;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h04;Pwrite==1;Pwdata==32'h04;});
		finish_item(req); 	

		repeat (17) begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==1;});
		finish_item(req); 	
		end	
	
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==0;});
		finish_item(req); 		
		
		if(req.iir[3:0] ==4)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==0;});
		finish_item(req);
		end
		
		
		if(req.iir[3:0] ==4'h6)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h14;Pwrite==0;});
		finish_item(req);
		end
		
		
	end
endtask


class apb_agent_FE0_sequence extends base_seqs;

		`uvm_object_utils(apb_agent_FE0_sequence)

    extern function new(string name ="apb_agent_FE0_sequence");
    extern task body();
	
endclass


function apb_agent_FE0_sequence::new(string name = "apb_agent_FE0_sequence");
	super.new(name);
endfunction

	  
task apb_agent_FE0_sequence::body();
	begin
		req=uart_xtn::type_id::create("req");
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h20;Pwrite==1;Pwdata==32'h0;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h1c;Pwrite==1;Pwdata==32'd54;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h0c;Pwrite==1;Pwdata==32'h00;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==1;Pwdata==32'h6;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h04;Pwrite==1;Pwdata==32'h4;});
		finish_item(req); 	

		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==1;Pwdata inside {[1:255]};});
		finish_item(req); 	
	
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==0;Pwdata==32'h00;});
		finish_item(req); 		
		
		if(req.iir[3:0] ==4)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==0;Pwdata==0;});
		finish_item(req);
		end
		
		
		if(req.iir[3:0] ==4'h6)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h14;Pwrite==0;Pwdata==0;});
		finish_item(req);
		end
		
		
	end
endtask



class apb_agent_FE1_sequence extends base_seqs;

		`uvm_object_utils(apb_agent_FE1_sequence)

    extern function new(string name ="apb_agent_FE1_sequence");
    extern task body();
	
endclass


function apb_agent_FE1_sequence::new(string name = "apb_agent_FE1_sequence");
	super.new(name);
endfunction

	  
task apb_agent_FE1_sequence::body();
	begin
		req=uart_xtn::type_id::create("req");
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h20;Pwrite==1;Pwdata==32'h0;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h1c;Pwrite==1;Pwdata==32'd27;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h0c;Pwrite==1;Pwdata==32'h03;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==1;Pwdata==32'h6;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h04;Pwrite==1;Pwdata==32'h04;});
		finish_item(req); 	

		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==1;Pwdata==32'h5;});
		finish_item(req); 	
	
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==0;Pwdata==32'h00;});
		finish_item(req); 		
		
		if(req.iir[3:0] ==4)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==0;Pwdata==0;});
		finish_item(req);
		end
		
		
		if(req.iir[3:0] ==4'h6)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h14;Pwrite==0;Pwdata==0;});
		finish_item(req);
		end
		
		
	end
endtask


class apb_agent_ET0_sequence extends base_seqs;

		`uvm_object_utils(apb_agent_ET0_sequence)

    extern function new(string name ="apb_agent_ET0_sequence");
    extern task body();
	
endclass


//-----------------  constructor new method  -------------------//

function apb_agent_ET0_sequence::new(string name = "apb_agent_ET0_sequence");
	super.new(name);
endfunction

	  
task apb_agent_ET0_sequence::body();
	begin
		req=uart_xtn::type_id::create("req");
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h20;Pwrite==1;Pwdata==0;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h1c;Pwrite==1;Pwdata==54;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h0c;Pwrite==1;Pwdata==8'b00000011;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==1;Pwdata==8'b11000110;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h04;Pwrite==1;Pwdata==8'b00000010;});
		finish_item(req); 	


		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==0;});
		finish_item(req); 		
		
		if(req.iir[3:0] ==4)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==0;});
		finish_item(req);
		end
		
		
		if(req.iir[3:0] ==4'h6)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h14;Pwrite==0;});
		finish_item(req);
		end
		
		
	end
endtask

class apb_agent_ET1_sequence extends base_seqs;

		`uvm_object_utils(apb_agent_ET1_sequence)

    extern function new(string name ="apb_agent_ET1_sequence");
    extern task body();
	
endclass


//-----------------  constructor new method  -------------------//

function apb_agent_ET1_sequence::new(string name = "apb_agent_ET1_sequence");
	super.new(name);
endfunction

	  
task apb_agent_ET1_sequence::body();
	begin
		req=uart_xtn::type_id::create("req");
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h20;Pwrite==1;Pwdata==0;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h1c;Pwrite==1;Pwdata==27;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h0c;Pwrite==1;Pwdata==8'b00000011;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==1;Pwdata==8'b11000110;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h04;Pwrite==1;Pwdata==8'b00000010;});
		finish_item(req); 	


		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==0;});
		finish_item(req); 		
		
		if(req.iir[3:0] ==4)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==0;});
		finish_item(req);
		end
		
		
		if(req.iir[3:0] ==4'h6)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h14;Pwrite==0;});
		finish_item(req);
		end
		
		
	end
endtask

class apb_agent_TO0_sequence extends base_seqs;

		`uvm_object_utils(apb_agent_TO0_sequence)

    extern function new(string name ="apb_agent_TO0_sequence");
    extern task body();
	
endclass


//-----------------  constructor new method  -------------------//

function apb_agent_TO0_sequence::new(string name = "apb_agent_TO0_sequence");
	super.new(name);
endfunction

	  
task apb_agent_TO0_sequence::body();
	begin
		req=uart_xtn::type_id::create("req");
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h20;Pwrite==1;Pwdata==0;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h1c;Pwrite==1;Pwdata==54;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h0c;Pwrite==1;Pwdata==8'b00001011;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==1;Pwdata==8'b10000110;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h04;Pwrite==1;Pwdata==8'b00000000;});
		finish_item(req); 	
		//THR
		repeat(17)begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==1;});
		finish_item(req);
		end 	
		//IIR
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==0;});
		finish_item(req); 		
		
		if(req.iir[3:0] ==4)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==0;});
		finish_item(req);
		end
		
		
		if(req.iir[3:0] ==4'h6)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h14;Pwrite==0;});
		finish_item(req);
		end
		
		
	end
endtask


class apb_agent_TO1_sequence extends base_seqs;

		`uvm_object_utils(apb_agent_TO1_sequence)

    extern function new(string name ="apb_agent_TO1_sequence");
    extern task body();
	
endclass


//-----------------  constructor new method  -------------------//

function apb_agent_TO1_sequence::new(string name = "apb_agent_TO1_sequence");
	super.new(name);
endfunction

	  
task apb_agent_TO1_sequence::body();
	begin
		req=uart_xtn::type_id::create("req");
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h20;Pwrite==1;Pwdata==0;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h1c;Pwrite==1;Pwdata==27;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h0c;Pwrite==1;Pwdata==8'b00001011;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==1;Pwdata==8'b11000110;});
		finish_item(req); 	
		
		start_item(req);
		assert(req.randomize with {Paddr==32'h04;Pwrite==1;Pwdata==8'b00000000;});
		finish_item(req); 	
		//THR
		repeat(17)begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==1;});
		finish_item(req);
		end 	
		//IIR
		start_item(req);
		assert(req.randomize with {Paddr==32'h08;Pwrite==0;});
		finish_item(req); 		
		
		if(req.iir[3:0] ==4)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h00;Pwrite==0;});
		finish_item(req);
		end
		
		
		if(req.iir[3:0] ==4'h6)
		begin
		start_item(req);
		assert(req.randomize with {Paddr==32'h14;Pwrite==0;});
		finish_item(req);
		end
		
		
	end
endtask
