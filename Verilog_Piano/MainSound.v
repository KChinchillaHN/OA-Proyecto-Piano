`timescale 1ns / 1ps

`define SAMPLE_SIZE 32

//Key frequencies in MHz
/*1*/`define DO4_FEQ 261
/*2*/`define DO4sot_FEQ 277
/*3*/`define RE4_FEQ 293
/*4*/`define RE4sot_FEQ 311	
/*5*/`define MI4_FEQ 329
/*6*/`define FA4_FEQ 349
/*7*/`define FA4sot_FEQ 340
/*8*/`define SOL4_FEQ 391
/*9*/`define SOL4sot_FEQ 415
/*10*/`define LA4_FEQ 440
/*11*/`define LA4sot_FEQ 466
/*12*/`define SI4_FEQ 494

/*13*/`define DO5_FEQ 523
/*14*/`define DO5sot_FEQ 554
/*15*/`define RE5_FEQ 587
/*16*/`define RE5sot_FEQ 622	
/*17*/`define MI5_FEQ 659
/*18*/`define FA5_FEQ 698
/*19*/`define FA5sot_FEQ 739
/*20*/`define SOL5_FEQ 783
/*21*/`define SOL5sot_FEQ 830
/*22*/`define LA5_FEQ 880
/*23*/`define LA5sot_FEQ 932
/*24*/`define SI5_FEQ 987

/*25*/`define DO6_FEQ 1046
/*26*/`define DO6sot_FEQ 1108
/*27*/`define RE6_FEQ 1174
/*28*/`define RE6sot_FEQ 1244	
/*29*/`define MI6_FEQ 1318
/*30*/`define FA6_FEQ 1396
/*31*/`define FA6sot_FEQ 1479
/*32*/`define SOL6_FEQ 1567



