module array_multiplier_tb();
	reg [3:0] A, B;
	wire [7:0] P;
	
	array_multiplier DUT(.A(A),.B(B),.P(P));
	
	task inputs(input [3:0] i,j);
	begin
		A=i;
		B=j;
	end	
	endtask
	
	initial
	begin
		inputs(4'd4,4'd6);
		#10
		inputs(4'd2,4'd8);
		#10
		inputs(4'd8,4'd8);
		#10
		inputs(4'd9,4'd3);
		#10
		inputs(4'd12,4'd6);
		#10
		$finish;
	end

	initial
	begin
		$monitor("At %t value of A=%d,B=%d,P=%d",$time,A,B,P);
	end
	
endmodule
