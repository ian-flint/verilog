default: crc32 writedata crc32_htol

crc32: crc32_tb.v crc32.v
	iverilog -g2012 -o crc32 crc32_tb.v crc32.v

crc32_htol: crc32_htol_tb.v crc32_htol.v
	iverilog -g2012 -o crc32_htol crc32_htol_tb.v crc32_htol.v

writedata: writedata.c
	gcc -o writedata writedata.c
	./writedata
