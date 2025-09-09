module barrel_shifter_tb#(parameter N=8)();
	reg [N-1:0] d_in;
	reg [2:0] sft_amt;
	reg sft_dir;
	reg [1:0] mode;
	wire [N-1:0] dout;
	
	barrel_shifter DUT (.d_in(d_in),.sft_amt(sft_amt),.sft_dir(sft_dir),.mode(mode),.dout(dout));
	
	initial
	begin
		d_in=8'b10110110;
		sft_dir=1'b1;
		mode=2'b00;
		sft_amt=3'd3;
		#10
		d_in=8'b10110110;
		sft_dir=1'b0;
		mode=2'b00;
		sft_amt=3'd2;
		#10
		d_in=8'b10110110;
		sft_dir=1'b1;
		mode=2'b01;
		sft_amt=3'd3;
		#10
		d_in=8'b10110110;
		sft_dir=1'b0;
		mode=2'b01;
		sft_amt=3'd3;
		#10
		d_in=8'b10110110;
		sft_dir=1'b1;
		mode=2'b10;
		sft_amt=3'd3;
		#10
		
		d_in=8'b10110110;
		sft_dir=1'b0;
		mode=2'b10;
		sft_amt=3'd3;
		#10;
	end
	
	initial
		$monitor("d_in=%b,sft_amt=%b,sft_dir=%b,mode=%b,dout=%b",d_in,sft_amt,sft_dir,mode,dout);
		
endmodule
