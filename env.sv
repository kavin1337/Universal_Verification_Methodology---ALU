class alu_env extends uvm_env;
  `uvm_component_utils(alu_env)
  alu_agent agnt;
  alu_scoreboard scr;
  
  function new(string name ="alu_env",uvm_component parent);
    super.new(name,parent);
    `uvm_info("_class","constructor",UVM_HIGH);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("_class","Build phase",UVM_HIGH);
    agnt=alu_agent::type_id::create("agnt",this);
    scr=alu_scoreboard::type_id::create("scr",this);
    
  endfunction: build_phase
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("_class","Connect phase",UVM_HIGH);
    agnt.mon.monitor_port.connect(scr.scoreboard_port);
    
  endfunction: connect_phase
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("_class","Run phase",UVM_HIGH);
  endtask: run_phase
  
endclass: alu_env
