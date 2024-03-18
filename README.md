# transitions_ckt
 based on input data , find which 1->0 / 0->1 transition is more or equall.
 

 at reset condition ff-> data_q is at 0.
 so output is only change whenever data_i(input) is 1, This will assert rising_o. we will never get falling_o asserted because of reset condition.


 suppose below is data input
 00000000000000000000000000111111100000000000111111100000

 in case of above data you will get rising edge 1st the whenever you get a falling edge , both rising and falling is equall and you will not get any falling edge.

########
 so to test falling edge reset the data_q ff to 1.

 Thanks.
