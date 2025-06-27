class alu_monitor extends uvm_monitor;
  `uvm_component_utils(alu_monitor)
  virtual alu_interface vif;
  alu_sequence_item item;
  
  uvm_analysis_port #(alu_sequence_item) monitor_port;
  
  function new(string name ="alu_monitor",uvm_component parent);
    super.new(name,parent);
    `uvm_info("_class","constructor",UVM_HIGH);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("_class","Build phase",UVM_HIGH);
    
    monitor_port=new("monitor_port",this);	
    
    if(!(uvm_config_db #(virtual alu_interface)::get(this, "*", "vif", vif))) begin
      `uvm_error("MONITOR_CLASS", "Failed to get VIF from config DB!")
    end
    
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
       wait(!vif.reset)

       @(posedge vif.clock);
       item.a=vif.a;
       item.b=vif.b;
       item.op_code=vif.op_code;

       @(posedge vif.clock);
       item.result=vif.result;

       monitor_port.write(item);
    end
                                            
    
  endtask: run_phase
  
endclass: alu_monitor
