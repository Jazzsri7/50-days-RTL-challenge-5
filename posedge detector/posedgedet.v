module posedgedet(input  clk,rst,in,
			output posed);

    reg pre_sig;

    always @(posedge clk) begin
        if (rst)
            pre_sig <= 0;
        else
            pre_sig <= in;
    end

    assign posed = ~pre_sig & in; 

endmodule
