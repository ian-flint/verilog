default: adder mult tb and counter dff and_or mux demux

mux: mux.v
	iverilog -o mux mux.v

demux: demux.v
	iverilog -o demux demux.v

counter: counter.v
	iverilog -o counter counter.v

adder: adder.v adder_tb.v
	iverilog -o adder -c adder.txt

mult: mult.v mult_tb.v
	iverilog -o mult mult.v mult_tb.v

dff: dff.v 
	iverilog -o dff dff.v

and_or: and_or.v 
	iverilog -o and_or and_or.v

and: and.v 
	iverilog -o and and.v

tb: tb.v
	iverilog -o tb tb.v
