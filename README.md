
# UVM-Based ALU Verification

This project demonstrates a **Universal Verification Methodology (UVM)**-based testbench developed for verifying a simple **Arithmetic Logic Unit (ALU)**. It includes a complete UVM environment, sequence generation, driver, monitor, scoreboard, and test control.

## 📁 Project Structure

```
├── interface.sv            # DUT interface
├── alu.v                   # ALU RTL design (your DUT)
├── testbench.sv            # Top module instantiating DUT and starting UVM test
├── test.sv                 # UVM test class (alu_test)
├── env.sv                  # UVM environment (alu_env)
├── agent.sv                # UVM agent (alu_agent)
├── driver.sv               # UVM driver (alu_driver)
├── monitor.sv              # UVM monitor (alu_monitor)
├── sequencer.sv            # UVM sequencer (alu_sequencer)
├── sequence_item.sv        # UVM transaction (alu_sequence_item)
├── sequence.sv             # UVM sequences (base_sequence, test_sequence)
├── scoreboard.sv           # UVM scoreboard (alu_scoreboard)
└── README.md               # This file
```

## 🚀 Features

- ✅ Fully modular UVM testbench
- 🔁 Reset and functional sequences (`base_sequence`, `test_sequence`)
- 🔍 Self-checking scoreboard
- 🛠️ Support for ALU operations: Add, Sub, Mul, Div
- 🔄 Configurable via `uvm_config_db`
- 📋 Detailed debug and error reporting using UVM messaging macros

## 🧪 ALU Operations Verified

| Opcode | Operation |
|--------|-----------|
|   0    | A + B     |
|   1    | A - B     |
|   2    | A × B     |
|   3    | A ÷ B     |

## 🧾 How to Run

### 1. Compile and Simulate

If using **EDA Playground**, copy-paste all files and set top module as `testbench.sv`.

If using a local simulator (e.g., **VCS**, **Questa**, **Xrun**), use:

```bash
vlog *.sv
vsim -c -do "run -all" top
```

Make sure `uvm_pkg` is included in your toolchain.

### 2. Output Log

- UVM Phases: constructor, build, connect, run
- Sequence activity: randomized transactions
- Scoreboard: automatic pass/fail comparison of actual vs expected result

## 🧠 Concepts Covered

- `uvm_sequence_item`, `uvm_sequence`, `uvm_driver`, `uvm_monitor`
- `uvm_analysis_port` / `uvm_analysis_imp`
- Transaction-level modeling (TLM)
- Constrained random stimulus generation
- Phase-based test execution

## ✅ To-Do

- [ ] Add functional coverage model
- [ ] Add error injection tests
- [ ] Integrate with regression flow

## 📷 Screenshot

![waveform](docs/alu_waveform.png) <!-- Optional if you have waveform image -->

## 🧑‍💻 Author

**Kavin Kumar K**  
UVM Enthusiast | VLSI Learner

## 📝 License

This project is licensed under the [MIT License](LICENSE).

## 🤝 Contributions

Feel free to fork, improve, or report bugs via GitHub Issues or Pull Requests.
