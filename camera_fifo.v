module camera_fifo(clk, reset, tx, rx, datout, rclk, empy, dato, full);
	input rx;
	input reset;
	output tx;
	input clk;
	
	input rclk;
	output [7:0] datout;
	
	output full;
	output empy;
	output dato;
	
	wire wclk;
	reg [7:0] datin = 8'h00;
	reg rst = 0;

	wire [7:0] rx_data;
	reg [7:0] tx_data = 8'h00;
	reg tx_wr = 0;
	wire rx_avail;
	wire rx_busy;
	wire tx_busy;
	wire rx_error;
	wire rx_ack;
	
	FIFO #(
		.DATO_WIDTH(8),
		.FIFO_LENGTH(53)

	) fifo(
		.wclk(rx_avail),
		.datin(rx_data), 
		.rclk(rclk),
		.datout(datout), 
		.full(full), 
		.empy(empy), 
		.dato(dato), 
		.rst(reset)
	);
	
	
	uart peri(
		.reset(reset),
		.clk(clk),
		// UART lines
		.uart_rxd(rx),
		.uart_txd(tx),
		// 
		.rx_data(rx_data),
		.rx_avail(rx_avail),
		.rx_error(rx_error),
		.rx_ack(rx_ack),
		.rx_busy(rx_busy),
		.tx_data(tx_data),
		.tx_wr(tx_wr),
		.tx_busy(tx_busy)
	);

	reg w = 0;
	assign rx_ack = rx_avail & w;

	always @(posedge clk) begin///probar con ack
		if(~rx_avail) begin
			w <= 0;
		end else begin
			w <= 1;
		end
	end

	/*
	always @(posedge clk) begin
		rx_ack <= rx_avail;
	end

	reg w = 0;
	assign wclk = ~rx_busy & w;

	always @(posedge clk) begin///probar con ack
		if(~rx_busy) begin
			w <= 0;
		end else begin
			w <= 1;
		end
	end

	always @(*) begin
		tx_data <= rx_data;
		tx_wr <= wclk;
	end

	always @(posedge clk) begin
		if (rx_avail && ~rx_error && ~rx_busy) begin
			tx_data <= rx_data;

		end
	end
		*/	
	
endmodule