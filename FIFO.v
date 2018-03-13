module FIFO(wclk,wr,datin,rclk,rd,datout,full,empy,dato,rst);
// Inputs and Outputs 
	input wclk;
	input wr;
	input [dato_width-1:0] datin;
	input rclk;
	input rd;
	input rst;
	output reg [dato_width-1:0] datout;
	output reg full;
	output reg empy;
	output reg dato;
	
//Parameters

parameter dato_width = 8;
parameter fifo_length = 53;

// Registers	
	reg [dato_width-1:0] f [0:fifo_length-1];
	
	reg orwr;
	
	reg [2:0] cont = 0;
	reg [2:0] contw = 0;
	reg [2:0] contr = 0;
	
	always @(posedge wclk) begin
		if(wr == 1 && (~full)) begin
			f[contw] <= datin;
			contw <= contw + 3'b001;	
			if(contw > (fifo_length - 1)) contw <= 3'b000;
		end
	end
	
	always @(posedge rclk) begin
		if(rd == 1 && (~empy)) begin
			datout <= f[contr];
			f[contr] <= 0;
			contr <= contr + 3'b001;
			if(contr > (fifo_length - 1)) contr <= 3'b000;
		end
	end
	
	always @(posedge orwr) begin
		if(rd == 1 && (~empy)) cont <= cont - 3'b001;
		if(wr == 1 && (~full)) cont <= cont + 3'b001;
	end
	
	always @(*) begin
		orwr = wclk | rclk;
/*		if(rst == 1) begin
			f[0] = 3'b000;
			f[1] = 3'b000;
			f[2] = 3'b000;
			f[3] = 3'b000;
			f[4] = 3'b000;
		end */
		if(cont == 0) begin
			empy = 1;
			dato = 0;
			full = 0;
		end
		if(cont > 0) begin
			empy = 0;
			dato = 1;
			full = 0;
		end
		if(cont == fifo_length) begin
			empy = 0;
			dato = 0;
			full = 1;
		end
	end

endmodule
