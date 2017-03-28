`timescale 1ns / 1ps

module Piano_VGA(
    input clk50mhz,
    input reset,
	 input [5:0] tecla,
    output [2:0] RGB,
    output H_sync,
    output V_sync
    );

	reg vga_clk;
	
	// synthesis attribute CLKFX_DIVIDE of vga_clock_dcm is 4
	// synthesis attribute CLKFX_MULTIPLY of vga_clock_dcm is 2
	//DCM_SP#(.CLKFX_DIVIDE(4), .CLKFX_MULTIPLY(2)) vga_clock_dcm (.CLKIN(clk50mhz), .CLKFX(vga_clk));
	
	always @ (posedge clk50mhz)
		begin
			vga_clk = !vga_clk;
		end
		
	Logica_VGA vga_logic (vga_clk, reset, tecla, RGB, H_sync, V_sync);

endmodule
