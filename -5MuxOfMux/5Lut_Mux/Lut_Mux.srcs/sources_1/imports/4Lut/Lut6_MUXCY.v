module LUT6_MUXCY_test (
	input  [2:0]  data_in,
	input  [2:0]  sel,
	input         muxcy_sel,
	input         muxcy_carry,
	output 		  muxcy_data_out,
	output        lut_data_out);

	LUT6 #(.INIT (64'h0000000F003355FF)) selection_lut (
			.I0 	(data_in[0]), 
			.I1 	(data_in[1]), 
			.I2     (data_in[2]),
			.I3     (sel[0]),
			.I4     (sel[1]),
			.I5     (sel[2]),
			.O      (lut_data_out)); 


	MUXCY combiner_muxcy ( 
		   .DI      (1'b1),
		   .CI      (muxcy_carry),                     
		   .S       (muxcy_sel),
		   .O       (muxcy_data_out)) ;


endmodule


