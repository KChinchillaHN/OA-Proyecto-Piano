`timescale 1ns / 1ps

module ROM(
    input [4:0] address,
    output reg [5:0] data
    );

	//This ROM contains 32 samples of y = sin(x) from x = 0 to x = 2*pi.
	always @ (address)
	begin
		case(address)
			0: data = 6'b100000;
			1: data = 6'b100011;
			2: data = 6'b101001;
			3: data = 6'b110000;
			4: data = 6'b111010;
			5: data = 6'b111010;
			6: data = 6'b111010;
			7: data = 6'b111111;
			8: data = 6'b111111;
			9: data = 6'b111111;
			10: data = 6'b111010;
			11: data = 6'b111010;
			12: data = 6'b110000;
			13: data = 6'b101001;
			14: data = 6'b100100;
			15: data = 6'b011110;
			16: data = 6'b010110;
			17: data = 6'b010010;
			18: data = 6'b001100;
			19: data = 6'b001000;
			20: data = 6'b000100;
			21: data = 6'b000100;
			22: data = 6'b000010;
			23: data = 6'b000010;
			24: data = 6'b000010;
			25: data = 6'b000100;
			26: data = 6'b001100;
			27: data = 6'b010010;
			28: data = 6'b010110;
			29: data = 6'b110000;
			30: data = 6'b111110;
			31: data = 6'b100010;
			default: data = 4'hX;
		endcase
	end
endmodule
