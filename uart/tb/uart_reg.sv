class uart_ier_reg extends uvm_reg;
  rand uvm_reg_field rx_int_en, tx_int_en, line_stat_int_en, modem_stat_int_en;
  uvm_reg_field reserved;
  `uvm_object_utils(uart_ier_reg)
  function new(string name="uart_ier_reg"); super.new(name, 8, UVM_NO_COVERAGE); endfunction
  virtual function void build();
    rx_int_en = uvm_reg_field::type_id::create("rx_int_en"); rx_int_en.configure(this, 1, 0, "RW", 0, 0, 1, 0, 1);
    tx_int_en = uvm_reg_field::type_id::create("tx_int_en"); tx_int_en.configure(this, 1, 1, "RW", 0, 0, 1, 0, 1);
    line_stat_int_en = uvm_reg_field::type_id::create("line_stat_int_en"); line_stat_int_en.configure(this, 1, 2, "RW", 0, 0, 1, 0, 1);
    modem_stat_int_en = uvm_reg_field::type_id::create("modem_stat_int_en"); modem_stat_int_en.configure(this, 1, 3, "RW", 0, 0, 1, 0, 1);
    reserved = uvm_reg_field::type_id::create("reserved"); reserved.configure(this, 4, 4, "RO", 0, 0, 1, 0, 0);
  endfunction
endclass

class uart_iir_reg extends uvm_reg;
  uvm_reg_field int_pending_n, int_id, reserved;
  `uvm_object_utils(uart_iir_reg)
  function new(string name="uart_iir_reg"); super.new(name, 8, UVM_NO_COVERAGE); endfunction
  virtual function void build();
    int_pending_n = uvm_reg_field::type_id::create("int_pending_n"); int_pending_n.configure(this, 1, 0, "RO", 0, 1, 1, 0, 0);
    int_id = uvm_reg_field::type_id::create("int_id"); int_id.configure(this, 3, 1, "RO", 0, 3'b000, 1, 0, 0);
    reserved = uvm_reg_field::type_id::create("reserved"); reserved.configure(this, 4, 4, "RO", 0, 4'hC, 1, 0, 0);
  endfunction
endclass

class uart_fcr_reg extends uvm_reg;
  uvm_reg_field rx_flush, tx_flush, trig_level, reserved_lo, reserved_hi;
  `uvm_object_utils(uart_fcr_reg)
  function new(string name="uart_fcr_reg"); super.new(name, 8, UVM_NO_COVERAGE); endfunction
  virtual function void build();
    reserved_lo = uvm_reg_field::type_id::create("reserved_lo"); reserved_lo.configure(this, 1, 0, "WO", 0, 0, 1, 0, 0);
    rx_flush = uvm_reg_field::type_id::create("rx_flush"); rx_flush.configure(this, 1, 1, "WO", 0, 0, 1, 0, 1);
    tx_flush = uvm_reg_field::type_id::create("tx_flush"); tx_flush.configure(this, 1, 2, "WO", 0, 0, 1, 0, 1);
    reserved_hi = uvm_reg_field::type_id::create("reserved_hi"); reserved_hi.configure(this, 3, 3, "WO", 0, 0, 1, 0, 0);
    trig_level = uvm_reg_field::type_id::create("trig_level"); trig_level.configure(this, 2, 6, "WO", 0, 2'b11, 1, 0, 1);
  endfunction
endclass

class uart_lcr_reg extends uvm_reg;
  rand uvm_reg_field word_len, stop_bits, parity_en, even_parity, stick_parity, break_ctrl;
  uvm_reg_field reserved;
  `uvm_object_utils(uart_lcr_reg)
  function new(string name="uart_lcr_reg"); super.new(name, 8, UVM_NO_COVERAGE); endfunction
  virtual function void build();
    word_len = uvm_reg_field::type_id::create("word_len"); word_len.configure(this, 2, 0, "RW", 0, 2'h3, 1, 0, 1);
    stop_bits = uvm_reg_field::type_id::create("stop_bits"); stop_bits.configure(this, 1, 2, "RW", 0, 0, 1, 0, 1);
    parity_en = uvm_reg_field::type_id::create("parity_en"); parity_en.configure(this, 1, 3, "RW", 0, 0, 1, 0, 1);
    even_parity = uvm_reg_field::type_id::create("even_parity"); even_parity.configure(this, 1, 4, "RW", 0, 0, 1, 0, 1);
    stick_parity = uvm_reg_field::type_id::create("stick_parity"); stick_parity.configure(this, 1, 5, "RW", 0, 0, 1, 0, 1);
    break_ctrl = uvm_reg_field::type_id::create("break_ctrl"); break_ctrl.configure(this, 1, 6, "RW", 0, 0, 1, 0, 1);
    reserved = uvm_reg_field::type_id::create("reserved"); reserved.configure(this, 1, 7, "RW", 0, 0, 1, 0, 0);
  endfunction
endclass

class uart_mcr_reg extends uvm_reg;
  rand uvm_reg_field dtr, rts, out1, out2, loopback;
  uvm_reg_field reserved;
  `uvm_object_utils(uart_mcr_reg)
  function new(string name="uart_mcr_reg"); super.new(name, 8, UVM_NO_COVERAGE); endfunction
  virtual function void build();
    dtr = uvm_reg_field::type_id::create("dtr"); dtr.configure(this, 1, 0, "RW", 0, 0, 1, 0, 1);
    rts = uvm_reg_field::type_id::create("rts"); rts.configure(this, 1, 1, "RW", 0, 0, 1, 0, 1);
    out1 = uvm_reg_field::type_id::create("out1"); out1.configure(this, 1, 2, "RW", 0, 0, 1, 0, 1);
    out2 = uvm_reg_field::type_id::create("out2"); out2.configure(this, 1, 3, "RW", 0, 0, 1, 0, 1);
    loopback = uvm_reg_field::type_id::create("loopback"); loopback.configure(this, 1, 4, "RW", 0, 0, 1, 0, 1);
    reserved = uvm_reg_field::type_id::create("reserved"); reserved.configure(this, 3, 5, "RO", 0, 0, 1, 0, 0);
  endfunction
endclass

class uart_lsr_reg extends uvm_reg;
  uvm_reg_field dr, oe, pe, fe, bi, tx_fifo_empty, tx_empty, fifo_error;
  `uvm_object_utils(uart_lsr_reg)
  function new(string name="uart_lsr_reg"); super.new(name, 8, UVM_NO_COVERAGE); endfunction
  virtual function void build();
    dr = uvm_reg_field::type_id::create("dr"); dr.configure(this, 1, 0, "RO", 0, 0, 1, 0, 0);
    oe = uvm_reg_field::type_id::create("oe"); oe.configure(this, 1, 1, "RO", 0, 0, 1, 0, 0);
    pe = uvm_reg_field::type_id::create("pe"); pe.configure(this, 1, 2, "RO", 0, 0, 1, 0, 0);
    fe = uvm_reg_field::type_id::create("fe"); fe.configure(this, 1, 3, "RO", 0, 0, 1, 0, 0);
    bi = uvm_reg_field::type_id::create("bi"); bi.configure(this, 1, 4, "RO", 0, 0, 1, 0, 0);
    tx_fifo_empty = uvm_reg_field::type_id::create("tx_fifo_empty"); tx_fifo_empty.configure(this, 1, 5, "RO", 0, 1, 1, 0, 0);
    tx_empty = uvm_reg_field::type_id::create("tx_empty"); tx_empty.configure(this, 1, 6, "RO", 0, 1, 1, 0, 0);
    fifo_error = uvm_reg_field::type_id::create("fifo_error"); fifo_error.configure(this, 1, 7, "RO", 0, 0, 1, 0, 0);
  endfunction
endclass
