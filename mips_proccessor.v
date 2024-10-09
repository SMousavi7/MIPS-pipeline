`timescale 1ps/1ps
`include "ALU.v"
`include "controler.v"
`include "instructionMemory.v"
`include "memory.v"
`include "registers.v"


module top (); //hamon mal mips hastesh

reg [31:0] registers[31:0];
integer i;
initial 
begin
    $dumpfile("wave.vcd");
    $dumpvars(0, top);
	for (i = 0; i < 32; i = i + 1) begin
		registers[i] <= 0;
	end

end

always #500 registers[0] = 32'd0;

reg clock = 0;

always #500 clock = ~clock; //in clock hast ke ta abad edame dare
reg [4:0] PC = 5'd0;
wire [31:0]instructions;


instrmem imem(clock, PC, instructions);



reg [0:2] flush = 3'd0;
reg [0:2] hold = 3'd0;
wire memory_RD_outDec;
wire ALU_outDec;
wire memory_WR_outDec;
wire[10:0]address_for_memory_RD_outDec;
wire[31:0]data_for_RD_outDec;
wire[4:0]address_for_register_RD_outDec;
wire[2:0] ALU_OP_outDec;
wire[4:0]address_for_register0_outDec;
wire[4:0]address_for_register1_outDec;
wire[4:0]address_for_register2_outDec;
wire[31:0]IM_outDec;
wire[31:0]result_outDec;
wire cmp_outDec;
wire[10:0]address_for_memory_WR_outDec;
wire[31:0]data_for_WR_outDec;


controler decoding(clock, instructions, memory_RD_outDec, ALU_outDec, memory_WR_outDec, address_for_memory_RD_outDec, data_for_RD_outDec,
	address_for_register_RD_outDec, ALU_OP_outDec, address_for_register0_outDec, address_for_register1_outDec, address_for_register2_outDec,
	IM_outDec, result_outDec, cmp_outDec, address_for_memory_WR_outDec, data_for_WR_outDec);


//----------------------------------------------------------------------------------------------------

wire memory_RD_toMemory;
wire ALU_toMemory;
wire memory_WR_toMemory;
wire[10:0]address_for_memory_RD_toMemory;
wire[31:0]data_for_RD_toMemory;
wire[4:0]address_for_register_RD_toMemory;
wire[2:0] ALU_OP_toMemory;
wire[4:0]address_for_register0_toMemory;
wire[4:0]address_for_register1_toMemory;
wire[4:0]address_for_register2_toMemory;
wire[31:0]IM_toMemory;
wire[31:0]result_toMemory;
wire cmp_toMemory;
wire[10:0]address_for_memory_WR_toMemory;
wire[31:0]data_for_WR_toMemory;
reg [31:0]data_for_WR_outDec_register = 32'd0;
reg [10:0]address_for_memory_WR_outDec_register = 11'd0;
wire memory_RD_toMemory2;
wire ALU_toMemory2;
wire memory_WR_toMemory2;
wire[10:0]address_for_memory_RD_toMemory2;
wire[31:0]data_for_RD_toMemory2;
wire[4:0]address_for_register_RD_toMemory2;
wire[2:0] ALU_OP_toMemory2;
wire[4:0]address_for_register0_toMemory2;
wire[4:0]address_for_register1_toMemory2;
wire[4:0]address_for_register2_toMemory2;
wire[31:0]IM_toMemory2;
wire[31:0]result_toMemory2;
wire cmp_toMemory2;
wire[10:0]address_for_memory_WR_toMemory2;
wire[31:0]data_for_WR_toMemory2;



registers reg0(clock, flush[0], hold[0],memory_RD_outDec, ALU_outDec, memory_WR_outDec, address_for_memory_RD_outDec, data_for_RD_outDec,address_for_register_RD_outDec, 
	ALU_OP_outDec, address_for_register0_outDec, address_for_register1_outDec, address_for_register2_outDec, IM_outDec, result_outDec, 
	cmp_outDec, address_for_memory_WR_outDec_register, data_for_WR_outDec_register,memory_RD_toMemory, ALU_toMemory, memory_WR_toMemory,
	address_for_memory_RD_toMemory, data_for_RD_toMemory, address_for_register_RD_toMemory,ALU_OP_toMemory, address_for_register0_toMemory,
	address_for_register1_toMemory, address_for_register2_toMemory, IM_toMemory, result_toMemory,cmp_toMemory, address_for_memory_WR_toMemory2, data_for_WR_toMemory);

//----------------------------------------------------------------------------------------------------------------------------------------------

wire[31:0]data_rd_outMem;

memory data_memory(clock,memory_RD_toMemory, ALU_toMemory, memory_WR_toMemory2, address_for_memory_RD_toMemory, data_for_RD_toMemory,
	address_for_register_RD_toMemory, ALU_OP_toMemory, address_for_register0_toMemory, address_for_register1_toMemory, address_for_register2_toMemory,
	IM_toMemory, result_toMemory, cmp_toMemory, address_for_memory_WR_toMemory2, data_for_WR_toMemory,data_rd_outMem);




