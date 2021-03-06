module p3(A, B, Co, Ci, Ds, Ai, Bi);

	// Define inputs and outputs
	input [3:0] A, B;
	input Ci;
	output Co;
	output [13:0] Ds;
	output [6:0] Ai;
	output [6:0] Bi;
	
	wire [3:0] S;
	wire a, b, c;
	
	// Create 4 FAs and combine
	FA fa0(
		.a(A[0]),
		.b(B[0]),
		.ci(Ci),
		.s(S[0]),
		.co(a)
	);
	
	FA fa1(
		.a(A[1]),
		.b(B[1]),
		.ci(a),
		.s(S[1]),
		.co(b)
	);
	
	FA fa2(
		.a(A[2]),
		.b(B[2]),
		.ci(b),
		.s(S[2]),
		.co(c)
	);
	
	FA fa3(
		.a(A[3]),
		.b(B[3]),
		.ci(c),
		.s(S[3]),
		.co(Co)
	);
	
	// Create display
	Digitizer digitizer(
		.lineIns(S),
		.lineOuts(Ds)
	);
	
	// Display adding numbers
	BCD bcd0(
		.lineIn(A),
		.lineOut(Ai)
	);
	
	BCD bcd1(
		.lineIn(B),
		.lineOut(Bi)
	);


endmodule