module memory (input clock,input memory_RD_IN,input ALU_IN,input memory_WR_IN,input [10:0]address_for_memory_RD_IN,
input [31:0]data_for_RD_IN,input [4:0]address_for_register_RD_IN,input [2:0]ALU_OP_IN,input [4:0]address_for_register0_IN,
input [4:0]address_for_register1_IN,input [4:0]address_for_register2_IN,input [31:0]IM_IN,input [31:0]result_IN,
input cmp_IN,input [10:0]address_for_memory_WR_IN,input [31:0]data_for_WR_IN,output reg [31:0] data_for_RD_out);

reg [31:0] memory[0:2047]; // 2048(2 ^ 11) khoneye hafezeye 32 biti

initial 
begin
	memory[7] = 32'd1;
	memory[8] = 32'd1;
end

always @(negedge clock) 
begin
	data_for_RD_out <= memory[address_for_memory_RD_IN];
end

always @(posedge clock) 
begin
	if (memory_WR_IN) 
	begin
		memory[address_for_memory_WR_IN] <= data_for_WR_IN;
	end
end

endmodule