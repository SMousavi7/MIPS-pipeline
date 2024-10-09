`timescale 1ps/1ps

`define LI 3'b000
`define ADI 3'b001
`define ADD 3'b010
`define CMP 3'b011
`define LW  3'b100
`define SW  3'b101
`define J   3'b110
`define BEQ 3'b111

module controler (input clock,input[31:0] instruction_IN,output reg memory_RD,output reg ALU,output reg memory_WR,
output reg[10:0]address_for_memory_RD,output reg[31:0]data_for_RD,output reg[4:0]address_for_register_RD,output reg[2:0]ALU_OP,
output reg[4:0]address_for_register0,output reg[4:0]address_for_register1,output reg[4:0]address_for_register2,
output reg[31:0]IM,output reg[31:0]result,output reg cmp,output reg[10:0]address_for_memory_WR,output reg[31:0]data_for_WR);

always @(posedge clock) 
begin
	ALU_OP <= instruction_IN[31:29];
	case (instruction_IN[31:29])
		`LI: 
		begin
			memory_WR <= 0;
			ALU <= 1;
			address_for_register0 <= instruction_IN[28:24];
			IM <= instruction_IN[23:0];
		end
		`LW: 
		begin
			memory_WR <= 0;
			ALU <= 0;
			address_for_memory_RD <= instruction_IN[10:0];
			address_for_register_RD <= instruction_IN[28:24];
		end 
		`ADD: 
		begin
			memory_WR <= 0;
			ALU <= 1;
			address_for_register0 <= instruction_IN[28:24];
			address_for_register1 <= instruction_IN[23:19];
			address_for_register2 <= instruction_IN[18:14];
		end
		`ADI: 
		begin
			memory_WR <= 0;
			ALU <= 1;
			address_for_register0 <= instruction_IN[28:24];
			address_for_register1 <= instruction_IN[23:19];
			IM <= instruction_IN[7:0];
		end
		`J: 
		begin
			memory_WR <= 0;
			ALU <= 0;
			IM <= instruction_IN[7:0];
		end
		`BEQ: 
		begin
			memory_WR <= 0;
			ALU <= 0;
			address_for_register0 <= instruction_IN[28:24];
			address_for_register1 <= instruction_IN[23:19];
			IM <= instruction_IN[7:0];
		end
		`SW: 
		begin
			ALU <= 0;
			address_for_memory_WR <= instruction_IN[10:0];
			data_for_WR <= instruction_IN[28:24];
			memory_WR <= 1;
		end
	endcase
end
	
endmodule