module camera_fifo_TB; 
reg reset;
reg clk;
reg [7:0] Tx;  //Dato de envio
reg send;
reg rdx;
wire txd;

camera_fifo  uut(
.clk(clk),
.reset(reset),
.rx(rdx),
.tx(txd)
);
	
	
initial begin 
	clk <= 0;
	rdx <= 1;
	reset=1;
	#10; reset=0;
	
end
	
always #1 clk <= ~clk;

always begin
	#864;
	rdx <= ~rdx;
end
	 

initial begin//: TEST_CASE
  $dumpfile("camera_fifo_TB.vcd");
  $dumpvars(-1, uut);
  #80000 $finish;



end

endmodule

