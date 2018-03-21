module camera_fifo_TB; 
reg reset;
reg clk;
reg [7:0] Tx;  //Dato de envio
reg send;
reg rdx;
wire txd;
reg rclk = 0;

camera_fifo  uut(
.clk(clk),
.reset(reset),
.rx(rdx),
.tx(txd),
.rclk(rclk)
);

reg [5:0] cont = 0;
	
initial begin 
	clk <= 0;
	rdx <= 1;
	reset=1;
	#10; reset=0;
	
end
	
always #1 clk <= ~clk;

initial begin
	for(cont = 0; cont < 15; cont = cont + 1) begin
		#2700;
		rdx <= ~rdx;
	end
	rclk <= 1;
	#2;
	rclk <= 0;
	#2;
	rclk <= 1;
	#2;
	rclk <= 0;
	#2;
end
	 

initial begin//: TEST_CASE
  $dumpfile("camera_fifo_TB.vcd");
  $dumpvars(-1, uut);
  #160000 $finish;



end

endmodule

