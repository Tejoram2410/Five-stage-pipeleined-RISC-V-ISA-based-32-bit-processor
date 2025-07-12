# RV32I Pipelined RISC-V Microprocessor

## 🎯 Project Goal

The goal of this project was to design and implement a **RISC-V pipelined microprocessor** that supports the full **RV32I instruction set**, using Verilog HDL. This includes all base integer instructions defined under RV32I, with the exception of `SRAI`.

We started with a basic single-cycle implementation to ensure correctness, and then transitioned to a pipelined architecture to improve performance and throughput.

---

## 🛠️ Design Approach

### Phase 1: Single-Cycle Processor

Our first milestone was building a working single-cycle processor that could execute one instruction per clock cycle. This version helped us verify that each module and instruction behaved as expected in isolation.

### Phase 2: 5-Stage Pipelined Processor

Once the single-cycle processor was stable, we redesigned the architecture using the classic **5-stage pipeline**:

1. **Instruction Fetch (IF)**
2. **Instruction Decode (ID)**
3. **Execute (EX)**
4. **Memory Access (MEM)**
5. **Write Back (WB)**

To handle pipeline hazards, we designed a **Hazard Unit** that includes:
- Load-use hazard detection and stalling
- Forwarding logic to resolve data hazards efficiently without unnecessary stalls
- Control hazard detection for branch and jump instructions

---

## 🔧 Processor Components

Here's a quick rundown of the key modules in the design:

- **Instruction Fetch Unit (IFU):** Fetches instructions based on the current PC value.
- **Instruction Memory:** Stores the program and outputs a 32-bit instruction based on the PC.
- **Register File:** 32 general-purpose registers, each 32 bits wide, supporting 2 reads and 1 write per cycle.
- **ALU (Arithmetic Logic Unit):** Performs arithmetic and logic operations based on control signals.
- **Control Unit:** Decodes instructions and generates control signals for the datapath.
- **Immediate Generator:** Extracts and sign-extends immediate values for different instruction formats.
- **Data Memory:** Used for `LW` and `SW` instructions, handling 32-bit word reads and writes.
- **Hazard Unit (with Forwarding):** Detects hazards and applies forwarding to minimize pipeline stalls.
- **Pipeline Registers:** Store values and control signals between pipeline stages to keep execution synchronized.

---

## ✅ Supported Instructions (RV32I)

All RV32I instructions are supported **except** for `SRAI`. This includes:

### Arithmetic & Logical (Register)
- `ADD`, `SUB`, `AND`, `OR`, `XOR`, `SLL`, `SRL`, `SLT`, `SLTU`

### Arithmetic & Logical (Immediate)
- `ADDI`, `ANDI`, `ORI`, `XORI`, `SLLI`, `SRLI`, `SLTI`, `SLTIU`

### Memory Instructions
- `LW` (Load Word)  
- `SW` (Store Word)

### Control Flow Instructions
- `BEQ`, `BNE`, `BLT`, `BGE`, `BLTU`, `BGEU`
- `JAL` (Jump and Link)
- `JALR` (Jump and Link Register)

### Upper Immediate Instructions
- `LUI` (Load Upper Immediate)
- `AUIPC` (Add Upper Immediate to PC)

All instructions were tested through simulation using custom programs and verified using waveform analysis tools like ModelSim or GTKWave.

---

## 🧠 Instruction Encoding Formats

### R-Type
| 31–25 | 24–20 | 19–15 | 14–12 | 11–7 | 6–0  |
|--------|--------|--------|--------|-------|-------|
| funct7 | rs2    | rs1    | funct3 | rd    | opcode |

→ Used for: `ADD`, `SUB`, `AND`, `OR`, `XOR`, `SLL`, `SRL`, `SLT`, `SLTU`

---

### I-Type
| 31–20     | 19–15 | 14–12 | 11–7 | 6–0  |
|------------|--------|--------|-------|-------|
| immediate  | rs1    | funct3 | rd    | opcode |

→ Used for: `ADDI`, `ANDI`, `ORI`, `XORI`, `SLLI`, `SRLI`, `SLTI`, `SLTIU`, `LW`, `JALR`

---

### S-Type
| 31–25     | 24–20 | 19–15 | 14–12 | 11–7    | 6–0  |
|------------|--------|--------|--------|---------|-------|
| imm[11:5] | rs2    | rs1    | funct3 | imm[4:0] | opcode |

→ Used for: `SW`

---

### B-Type
| 31 | 30–25 | 24–20 | 19–15 | 14–12 | 11 | 10–8 | 7 | 6–0  |
|-----|--------|--------|--------|--------|-----|------|---|-------|
| imm[12] | imm[10:5] | rs2 | rs1 | funct3 | imm[4] | imm[3:1] | imm[11] | opcode |

→ Used for: `BEQ`, `BNE`, `BLT`, `BGE`, `BLTU`, `BGEU`

---

### U-Type
| 31–12     | 11–7 | 6–0  |
|------------|-------|-------|
| immediate  | rd    | opcode |

→ Used for: `LUI`, `AUIPC`

---

### J-Type
| 31 | 30–21 | 20 | 19–12 | 11–7 | 6–0  |
|-----|--------|-----|--------|-------|-------|
| imm[20] | imm[10:1] | imm[11] | imm[19:12] | rd | opcode |

→ Used for: `JAL`

---

## 🔍 Testing & Simulation

- ✅ Each instruction was validated with custom test programs
- ✅ Pipeline behavior checked for RAW hazards, control hazards, and proper forwarding
- ✅ Waveforms were inspected to ensure correct timing across pipeline stages
- ✅ Hazard cases like load-use and branch delays were explicitly tested

---

If you're someone exploring processor design or working on low-level architecture, this project might interest you. It balances correctness, modularity, and performance, and serves as a solid baseline for future extensions (like RV64, interrupt handling, or caching).
