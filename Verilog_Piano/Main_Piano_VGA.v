`timescale 1ns / 1ps

module Main_Piano_VGA(
	input clock,
	input reset,
	input [5:0] teclas,
	output H_sync,
	output V_sync,
	output [2:0]RGB,
	output [5:0]sound4
	 );
reg [31:0] teclasSound;	 
Piano_VGA vga(clock,reset, teclas, RGB, H_sync, V_sync);

always @(teclas)
begin
	case (teclas)
		6'b000000: teclasSound = 32'h00000000;
		6'b000001: teclasSound = 32'h00000001;
		6'b000010: teclasSound = 32'h00000002;
		6'b000011: teclasSound = 32'h00000004;
		6'b000100: teclasSound = 32'h00000008;
		6'b000101: teclasSound = 32'h00000010;
		6'b000110: teclasSound = 32'h00000020;
		6'b000111: teclasSound = 32'h00000040;
		6'b001000: teclasSound = 32'h00000080;
		6'b001001: teclasSound = 32'h00000100;
		6'b001010: teclasSound = 32'h00000200;
		6'b001011: teclasSound = 32'h00000400;
		6'b001100: teclasSound = 32'h00000800;
		6'b001101: teclasSound = 32'h00001000;
		6'b001110: teclasSound = 32'h00002000;
		6'b001111: teclasSound = 32'h00004000;
		6'b010000: teclasSound = 32'h00008000;
		6'b010001: teclasSound = 32'h00010000;
		6'b010010: teclasSound = 32'h00020000;
		6'b010011: teclasSound = 32'h00040000;
		6'b010100: teclasSound = 32'h00080000;
		6'b010101: teclasSound = 32'h00100000;
		6'b010110: teclasSound = 32'h00200000;
		6'b010111: teclasSound = 32'h00400000;
		6'b011000: teclasSound = 32'h00800000;
		6'b011001: teclasSound = 32'h01000000;
		6'b011010: teclasSound = 32'h02000000;
		6'b011011: teclasSound = 32'h04000000;
		6'b011100: teclasSound = 32'h08000000;
		6'b011101: teclasSound = 32'h10000000;
		6'b011110: teclasSound = 32'h20000000;
		6'b011111: teclasSound = 32'h40000000;
		6'b100000: teclasSound = 32'h80000000;
	endcase
end
MainSound sound(clock,teclasSound,sound4);
endmodule
