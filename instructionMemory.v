`timescale 1ps/1ps

module instrmem (input clock,input [4:0]PC,output reg[31:0] instruction_memory_out);
	
reg [31:0] memtemp [0:15];

initial begin
    $readmemb ("instructions.mem", memtemp); // Read the instructions from a file
end

always @(posedge clock) begin
	instruction_memory_out <= memtemp[PC];
end

endmodule