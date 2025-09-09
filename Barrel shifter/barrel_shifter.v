module barrel_shifter#(parameter N=8)(input signed[N-1:0] d_in,
	output reg signed[N-1:0] dout,
	input [2:0] sft_amt,
	input sft_dir,
	input [1:0] mode);
	
	
always@(*)
begin
	case(mode)
    2'b00: begin 
        if (sft_dir) 
            dout = d_in >> sft_amt;//right logical shift
        else         
            dout = d_in << sft_amt;// left logical shift
    end

    2'b01: begin 
        if (sft_dir)
            dout = d_in >>> sft_amt; //right arithmetic shift
        else         
            dout = d_in <<< sft_amt;//left arithmetic shift
    end

    2'b10: begin 
        if (sft_dir) 
            dout = (d_in >> sft_amt) | (d_in << (N - sft_amt));//rotate right
        else         
            dout = (d_in << sft_amt) | (d_in >> (N - sft_amt));//rotate left
    end

    default: dout =0;
endcase
end
endmodule
