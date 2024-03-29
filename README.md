# transitions_ckt
 based on input data , find which 1->0 / 0->1 transition is more or equall.
 

 at reset condition ff-> data_q is at 0.
 so output is only change whenever data_i(input) is 1, This will assert rising_o. we will never get falling_o asserted because of reset condition.


 suppose below is data input
 00000000000000000000000000111111100000000000111111100000

 in case of above data you will get rising edge 1st the whenever you get a falling edge , both rising and falling is equall and you will not get any falling edge.

########
 so to test falling edge reset the data_q ff to 1.


### RTL Description: Transitions Circuit

- **Engineer**: Abhishek Kumar Kushwaha
- **Date Created**: March 18, 2024
- **Module Name**: transitions_ckt
- **Company**: College of VLSI
- **Revision**: Revision 0.01 - File Created

#### Overview:
The `transitions_ckt` module is designed to detect transitions in a data stream, specifically 0 to 1 transitions (`rising_o`) and 1 to 0 transitions (`falling_o`). It also outputs when the input remains equal (`equall_o`).

#### Functional Description:
- **Inputs**: 
  - `data_i`: Input data stream.
  - `clk`: Clock signal.
  - `rst`: Reset signal.
- **Outputs**:
  - `equall_o`: Output indicating when the input remains equal.
  - `rising_o`: Output indicating when a rising edge (0 to 1 transition) is detected.
  - `falling_o`: Output indicating when a falling edge (1 to 0 transition) is detected.
- **Internal Signals**:
  - `r_edge`: Signal indicating the detection of a rising edge.
  - `f_edge`: Signal indicating the detection of a falling edge.
  - `present_state`: Register storing the present state of the state machine.
  - `next_state`: Register storing the next state of the state machine.
  - `data_q`: Register storing the previous value of the input data stream.
  - `equall_w`, `rising_w`, `falling_w`: Signals indicating whether the current state corresponds to remaining equal, rising, or falling edge respectively.
- **State Machine**:
  - The module implements a state machine with three states: `EQUALL`, `RISING`, and `FALLING`.
  - The state transitions are determined based on the detection of rising and falling edges in the input data stream.
- **Edge Detection**:
  - The rising and falling edge detectors are implemented using AND gates and assign statements.
- **Reset Handling**:
  - On reset (`rst`), the present state is initialized to `EQUALL`, and the data queue is cleared.
- **Dependencies**:
  - This module has no external dependencies.

#### Additional Comments:
- The module efficiently detects transitions in a data stream, providing valuable information about the behavior of the signal over time.
