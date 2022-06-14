module suma #(parameter N=4)(input logic [N-1:0] a,b, input logic ci, 
									output logic [N-1:0] s, output logic cout);
									
									
									
assign {cout, s}= a+b+ci; 



endmodule