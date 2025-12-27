class uart_vbase_seq extends uvm_sequence #(uvm_sequence_item);

	`uvm_object_utils(uart_vbase_seq)  
	sequencer seqrh[];
    uart_virtual_sequencer vseqrh;

 	extern function new(string name = "uart_vbase_seq");
	extern task body();
	endclass : uart_vbase_seq  
	
	
	



function uart_vbase_seq::new(string name ="uart_vbase_seq");
		super.new(name);
endfunction




task uart_vbase_seq::body();

   assert($cast(vseqrh,m_sequencer)) else begin
    `uvm_fatal("BODY", "Error in $cast of virtual sequencer")
  end



 
endtask: body

   

class full_duplex_v_seq extends uart_vbase_seq;

	`uvm_object_utils(full_duplex_v_seq )
	apb_agent_FD0_sequence seq1h;
	apb_agent_FD1_sequence seq2h;

 	extern function new(string name = "full_duplex_v_seq ");
	extern task body();
	
	
endclass : full_duplex_v_seq   

function full_duplex_v_seq ::new(string name ="full_duplex_v_seq ");
	super.new(name);
endfunction



task full_duplex_v_seq ::body();
  super.body();
  seq1h = apb_agent_FD0_sequence::type_id::create("seq1h");
  seq2h = apb_agent_FD1_sequence::type_id::create("seq2h");
  fork
    seq1h.start(vseqrh.seqrh[0]);
    seq2h.start(vseqrh.seqrh[1]);
  join

endtask



class half_duplex_v_seq extends uart_vbase_seq;

	`uvm_object_utils(half_duplex_v_seq )
	apb_agent_HD0_sequence seq1h;
	apb_agent_HD1_sequence seq2h;

 	extern function new(string name = "half_duplex_v_seq ");
	extern task body();
	
	
endclass : half_duplex_v_seq   

function half_duplex_v_seq ::new(string name ="half_duplex_v_seq ");
	super.new(name);
endfunction



task half_duplex_v_seq ::body();
  super.body();
  seq1h = apb_agent_HD0_sequence::type_id::create("seq1h");
  seq2h = apb_agent_HD1_sequence::type_id::create("seq2h");
  fork
    seq1h.start(vseqrh.seqrh[0]);
    seq2h.start(vseqrh.seqrh[1]);
  join

endtask

class loopback_v_seq extends uart_vbase_seq;

	`uvm_object_utils(loopback_v_seq )
	apb_agent_LB0_sequence seq1h;
	apb_agent_LB1_sequence seq2h;

 	extern function new(string name = "loopback_v_seq ");
	extern task body();
	
	
endclass : loopback_v_seq   

function loopback_v_seq ::new(string name ="loopback_v_seq ");
	super.new(name);
endfunction



task loopback_v_seq ::body();
  super.body();
  seq1h = apb_agent_LB0_sequence::type_id::create("seq1h");
  seq2h = apb_agent_LB1_sequence::type_id::create("seq2h");
  fork
    seq1h.start(vseqrh.seqrh[0]);
    seq2h.start(vseqrh.seqrh[1]);
  join

endtask

class parity_v_seq extends uart_vbase_seq;

	`uvm_object_utils(parity_v_seq )
	apb_agent_PE0_sequence seq1h;
	apb_agent_PE1_sequence seq2h;

 	extern function new(string name = "parity_v_seq ");
	extern task body();
	
	
endclass : parity_v_seq   

function parity_v_seq ::new(string name ="parity_v_seq ");
	super.new(name);
endfunction



task parity_v_seq ::body();
  super.body();
  seq1h = apb_agent_PE0_sequence::type_id::create("seq1h");
  seq2h = apb_agent_PE1_sequence::type_id::create("seq2h");
  fork
    seq1h.start(vseqrh.seqrh[0]);
    seq2h.start(vseqrh.seqrh[1]);
  join

