`timescale 1ns/1ns

import uvm_pkg::*;
`include "uvm_macros.svh"
`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"


module top;
  logic clock;
  
  alu_interface inft(.clock(clock));
  
  alu dut(
    .clock(inft.clock),
    .reset(inft.reset),
    .A(inft.a),
    .B(inft.b),
    .ALU_Sel(inft.op_code),
    .ALU_Out(inft.result),
    .CarryOut(inft.carry_out)   
  );
  
  initial begin
    uvm_config_db#(virtual alu_interface)::set(null,"*","vif",inft);
  end
  
  initial begin
    run_test("alu_test");
  end
    

  initial begin
    clock=0;
    #5;
    forever begin
      clock=~clock;
      #2;
    end
  end
  
  initial begin
    #5000;
    $display("clock cycle is over");
    $finish();
  end

  initial begin
    $dumpfile("d.vcd");
    $dumpvars();
  end
  
endmodule: top
