# Traffic Light Controller Finite State Machine

## Project Overview
[cite_start]This project implements a finite state machine (FSM) for a traffic light controller managing a four-way intersection[cite: 13]. [cite_start]The system alternates traffic flow between North-South (NS) and East-West (EW) directions using synchronous logic to ensure safety and efficiency[cite: 13].

## System Specifications
- [cite_start]**Inputs:** Clock (`clk`), Synchronous Reset (`rst`), and a Sensor input (reserved for future adaptive detection)[cite: 15].
- [cite_start]**Outputs:** Control signals for Red, Yellow, and Green lights in both NS and EW directions[cite: 16].
- [cite_start]**Timing Logic:** - **NS Green / EW Green:** 30 clock cycles[cite: 14].
  - [cite_start]**NS Yellow / EW Yellow:** 5 clock cycles[cite: 14].
- [cite_start]**Safety:** Combinational logic ensures no simultaneous green lights across perpendicular paths[cite: 16].

## Finite State Machine (FSM)
The controller cycles through four encoded states:
1. [cite_start]**NS_GREEN (2'b00):** NS Green and EW Red are active [cite: 81, 145-147].
2. [cite_start]**NS_YELLOW (2'b01):** NS Yellow and EW Red are active [cite: 82, 149-151].
3. [cite_start]**EW_GREEN (2'b10):** EW Green and NS Red are active [cite: 83, 153-155].
4. [cite_start]**EW_YELLOW (2'b11):** EW Yellow and NS Red are active [cite: 84, 157-159].


## Simulation Results
[cite_start]Simulation was performed for 400ns to verify state transitions[cite: 50, 197]. 
- [cite_start]**Reset:** System initializes to NS_GREEN when `rst` is high[cite: 52, 94].
- [cite_start]**Transitions:** State changes occur when the 6-bit counter reaches the defined timing thresholds (29 for Green, 4 for Yellow)[cite: 57, 60].
- [cite_start]**Safety Check:** No overlapping green phases were observed, validating the design's reliability[cite: 56, 65].

## Authors
- [cite_start]Ganesh Manjunath [cite: 2]
- [cite_start]Aryan Verma [cite: 6]
- [cite_start]Instructor: Prof. Carl Sechen [cite: 9]
