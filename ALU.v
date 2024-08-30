module ALU(
    input Enter,
	 input [15:0]A,
	 input [15:0]B,
    input s3, s2, s1, s0, Cin,
    output reg [15:0] F,
    output reg Cout
);
wire [15:0]B_compliment;
wire [15:0]A_compliment;
wire [15:0]Cin1_compliment;

reg [15:0] Cin1;

initial 
begin
	Cin1 =16'b0000000000000001;
end

wire [15:0]A_right;
wire [15:0]A_left;

assign Cin1_compliment=~Cin1;


assign B_compliment=~B;


assign A_compliment=~A;


assign A_right=A>>1'b1;


assign A_left=A<<1'b1;
always @(posedge Enter) 
	begin
		if (s3==1'b0 && s2==1'b0 && s1==1'b0 && s0==1'b0 && Cin==1'b0)//Transfer A 
			begin
				F <= A;
				Cout <= 1'b0; 
			end
			
			
		else if (s3==1'b0 && s2==1'b0 && s1==1'b0 && s0==1'b0 && Cin==1'b1)//INC A 
			begin
				{Cout, F} = A +  Cin1;
			end
			
			
		else if (s3==1'b0 && s2==1'b0 && s1==1'b0 && s0==1'b1 && Cin==1'b0) //ADDITION without carry
			begin
				{Cout, F} = A +  B;
			end
			
			
		
		else if (s3==1'b0 && s2==1'b0 && s1==1'b0 && s0==1'b1 && Cin==1'b1) //Add with Carry
			begin
				{Cout, F} = A + B + Cin1;
			end
		else if (s3==1'b0 && s2==1'b0 && s1==1'b1 && s0==1'b0 && Cin==1'b0) //Subtraction With borrow
   		/*2'compliment=B_Compliment+1
				With borrow che mate pela kyakthi borrow che tene minus karvanu mate
				b_compliment=1-1
				ultimately b_compliment j rahe
			*/
			begin
				{Cout, F} = A + B_compliment;
			end
		else if (s3==1'b0 && s2==1'b0 && s1==1'b1 && s0==1'b0 && Cin==1'b1) //Subtraction
			begin
				{Cout, F} = A + B_compliment+Cin1;
			end
		else if (s3==1'b0 && s2==1'b0 && s1==1'b1 && s0==1'b1 && Cin==1'b0) //Decrement
			begin
				{Cout, F} = A + Cin1_compliment;
			end
		else if (s3==1'b0 && s2==1'b0 && s1==1'b1 && s0==1'b1 && Cin==1'b1) //Transfer
			begin
				F <= A;
				Cout <= 1'b0; 
			end
		else if (s3==1'b0 && s2==1'b1 && s1==1'b0 && s0==1'b0 && Cin==1'bx) //AND
			begin
				F<=A&B;
				Cout <= 1'b0; 
			end
		else if (s3==1'b0 && s2==1'b1 && s1==1'b0 && s0==1'b1 && Cin==1'bx) //OR
			begin
				F<=A||B;
				Cout <= 1'b0; 
			end
		else if (s3==1'b0 && s2==1'b1 && s1==1'b1 && s0==1'b0 && Cin==1'bx) //XOR
			begin
				F<=A^B;
				Cout <= 1'b0; 
			end	
	   else if (s3==1'b0 && s2==1'b1 && s1==1'b1 && s0==1'b1 && Cin==1'bx) //A compliment
			begin
				F<=A_compliment;
				Cout <= 1'b0; 
			end
		else if (s3==1'b1 && s2==1'b0 && s1==1'bx && s0==1'bx && Cin==1'bx) //Right shift a
			begin
				F<=A_right;
				Cout <= 1'b0; 
			end
		else if (s3==1'b1 && s2==1'b1 && s1==1'bx && s0==1'bx && Cin==1'bx) //Right shift a
			begin
				F<=A_left;
				Cout <= 1'b0; 
			end	
	end
endmodule


