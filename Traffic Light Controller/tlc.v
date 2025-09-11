module tlc(input clock,reset,
		output r,g,y);
		
	parameter red=2'b00,
			yellow=2'b01,
			green=2'b10;
	
	reg [1:0] pre,next;
	reg [4:0] count;
	
	always@(posedge clock)
	begin
		if(reset)
		begin
			pre<=red;
			count<=0;
		end
		else
		begin
			if(pre!=next)
				count<=0;
			else
				count<=count+1;
				
			pre<=next;
		end
	end
	
	always@(*)
	begin
		next=red;
		case(pre)
			red: begin
					if(count==5'd30)
					begin
						next=yellow;
					end
					else
						next=red;
				end	
			yellow: begin
					if(count==5'd10)
						next=green;
					else
						next=yellow;
				end	
			green: begin
					if(count==5'd30)
						next=red;
					else
						next=green;
				end	
			
		endcase
	end
	
	assign r=(pre==red)?1'b1:1'b0;
	assign y=(pre==yellow)?1'b1:1'b0;
	assign g=(pre==green)?1'b1:1'b0;
	
endmodule
