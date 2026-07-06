# GCD---Greatest-Common-Divisor

This project implements a 16-bit Greatest Common Divisor (GCD) calculator in VHDL using the RTL (Register Transfer Level) design methodology. The design is based on the Euclidean subtraction algorithm, where the larger operand is repeatedly reduced by subtracting the smaller operand until both values become equal. The final value represents the GCD of the two input numbers.

The architecture follows the classical FSMD (Finite State Machine with Datapath) approach. The Datapath contains registers, comparators, multiplexers, and subtractors for data processing, while the Controller is implemented as a finite state machine (FSM) that generates control signals and manages the computation sequence.

The design was modeled in VHDL, verified through simulation in ModelSim, and synthesized as a hardware-oriented implementation. This project demonstrates fundamental RTL design concepts including algorithm-to-hardware transformation, FSMD modeling, datapath/controller partitioning, FSM design, and functional verification.

The design is based on this document: 
https://dayhocstem.com/blog/2020/04/ma-nguon-vhdl-muc-rtl-mach-lsi-tim-uoc-so-chung-lon-nhat-cua-hai-so.html