endtask



class break_v_seq extends uart_vbase_seq;

	`uvm_object_utils(break_v_seq )
	apb_agent_BE0_sequence seq1h;
	apb_agent_BE1_sequence seq2h;

 	extern function new(string name = "break_v_seq ");
	extern task body();
	
	
endclass : break_v_seq   

function break_v_seq ::new(string name ="break_v_seq ");
	super.new(name);
endfunction



task break_v_seq ::body();
  super.body();
  seq1h = apb_agent_BE0_sequence::type_id::create("seq1h");
  seq2h = apb_agent_BE1_sequence::type_id::create("seq2h");
  fork
    seq1h.start(vseqrh.seqrh[0]);
    seq2h.start(vseqrh.seqrh[1]);
  join

endtask


class overrun_v_seq extends uart_vbase_seq;

	`uvm_object_utils(overrun_v_seq )
	apb_agent_OE0_sequence seq1h;
	apb_agent_OE1_sequence seq2h;

 	extern function new(string name = "overrun_v_seq ");
	extern task body();

	
	
endclass : overrun_v_seq   

function overrun_v_seq ::new(string name ="overrun_v_seq ");
	super.new(name);
endfunction



task overrun_v_seq ::body();
  super.body();
  seq1h = apb_agent_OE0_sequence::type_id::create("seq1h");
  seq2h = apb_agent_OE1_sequence::type_id::create("seq2h");
  fork
    seq1h.start(vseqrh.seqrh[0]);
    seq2h.start(vseqrh.seqrh[1]);
  join

endtask


class framing_v_seq extends uart_vbase_seq;

	`uvm_object_utils(framing_v_seq )
	apb_agent_FE0_sequence seq1h;
	apb_agent_FE1_sequence seq2h;

 	extern function new(string name = "framing_v_seq ");
	extern task body();

	
	
endclass : framing_v_seq   

function framing_v_seq ::new(string name ="framing_v_seq ");
	super.new(name);
endfunction



task framing_v_seq ::body();
  super.body();
  seq1h = apb_agent_FE0_sequence::type_id::create("seq1h");
  seq2h = apb_agent_FE1_sequence::type_id::create("seq2h");
  fork
    seq1h.start(vseqrh.seqrh[0]);
    seq2h.start(vseqrh.seqrh[1]);
  join

endtask


class empty_v_seq extends uart_vbase_seq;

	`uvm_object_utils(empty_v_seq )
	apb_agent_ET0_sequence seq1h;
	apb_agent_ET1_sequence seq2h;

 	extern function new(string name = "empty_v_seq ");
	extern task body();

	
	
endclass : empty_v_seq   

function empty_v_seq ::new(string name ="empty_v_seq ");
	super.new(name);
endfunction



task empty_v_seq ::body();
  super.body();
  seq1h = apb_agent_ET0_sequence::type_id::create("seq1h");
  seq2h = apb_agent_ET1_sequence::type_id::create("seq2h");
  fork
    seq1h.start(vseqrh.seqrh[0]);
    seq2h.start(vseqrh.seqrh[1]);
  join

endtask


class timeout_v_seq extends uart_vbase_seq;

	`uvm_object_utils(timeout_v_seq )
	apb_agent_TO0_sequence seq1h;
	apb_agent_TO1_sequence seq2h;

 	extern function new(string name = "timeout_v_seq ");
	extern task body();

	
	
endclass : timeout_v_seq   

function timeout_v_seq ::new(string name ="timeout_v_seq ");
	super.new(name);
endfunction



task timeout_v_seq ::body();
  super.body();
  seq1h = apb_agent_TO0_sequence::type_id::create("seq1h");
  seq2h = apb_agent_TO1_sequence::type_id::create("seq2h");
  fork
    seq1h.start(vseqrh.seqrh[0]);
    seq2h.start(vseqrh.seqrh[1]);
  join

endtask
