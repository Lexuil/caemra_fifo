module camera_fifo(clk, reset, tx, rx);
	input rx;
	input reset;
	output tx;
	input clk;
	input rst;
	
	reg wclk = 0;
	reg wr;
	reg [7:0] datin;
	
	reg rclk = 0;
	reg rd;
	wire [7:0] datout;
	
	wire full;
	wire empy;
	wire dato;
	
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
	
	initial begin
		tx_data <= 8'hA0;
		tx_wr <= 1;
	end
	
	always @(negedge rx_busy) begin
		if(rx_avail == 1) begin
			datin <= rx_data;
			wr <= 1;
			wclk <= 1;
		end
	end
	
	always @(posedge rx_busy) begin
		wclk <= 0;
		wr <= 0;
	end
	
endmodule
			
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
