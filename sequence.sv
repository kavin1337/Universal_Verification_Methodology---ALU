class base_sequence extends uvm_sequence;
  `uvm_object_utils(base_sequence)
  alu_sequence_item rst_pkt;
  
  function new(string name="base_sequence");
     super.new(name);
  endfunction: new
  
  task body();
    //`uvm_info("SEQUENCE_CLASS","inside body",UVM_HIGH)
    rst_pkt=alu_sequence_item::type_id::create("rst_pkt");
    start_item(rst_pkt);
    rst_pkt.randomize()with{reset==1;};
    finish_item(rst_pkt);
  endtask: body
  
endclass: base_sequence

class test_sequence extends base_sequence;
  `uvm_object_utils(test_sequence)
  alu_sequence_item item;
  
  function new(string name="test_sequence");
     super.new(name);
  endfunction: new
  
  task body();
    //`uvm_info("SEQUENCE_CLASS","inside body",UVM_HIGH)
    item=alu_sequence_item::type_id::create("item");
    start_item(item);
    item.randomize() with{reset==0;};
    finish_item(item);
  endtask: body
  
endclass: test_sequence
