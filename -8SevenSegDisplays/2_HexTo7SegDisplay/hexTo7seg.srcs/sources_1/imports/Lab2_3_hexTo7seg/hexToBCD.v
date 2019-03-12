module hex2bcd(
    input [3:0] hex, // four bits hex input
    output reg [3:0] bcd, // four bits BCD output
	output reg carry // carry over to more significant bits 
    );
    always @* begin
        if (hex>4'b1001) begin  //greater than 9
            carry=1; 
            bcd[3:0]=hex-10;
            end 
        else begin
            bcd=hex;
			carry=0;
		end
    end
endmodule