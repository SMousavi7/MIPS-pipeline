`timescale 1ps/1ps

module registers (input clock,input flush,input hold,input memory_RD_IN,
input ALU_IN,input memory_WR_IN,input [10:0]address_for_memory_RD_IN,
input [31:0]data_for_RD_IN,input [4:0]address_for_register_RD_IN,
input [2:0] ALU_OP_IN,input [4:0]address_for_register0_IN,
input [4:0]address_for_register1_IN,input [4:0]address_for_register2_IN,
input [31:0]IM_IN,input [31:0]result_IN,input cmp_in,input [10:0]address_for_memory_WR_IN,
input [31:0]data_for_WR_IN,output reg memory_RD,output reg ALU,output reg memory_WR,output reg[10:0]address_for_memory_RD,
output reg[31:0]data_for_RD,output reg[4:0]address_for_register_RD,output reg[2:0] ALU_OP,output reg[4:0]address_for_register0,
output reg[4:0]address_for_register1,output reg[4:0]address_for_register2,output reg[31:0]IM,
output reg[31:0]result,output reg cmp,output reg[10:0]address_for_memory_WR,output reg[31:0]data_for_WR);

always @(posedge clock) begin
	#10;
	if (flush) begin // agar niaz be flush bood in ejra mishe agar na on yeki
		memory_RD = 0;
	 	ALU = 0;
	 	memory_WR = 0;
		address_for_memory_RD = 11'd0;
		data_for_RD = 32'd0;
		address_for_register_RD = 5'd0;
		ALU_OP = 3'd0;
		address_for_register0 = 5'd0;
		address_for_register1 = 5'd0;
		address_for_register2 = 5'd0;
		IM = 32'd0;
		result = 32'd0;
	 	cmp = 0;
		address_for_memory_WR = 11'd0;
		data_for_WR = 32'd0;
	end else if(!hold) begin
		memory_RD <= memory_RD_IN;
	 	ALU <= ALU_IN;
	 	memory_WR <= memory_WR_IN;
		address_for_memory_RD <= address_for_memory_RD_IN;
		data_for_RD <= data_for_RD_IN;
		address_for_register_RD <= address_for_register_RD_IN;
		ALU_OP <= ALU_OP_IN;
		address_for_register0 <= address_for_register0_IN;
		address_for_register1 <= address_for_register1_IN;
		address_for_register2 <= address_for_register2_IN;
		IM <= IM_IN;
		result <= result_IN;
	 	cmp <= cmp_in;
		address_for_memory_WR <= address_for_memory_WR_IN;
		data_for_WR <= data_for_WR_IN;
	end
end
	
endmodule