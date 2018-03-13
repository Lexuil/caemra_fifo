module camera_fifo(clk, reset, tx, rx, datout, rd, rclk, empy, dato, full);
	input rx;
	input reset;
	output tx;
	input clk;
	input rst;
	
	input rclk;
	input rd;
	input [7:0] datout;
	
	input full;
	input empy;
	input dato;
	
	reg wclk = 0;
	reg wr;
	reg [7:0] datin;
	
	FIFO fifo(
		.wclk(wclk), 
		.wr(wr), 
		.datin(datin), 
		.rclk(rclk), .rd(rd), 
		.datout(datout), 
		.full(full), 
		.empy(empy), 
		.dato(dato), 
		.rst(rst)
	);
	
	reg resetu;
	wire [7:0] rx_data;
	reg [7:0] tx_data;
	reg tx_wr;
	wire rx_avail;
	wire rx_busy;
	wire tx_busy;
	
	
	uart peri(
		.reset(reset),
		.clk(clk),
		// UART lines
		.uart_rxd(rx),
		.uart_txd(tx),
		// 
		.rx_data(rx_data),
		.rx_avail(rx_avail),
		.rx_busy(rx_busy),
		.tx_data(tx_data),
		.tx_wr(tx_wr),
		.tx_busy(tx_busy)
	);
	
	/*always @(negedge rx_busy) begin
		if(rx_avail == 1) begin
			datin <= rx_data;
			wr <= 1;
			wclk <= 1;
		end
	end
	
	always @(posedge rx_busy) begin
		wclk <= 0;
		wr <= 0;
	end*/
	
	always @(posedge clk) begin
		if(rx_avail == 1 && rx_busy == 1) begin
			datin <= rx_data;
			wr <= 1;
			wclk <= 1;
		end else begin
			wclk <= 0;
			wr <= 0;
		end
	end
			
	
endmodule
			
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
