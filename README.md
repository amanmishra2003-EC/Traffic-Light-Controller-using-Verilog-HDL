# 🚦 Traffic Light Controller using Verilog HDL

## Overview

This project implements a **Traffic Light Controller** using **Verilog HDL** based on a **Moore Finite State Machine (FSM)** architecture. The controller manages traffic flow between two roads by monitoring traffic sensor inputs and generating appropriate traffic light signals.

The design was developed using synthesizable RTL and verified through simulation in **Xilinx Vivado 2025.2**.

---

## Features

* Moore FSM Architecture
* 4-State Traffic Control System
* Sensor-Based State Transitions
* Asynchronous Reset
* Synthesizable Verilog RTL
* Functional Verification using Testbench
* FSM State Monitoring through `state_out`

---

## Inputs and Outputs

### Inputs

| Signal | Description        |
| ------ | ------------------ |
| clk    | System Clock       |
| rst    | Asynchronous Reset |
| Ta     | Traffic Sensor A   |
| Tb     | Traffic Sensor B   |

### Outputs

| Signal         | Description              |
| -------------- | ------------------------ |
| La[1:0]        | Traffic Light for Road A |
| Lb[1:0]        | Traffic Light for Road B |
| state_out[1:0] | Current FSM State        |

---

## Light Encoding

| Light  | Encoding |
| ------ | -------- |
| GREEN  | 00       |
| YELLOW | 01       |
| RED    | 10       |

---

## State Encoding

| State | Encoding |
| ----- | -------- |
| S0    | 00       |
| S1    | 01       |
| S2    | 10       |
| S3    | 11       |

---

## FSM States

| State | Road A | Road B |
| ----- | ------ | ------ |
| S0    | GREEN  | RED    |
| S1    | YELLOW | RED    |
| S2    | RED    | GREEN  |
| S3    | RED    | YELLOW |

---

## State Transition Diagram

Insert FSM State Diagram Here

```text
S0 --Ta=0--> S1 --> S2 --Tb=0--> S3 --> S0

S0 --Ta=1--> S0
S2 --Tb=1--> S2
```

---

## State Transition Table

| Present State | Condition | Next State |
| ------------- | --------- | ---------- |
| S0            | Ta = 1    | S0         |
| S0            | Ta = 0    | S1         |
| S1            | X         | S2         |
| S2            | Tb = 1    | S2         |
| S2            | Tb = 0    | S3         |
| S3            | X         | S0         |

(X = Don't Care)

---

## RTL Architecture

The design consists of:

1. State Register
2. Next-State Logic
3. Output Logic

Insert Block Diagram Here

---

## Verification

A dedicated Verilog testbench was developed to verify:

* Reset functionality
* State holding conditions
* State transitions
* Output correctness
* FSM behavior

### Observed State Sequence

```text
S0 → S0 → S0 → S1 → S2 → S2 → S2 → S3 → S0
```

### Observed Encoded Sequence

```text
00 → 00 → 00 → 01 → 10 → 10 → 10 → 11 → 00
```

Simulation results matched the expected FSM behavior.

---

## Simulation Results

RTL Schematic 

<img width="2434" height="1538" alt="RTL_Schematic" src="https://github.com/user-attachments/assets/54e55a25-38cc-4f8a-9e52-b2576fe6d438" />

Synthesized Schematic
<img width="2430" height="1538" alt="Synthesized_schematic" src="https://github.com/user-attachments/assets/f5b0933e-b2b7-43b8-8b82-d30cc6b8de40" />

Behavioral Simulation
<img width="2408" height="1508" alt="Behavioral_simulation" src="https://github.com/user-attachments/assets/e517ef14-5a43-4238-8b26-3d7f4ee03c0e" />

Post synthesis functional simulation
<img width="2414" height="1540" alt="Post_synthesis _functional_simulation" src="https://github.com/user-attachments/assets/fd5ad2bf-5bab-44bd-87d9-30d106bf1729" />


---

## Tools Used

* Verilog HDL
* Xilinx Vivado 2025.2
* XSIM Simulator

---

## Skills Demonstrated

* Verilog HDL
* RTL Design
* Moore FSM Design
* Sequential Logic Design
* Functional Verification
* Testbench Development
* Digital System Design

---

## Future Improvements

* Timer-Based Traffic Control
* Pedestrian Crossing Support
* Emergency Vehicle Priority
* Multi-Lane Traffic Management
* Adaptive Traffic Control

---

## References

1. M. Morris Mano and Michael D. Ciletti, *Digital Design*, 6th Edition, Pearson Education.

2. David Money Harris and Sarah L. Harris, *Digital Design and Computer Architecture*, Morgan Kaufmann.

3. Samir Palnitkar, *Verilog HDL: A Guide to Digital Design and Synthesis*.

---

## Author

**Aman Mishra**
B.Tech Electronics Engineering
Aspiring RTL Design Engineer | ASIC Design Engineer | FPGA Engineer

LinkedIn: https://www.linkedin.com/in/aman-mishra-17a24b-mishaar/

GitHub: https://github.com/amanmishra2003-EC?tab=repositories