module MainSound(
    input clk,
    input [31:0] note,
    output reg [5:0] sample
    );
	 
	 parameter
		DO4_FEQ_Key = 32'h80000000,
		DO4sot_FEQ_Key = 32'h40000000,
		RE4_FEQ_Key = 32'h20000000,
		RE4sot_FEQ_Key	= 32'h10000000,
		MI4_FEQ_Key =32'h08000000,
		FA4_FEQ_Key = 32'h04000000,
		FA4sot_FEQ_Key = 32'h02000000,
		SOL4_FEQ_Key =32'h01000000,
		SOL4sot_FEQ_Key = 32'h00800000,
		LA4_FEQ_Key = 32'h00400000,
		LA4sot_FEQ_Key = 32'h00200000,
		SI4_FEQ_Key = 32'h00100000,
		DO5_FEQ_Key = 32'h00080000,
		DO5sot_FEQ_Key = 32'h00040000,
		RE5_FEQ_Key =32'h00020000,
		RE5sot_FEQ_Key	= 32'h00010000,
		MI5_FEQ_Key = 32'h00008000,
		FA5_FEQ_Key =32'h00004000,
		FA5sot_FEQ_Key = 32'h00002000,
		SOL5_FEQ_Key = 32'h00001000,
		SOL5sot_FEQ_Key = 32'h00000800,
		LA5_FEQ_Key = 32'h00000400,
		LA5sot_FEQ_Key = 32'h00000200,
		SI5_FEQ_Key = 32'h00000100,
		DO6_FEQ_Key = 32'h00000080,
		DO6sot_FEQ_Key = 32'h00000040,
		RE6_FEQ_Key = 32'h00000020,
		RE6sot_FEQ_Key	=32'h00000010,
		MI6_FEQ_Key = 32'h00000008,
		FA6_FEQ_Key = 32'h00000004,
		FA6sot_FEQ_Key =32'h00000002,
		SOL6_FEQ_Key = 32'h00000001;
	
	//---------------------------------------------------------------------------------//
	//Clocks
	reg current_clk;
	wire DO4_clk, DO4sot_clk,RE4_clk, RE4sot_clk,MI4_clk,FA4_clk, FA4sot_clk,SOL4_clk, SOL4sot_clk,LA4_clk, LA4sot_clk,SI4_clk;
	wire DO5_clk, DO5sot_clk,RE5_clk, RE5sot_clk,MI5_clk,FA5_clk, FA5sot_clk,SOL5_clk, SOL5sot_clk,LA5_clk, LA5sot_clk,SI5_clk;
	wire DO6_clk, DO6sot_clk,RE6_clk, RE6sot_clk,MI6_clk,FA6_clk, FA6sot_clk,SOL6_clk, SOL6sot_clk,LA6_clk, LA6sot_clk,SI6_clk;
	
	
	Clk_Div #(.divider(`DO4_FEQ * `SAMPLE_SIZE)) DO4(.clk_in(clk), .clk_out(DO4_clk));
	Clk_Div #(.divider(`DO4sot_FEQ * `SAMPLE_SIZE)) DO4sot(.clk_in(clk), .clk_out(DO4sot_clk));
	Clk_Div #(.divider(`RE4_FEQ * `SAMPLE_SIZE)) RE4(.clk_in(clk), .clk_out(RE4_clk));
	Clk_Div #(.divider(`RE4sot_FEQ * `SAMPLE_SIZE)) RE4sot(.clk_in(clk), .clk_out(RE4sot_clk));
	Clk_Div #(.divider(`MI4_FEQ * `SAMPLE_SIZE)) MI4(.clk_in(clk), .clk_out(MI4_clk));
	Clk_Div #(.divider(`FA4_FEQ * `SAMPLE_SIZE)) FA4(.clk_in(clk), .clk_out(FA4_clk));
	Clk_Div #(.divider(`FA4sot_FEQ * `SAMPLE_SIZE)) FA4sot(.clk_in(clk), .clk_out(FA4sot_clk));
	Clk_Div #(.divider(`SOL4_FEQ * `SAMPLE_SIZE)) SOL4(.clk_in(clk), .clk_out(SOL4_clk));
	Clk_Div #(.divider(`SOL4sot_FEQ * `SAMPLE_SIZE)) SOL4sot(.clk_in(clk), .clk_out(SOL4sot_clk));
	Clk_Div #(.divider(`LA4_FEQ * `SAMPLE_SIZE)) LA4(.clk_in(clk), .clk_out(LA4_clk));
	Clk_Div #(.divider(`LA4sot_FEQ * `SAMPLE_SIZE)) LA4sot(.clk_in(clk), .clk_out(LA4sot_clk));
	Clk_Div #(.divider(`SI4_FEQ * `SAMPLE_SIZE)) SI4(.clk_in(clk), .clk_out(SI4_clk));
	
	Clk_Div #(.divider(`DO5_FEQ * `SAMPLE_SIZE)) DO5(.clk_in(clk), .clk_out(DO5_clk));
	Clk_Div #(.divider(`DO5sot_FEQ * `SAMPLE_SIZE)) DO5sot(.clk_in(clk), .clk_out(DO5sot_clk));
	Clk_Div #(.divider(`RE5_FEQ * `SAMPLE_SIZE)) RE5(.clk_in(clk), .clk_out(RE5_clk));
	Clk_Div #(.divider(`RE5sot_FEQ * `SAMPLE_SIZE)) RE5sot(.clk_in(clk), .clk_out(RE5sot_clk));
	Clk_Div #(.divider(`MI5_FEQ * `SAMPLE_SIZE)) MI5(.clk_in(clk), .clk_out(MI5_clk));
	Clk_Div #(.divider(`FA5_FEQ * `SAMPLE_SIZE)) FA5(.clk_in(clk), .clk_out(FA5_clk));
	Clk_Div #(.divider(`FA5sot_FEQ * `SAMPLE_SIZE)) FA5sot(.clk_in(clk), .clk_out(FA5sot_clk));
	Clk_Div #(.divider(`SOL5_FEQ * `SAMPLE_SIZE)) SOL5(.clk_in(clk), .clk_out(SOL5_clk));
	Clk_Div #(.divider(`SOL5sot_FEQ * `SAMPLE_SIZE)) SOL5sot(.clk_in(clk), .clk_out(SOL5sot_clk));
	Clk_Div #(.divider(`LA5_FEQ * `SAMPLE_SIZE)) LA5(.clk_in(clk), .clk_out(LA5_clk));
	Clk_Div #(.divider(`LA5sot_FEQ * `SAMPLE_SIZE)) LA5sot(.clk_in(clk), .clk_out(LA5sot_clk));
	Clk_Div #(.divider(`SI5_FEQ * `SAMPLE_SIZE)) SI5(.clk_in(clk), .clk_out(SI5_clk));
	
	Clk_Div #(.divider(`DO6_FEQ * `SAMPLE_SIZE)) DO6(.clk_in(clk), .clk_out(DO6_clk));
	Clk_Div #(.divider(`DO6sot_FEQ * `SAMPLE_SIZE)) DO6sot(.clk_in(clk), .clk_out(DO6sot_clk));
	Clk_Div #(.divider(`RE6_FEQ * `SAMPLE_SIZE)) RE6(.clk_in(clk), .clk_out(RE6_clk));
	Clk_Div #(.divider(`RE6sot_FEQ * `SAMPLE_SIZE)) RE6sot(.clk_in(clk), .clk_out(RE6sot_clk));
	Clk_Div #(.divider(`MI6_FEQ * `SAMPLE_SIZE)) MI6(.clk_in(clk), .clk_out(MI6_clk));
	Clk_Div #(.divider(`FA6_FEQ * `SAMPLE_SIZE)) FA6(.clk_in(clk), .clk_out(FA6_clk));
	Clk_Div #(.divider(`FA6sot_FEQ * `SAMPLE_SIZE)) FA6sot(.clk_in(clk), .clk_out(FA6sot_clk));
	Clk_Div #(.divider(`SOL6_FEQ * `SAMPLE_SIZE)) SOL6(.clk_in(clk), .clk_out(SOL6_clk));
	
	//---------------------------------------------------------------------------------//
	//Samples	
	wire [5:0] current_sample;
	reg [4:0] current_address;
	
	ROM samples_rom(current_address, current_sample);
	//---------------------------------------------------------------------------------//
	
	always @ (note or DO4_clk or DO4sot_clk or RE4_clk or RE4sot_clk or MI4_clk or FA4_clk or FA4sot_clk or SOL4_clk or SOL4sot_clk or LA4_clk or LA4sot_clk or SI4_clk or
	DO5_clk or DO5sot_clk or RE5_clk or RE5sot_clk or MI5_clk,FA4_clk or FA5sot_clk or SOL4_clk or SOL5sot_clk or LA5_clk or LA5sot_clk or SI5_clk or 
	DO6_clk or DO6sot_clk or RE6_clk or RE6sot_clk or MI6_clk,FA6_clk or FA6sot_clk or SOL6_clk or SOL6sot_clk or LA6_clk or LA6sot_clk or SI6_clk)
	begin
		case(note)
		DO4_FEQ_Key:current_clk = DO4_clk;
		DO4sot_FEQ_Key:current_clk = DO4sot_clk;
		RE4_FEQ_Key :current_clk = RE4_clk;
		RE4sot_FEQ_Key	:current_clk = RE4sot_clk;
		MI4_FEQ_Key:current_clk = MI4_clk;
		FA4_FEQ_Key:current_clk = FA4_clk;
		FA4sot_FEQ_Key:current_clk = FA4sot_clk;
		SOL4_FEQ_Key :current_clk = SOL4_clk;
		SOL4sot_FEQ_Key:current_clk = SOL4sot_clk;
		LA4_FEQ_Key:current_clk = LA4_clk;
		LA4sot_FEQ_Key :current_clk = LA4sot_clk;
		SI4_FEQ_Key :current_clk = SI4_clk;
		DO5_FEQ_Key :current_clk = DO5_clk;
		DO5sot_FEQ_Key :current_clk = DO5sot_clk;
		RE5_FEQ_Key :current_clk = RE5_clk;
		RE5sot_FEQ_Key	:current_clk = RE5sot_clk;
		MI5_FEQ_Key :current_clk = MI5_clk;
		FA5_FEQ_Key :current_clk = FA5_clk;
		FA5sot_FEQ_Key :current_clk = FA5sot_clk;
		SOL5_FEQ_Key :current_clk = SOL5_clk;
		SOL5sot_FEQ_Key :current_clk = SOL5sot_clk;
		LA5_FEQ_Key :current_clk = LA5_clk;
		LA5sot_FEQ_Key :current_clk = LA5sot_clk;
		SI5_FEQ_Key :current_clk = SI5_clk;
		DO6_FEQ_Key:current_clk = DO6_clk;
		DO6sot_FEQ_Key :current_clk = DO6sot_clk;
		RE6_FEQ_Key :current_clk = RE6_clk;
		RE6sot_FEQ_Key	:current_clk = RE6sot_clk;
		MI6_FEQ_Key :current_clk = MI6_clk;
		FA6_FEQ_Key :current_clk = FA6_clk;
		FA6sot_FEQ_Key :current_clk = FA6sot_clk;
		SOL6_FEQ_Key :current_clk = SOL6_clk;
			default: current_clk = current_clk;
		endcase
	end
	
	always @ (posedge current_clk)
	begin
		sample <= current_sample;
		if(current_address < `SAMPLE_SIZE)
			current_address <= current_address + 1;
		else
			current_address <= 0;
	end
	
	initial
	begin
		sample = 0;
		current_clk = 0;
		current_address = 0;
	end
	
endmodule
