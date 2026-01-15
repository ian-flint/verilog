default: adder mult tb and counter dff and_or mux demux srff jkff msdff tff actr sctr bsctr gctr

gctr: gctr.v gctr_tb.v jkff.v
	iverilog -o gctr gctr.v jkff.v gctr_tb.v

bsctr: bsctr.v bsctr_tb.v jkff.v
	iverilog -o bsctr bsctr.v jkff.v bsctr_tb.v

sctr: sctr.v sctr_tb.v jkff.v
	iverilog -o sctr sctr.v jkff.v sctr_tb.v

actr: actr.v actr_tb.v jkff.v
	iverilog -o actr actr.v jkff.v actr_tb.v

tff: tff.v
	iverilog -o tff tff.v

msdff: msdff.v
	iverilog -o msdff msdff.v

jkff: jkff.v jkff_tb.v
	iverilog -o jkff jkff.v jkff_tb.v

srff: srff.v
	iverilog -o srff srff.v

mux: mux.v
	iverilog -o mux mux.v

demux: demux.v
	iverilog -o demux demux.v

counter: counter.v
	iverilog -o counter counter.v

adder: adder.v
	iverilog -g2005 -o adder adder.v

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
