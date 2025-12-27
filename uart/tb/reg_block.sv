class uart_reg_block extends uvm_reg_block;
  rand uart_ier_reg ier; uart_iir_reg iir; rand uart_fcr_reg fcr; 
  rand uart_lcr_reg lcr; rand uart_mcr_reg mcr; uart_lsr_reg lsr;

  `uvm_object_utils(uart_reg_block)

  function new(string name="uart_reg_block");
    super.new(name, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();
    ier = uart_ier_reg::type_id::create("ier"); ier.build(); ier.configure(this);
    iir = uart_iir_reg::type_id::create("iir"); iir.build(); iir.configure(this);
    fcr = uart_fcr_reg::type_id::create("fcr"); fcr.build(); fcr.configure(this);
    lcr = uart_lcr_reg::type_id::create("lcr"); lcr.build(); lcr.configure(this);
    mcr = uart_mcr_reg::type_id::create("mcr"); mcr.build(); mcr.configure(this);
    lsr = uart_lsr_reg::type_id::create("lsr"); lsr.build(); lsr.configure(this);

    default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN);
    default_map.add_reg(ier, 32'h04, "RW"); default_map.add_reg(iir, 32'h08, "RO");
    default_map.add_reg(fcr, 32'h08, "WO"); default_map.add_reg(lcr, 32'h0C, "RW");
    default_map.add_reg(mcr, 32'h10, "RW"); default_map.add_reg(lsr, 32'h14, "RO");

    ier.add_hdl_path_slice("IER", 0, 8); iir.add_hdl_path_slice("IIR", 0, 8);
    fcr.add_hdl_path_slice("FCR", 0, 8); lcr.add_hdl_path_slice("LCR", 0, 8);
    mcr.add_hdl_path_slice("MCR", 0, 8); lsr.add_hdl_path_slice("LSR", 0, 8);
    add_hdl_path("top.DUV1.control", "RTL");
    lock_model();
  endfunction
endclass
