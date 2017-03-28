`timescale 1ns / 1ps

module Logica_Teclas(
	input B_derecha,
	input B_izquierda,
	output reg [5:0]Num_tecla_out
	);
	
	always @(B_derecha or B_izquierda)
		begin 
			if(B_derecha)
				Num_tecla_out = 6'b000001;
			else if (B_izquierda)
				Num_tecla_out = 6'b000010;
			else
				Num_tecla_out = 6'b000000;
		end

endmodule
