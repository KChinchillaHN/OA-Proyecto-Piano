`timescale 1ns / 1ps

module Logica_VGA(
    input clock,
	 input reset,
	 input [5:0]tecla,
    output reg [2:0] RGB,
	 output reg H_sync,
    output reg V_sync
    );

	reg[9:0] H_count;
	reg[9:0] V_count;
	
	always @ (posedge clock)
	begin
		if(reset)
			{H_count, V_count, RGB} = {10'd0, 10'd0, 3'b0};
		else
		begin
			if(H_count == 799)
			begin
				H_count = 0;
				if(V_count == 524)
					V_count = 0;
				else
					V_count = V_count + 1;
			end
			else
				H_count = H_count + 1;
		end
		
		if(V_count >= 490 && V_count < 492)
			V_sync = 0;
		else
			V_sync = 1;
			
		if(H_count >= 656 && H_count < 752)
			H_sync = 0;
		else
			H_sync = 1;
			
		if(H_count < 640 && V_count < 480)
		begin
		 	if(V_count > 12 && V_count <= 228||V_count > 252 && V_count <= 468)
			begin
				if(H_count >=12 && H_count <= 43)//1
					begin
						if (tecla == 6'b000001 && V_count > 12 && V_count <= 228)
							RGB = 3'b101;
						else
						begin
							if (tecla == 6'b010001 && V_count > 252 && V_count <= 468)
								RGB = 3'b101;
							else
								RGB = 3'b111;
						end
					end
				else
				begin
					if(H_count >=51 && H_count <= 82)//2
						begin
							if (tecla == 6'b000010 && V_count > 12 && V_count <= 228)
							RGB = 3'b101;
							else
							begin
								if (tecla == 6'b010010 && V_count > 252 && V_count <= 468)
									RGB = 3'b101;
								else
									RGB = 3'b111;
							end
						end
					else
					begin
						if(H_count >=90 && H_count <= 121)//3
						begin	
							if (tecla == 6'b000011 && V_count > 12 && V_count <= 228)
								RGB = 3'b101;
							else
							begin
								if (tecla == 6'b010011 && V_count > 252 && V_count <= 468)
									RGB = 3'b101;
								else
									RGB = 3'b111;
							end
						end	
						else
						begin
							if(H_count >=129 && H_count <= 160)//4
							begin
								if (tecla == 6'b000100 && V_count > 12 && V_count <= 228)
									RGB = 3'b101;
								else
								begin
									if (tecla == 6'b010100 && V_count > 252 && V_count <= 468)
										RGB = 3'b101;
									else
										RGB = 3'b111;
								end
							end	
							else
							begin
								if(H_count >=168 && H_count <= 199)//5
								begin
									if (tecla == 6'b000101 && V_count > 12 && V_count <= 228)
										RGB = 3'b101;
									else
									begin
										if (tecla == 6'b010101 && V_count > 252 && V_count <= 468)
											RGB = 3'b101;
										else
											RGB = 3'b111;
									end
								end	
								else
								begin
									if(H_count >=207 && H_count <= 238)//6
									begin
										if (tecla == 6'b000110 && V_count > 12 && V_count <= 228)
											RGB = 3'b101;
										else
										begin
											if (tecla == 6'b010110 && V_count > 252 && V_count <= 468)
												RGB = 3'b101;
											else
												RGB = 3'b111;
										end
									end
									else
									begin
										if(H_count >=246 && H_count <= 277)//7
										begin
											if (tecla == 6'b000111 && V_count > 12 && V_count <= 228)
												RGB = 3'b101;
											else
											begin
												if (tecla == 6'b010111 && V_count > 252 && V_count <= 468)
													RGB = 3'b101;
												else
													RGB = 3'b111;
											end
										end	
										else
										begin
											if(H_count >=285 && H_count <= 316)//8
											begin
												if (tecla == 6'b001000 && V_count > 12 && V_count <= 228)
													RGB = 3'b101;
												else
												begin
													if (tecla == 6'b011000 && V_count > 252 && V_count <= 468)
														RGB = 3'b101;
													else
														RGB = 3'b111;
												end
											end
											else 
											begin
												if(H_count >=324 && H_count <= 355)//9
												begin
													if (tecla == 6'b001001 && V_count > 12 && V_count <= 228)
														RGB = 3'b101;
													else
													begin
														if (tecla == 6'b011001 && V_count > 252 && V_count <= 468)
															RGB = 3'b101;
														else
															RGB = 3'b111;
													end
												end
												else
												begin
													if(H_count >=363 && H_count <= 394)//10
													begin
															if (tecla == 6'b001010 && V_count > 12 && V_count <= 228)
																RGB = 3'b101;
															else
															begin
																if (tecla == 6'b011010 && V_count > 252 && V_count <= 468)
																	RGB = 3'b101;
																else
																	RGB = 3'b111;
															end
														
													end	
													else
													begin
														if(H_count >=402 && H_count <= 433)//11
														begin
															if (tecla == 6'b001011 && V_count > 12 && V_count <= 228)
																RGB = 3'b101;
															else
															begin
																if (tecla == 6'b011011 && V_count > 252 && V_count <= 468)
																	RGB = 3'b101;
																else
																	RGB = 3'b111;
															end
														end	
														else
														begin
															if(H_count >=441 && H_count <= 472)//12
															begin
																if (tecla == 6'b001100 && V_count > 12 && V_count <= 228)
																	RGB = 3'b101;
																else
																begin
																	if (tecla == 6'b011100 && V_count > 252 && V_count <= 468)
																		RGB = 3'b101;
																	else
																		RGB = 3'b111;
																end
															end
															else
															begin
																if(H_count >=480 && H_count <= 511)//13
																begin
																	if (tecla == 6'b001101 && V_count > 12 && V_count <= 228)
																		RGB = 3'b101;
																	else
																	begin
																		if (tecla == 6'b011101 && V_count > 252 && V_count <= 468)
																			RGB = 3'b101;
																		else
																			RGB = 3'b111;
																	end
																end
																else
																begin
																	if(H_count >=519 && H_count <= 550)//14
																	begin
																		if (tecla == 6'b001110 && V_count > 12 && V_count <= 228)
																			RGB = 3'b101;
																		else
																		begin
																			if (tecla == 6'b011110 && V_count > 252 && V_count <= 468)
																				RGB = 3'b101;
																			else
																				RGB = 3'b111;
																		end
																	end
																	else 
																	begin
																		if(H_count >=558 && H_count <= 589)//15
																		begin
																			if (tecla == 6'b001111 && V_count > 12 && V_count <= 228)
																				RGB = 3'b101;
																			else
																			begin
																				if (tecla == 6'b011111 && V_count > 252 && V_count <= 468)
																					RGB = 3'b101;
																				else
																					RGB = 3'b111;
																			end
																		end	
																		else
																		begin
																			if(H_count >= 597 && H_count <= 628)//16
																			begin
																				if (tecla == 6'b010000 && V_count > 12 && V_count <= 228)
																					RGB = 3'b101;
																				else
																				begin
																					if (tecla == 6'b100000 && V_count > 252 && V_count <= 468)
																						RGB = 3'b101;
																					else
																						RGB = 3'b111;
																				end
																			end
																			else
																				RGB = 3'b000;	
																		end	
																	end	
																end		
															end		
														end				 
													end		
												end
											end
										end 		
									end
								end
							end
						end	
					end	
				end	
				
			end
			else 
			  RGB = 3'b000;	
		
		end
		else
			RGB = 3'b000;
	end
endmodule
