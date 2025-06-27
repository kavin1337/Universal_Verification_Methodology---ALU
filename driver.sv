class alu_driver extends uvm_driver #(alu_sequence_item);
  `uvm_component_utils(alu_driver)
  virtual alu_interface vif;
  alu_sequence_item item;
  
  function new(string name ="alu_driver",uvm_component parent);
    super.new(name,parent);
    `uvm_info("_class","constructor",UVM_HIGH);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("_class","Build phase",UVM_HIGH);
    uvm_config_db#(virtual alu_interface)::get(this,"*","vif",vif);
  endfunction: build_phase
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("_class","Connect phase",UVM_HIGH);
  endfunction: connect_phase
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("_class","Run phase",UVM_HIGH);
    
    forever begin
      item=alu_sequence_item::type_id::create("item");
      seq_item_port.get_next_item(item);
      drive(item);
      seq_item_port.item_done(item);
    end
  endtask: run_phase
  
  task drive(alu_sequence_item item);
    
    @(posedge vif.clock);
    vif.reset<=item.reset;
    vif.a<=item.a;
    vif.b<=item.b;
    vif.op_code<=item.op_code;
  endtask: drive
    
    
      
      
  
endclass: alu_driver