wire memory_RD_toALU;
wire ALU_toALU;
wire memory_WR_toALU;
wire[10:0]address_for_memory_RD_toALU;
wire[31:0]data_for_RD_toALU;
wire[4:0]address_for_register_Rd_toALU;
wire[2:0] ALU_OP_toALU;
wire[4:0]address_for_register0_toALU;
wire[4:0]address_for_register1_toALU;
wire[4:0]address_for_register2_toALU;
wire[31:0]IM_toALU;
wire[31:0]result_toALU;
wire cmp_toALU;
wire[10:0]address_for_memory_WR_toALU;
wire[31:0]data_for_WR_toALU;




registers reg1(clock, flush[1], hold[1], 
	memory_RD_toMemory, ALU_toMemory, memory_WR_toMemory, address_for_memory_RD_toMemory, data_rd_outMem,
	address_for_register_RD_toMemory, ALU_OP_toMemory, address_for_register0_toMemory, address_for_register1_toMemory, address_for_register2_toMemory,
	IM_toMemory, result_toMemory, cmp_toMemory, address_for_memory_WR_toMemory, data_for_WR_toMemory,
	memory_RD_toALU, ALU_toALU, memory_WR_toALU, address_for_memory_RD_toALU, data_for_RD_toALU, address_for_register_Rd_toALU,
	ALU_OP_toALU, address_for_register0_toALU, address_for_register1_toALU, address_for_register2_toALU, IM_toALU, result_toALU,
	cmp_toALU, address_for_memory_WR_toALU, data_for_WR_toALU
);




reg[31:0] first_num, second_num;
wire [31:0] result_outALU;
wire cmp_outALU;
ALU alu(clock, ALU_toALU, ALU_OP_toALU, first_num, second_num, IM_toALU, result_outALU, cmp_outALU);




registers reg3(clock, flush[2], hold[2],memory_RD_toALU, ALU_toALU, memory_WR_toALU, address_for_memory_RD_toALU, data_for_RD_toALU, address_for_register_Rd_toALU,
	ALU_OP_toALU, address_for_register0_toALU, address_for_register1_toALU, address_for_register2_toALU, IM_toALU, result_outALU,
	cmp_outALU, address_for_memory_WR_toALU, result_outALU,memory_RD_toMemory2, ALU_toMemory2, memory_WR_toMemory2, address_for_memory_RD_toMemory2, data_for_RD_toMemory2, address_for_register_RD_toMemory2,
	ALU_OP_toMemory2, address_for_register0_toMemory2, address_for_register1_toMemory2, address_for_register2_toMemory2, IM_toMemory2, result_toMemory2,cmp_toMemory2, address_for_memory_WR_toMemory2, data_for_WR_toMemory2
);

`define LI 3'b000
`define ADI 3'b001
`define ADD 3'b010
`define CMP 3'b011
`define LW  3'b100
`define ST  3'b101
`define J   3'b110
`define BEQ 3'b111

reg [31:0] first;
reg [31:0] second;
reg [31:0] fibo;

always @(posedge clock) 
begin
	data_for_WR_outDec_register <= registers[data_for_WR_outDec[4:0]];
	address_for_memory_WR_outDec_register <= registers[address_for_memory_WR_outDec[4:0]];
	if(ALU_OP_toMemory2 == `LW)
	begin
		registers[address_for_register_RD_toMemory2] = data_for_RD_toMemory2;
	end
	if(ALU_toMemory2) 
	begin
		registers[address_for_register0_toMemory2] = result_toMemory2;
	end
	if(hold) //inja dare forwardingo handle mikone
	begin
		if(address_for_register1_toMemory == address_for_register0_toALU)
		begin
			first_num <= result_outALU;
		end
		else
		begin
			first_num <= registers[address_for_register1_toALU];
		end
		if(address_for_register2_toMemory == address_for_register0_toALU)
		begin
			second_num <= result_outALU;
		end
		else
		begin
			second_num <= registers[address_for_register2_toALU];
		end
		first_num <= result_outALU;
		second_num <= result_outALU;
	end
	else
	begin
	first_num <= registers[address_for_register1_toMemory];
	second_num <= registers[address_for_register2_toMemory];
	end
	flush[2] = 0;
	flush[1] = 0;
	flush[0] = 0;
	if(ALU_OP_outDec == `J) 
	begin
		PC = IM_outDec[4:0];
		flush[0] = 1;
	end 
	else if(ALU_OP_outDec == `BEQ && registers[address_for_register0_outDec] == registers[address_for_register1_outDec]) 
	begin
		PC = IM_outDec[4:0];
		flush[0] = 1;
	end else begin
		PC <= PC + 1;
	end
	if(PC == 5'd16) 
	begin
		$finish;
	end
	first_out = registers[1];
 	second_out = registers[2];
 	fibo = registers[5];

	for (i = 0; i < 32; i = i + 1) 
	begin

		if(i == 1 || i == 2 || i == 5 || i == 6 || i == 7)
		begin
		$display("reg[%2d] = %2d", i, registers[i]);
		end
	end
	$display("\n");
end

endmodule