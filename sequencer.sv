class alu_sequencer extends uvm_sequencer #(alu_sequence_item);
  `uvm_component_utils(alu_sequencer)
  
  function new(string name ="alu_sequencer",uvm_component parent);
    super.new(name,parent);
    `uvm_info("SEQUENCER_CLASS","constructor",UVM_HIGH);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SEQUENCER_CLASS","Build phase",UVM_HIGH);
  endfunction: build_phase
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SEQUENCER_CLASS","Connect phase",UVM_HIGH);
  endfunction: connect_phase
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("SEQUENCER_CLASS","Run phase",UVM_HIGH);
  endtask: run_phase
  
endclass: alu_sequencer
