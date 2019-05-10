module DeMux(
input pwmLatch,
input select,
input [4:0] address,
input [7:0] pwm,
output [31:0] LED,
output reg [31:0] choice = 32'h00000000
);

//   reg [31:0] choice = 32'h00000000;

   always @(posedge select)
         case (address)
            5'b00000  : choice <= 32'b00000000000000000000000000000001;
            5'b00001  : choice <= 32'b00000000000000000000000000000010;
            5'b00010  : choice <= 32'b00000000000000000000000000000100;
            5'b00011  : choice <= 32'b00000000000000000000000000001000;
            5'b00100  : choice <= 32'b00000000000000000000000000010000;
            5'b00101  : choice <= 32'b00000000000000000000000000100000;
            5'b00110  : choice <= 32'b00000000000000000000000001000000;
            5'b00111  : choice <= 32'b00000000000000000000000010000000;
             5'b01000  : choice <= 32'b00000000000000000000000100000000;
            5'b01001  : choice <= 32'b00000000000000000000001000000000;
            5'b01010  : choice <= 32'b00000000000000000000010000000000;
            5'b01011  : choice <= 32'b00000000000000000000100000000000;
            5'b01100  : choice <= 32'b00000000000000000001000000000000;
            5'b01101  : choice <= 32'b00000000000000000010000000000000;
            5'b01110  : choice <= 32'b00000000000000000100000000000000;
            5'b01111  : choice <= 32'b00000000000000001000000000000000;
             5'b10000  : choice <= 32'b00000000000000010000000000000000;
            5'b10001  : choice <= 32'b00000000000000100000000000000000;
            5'b10010  : choice <= 32'b00000000000001000000000000000000;
            5'b10011  : choice <= 32'b00000000000010000000000000000000;
            5'b10100  : choice <= 32'b00000000000100000000000000000000;
            5'b10101  : choice <= 32'b00000000001000000000000000000000;
            5'b10110  : choice <= 32'b00000000010000000000000000000000;
            5'b10111  : choice <= 32'b00000000100000000000000000000000;
             5'b11000  : choice <= 32'b00000001000000000000000000000000;
            5'b11001  : choice <= 32'b00000010000000000000000000000000;
            5'b11010  : choice <= 32'b00000100000000000000000000000000;
            5'b11011  : choice <= 32'b00001000000000000000000000000000;
            5'b11100  : choice <= 32'b00010000000000000000000000000000;
            5'b11101  : choice <= 32'b00100000000000000000000000000000;
            5'b11110  : choice <= 32'b01000000000000000000000000000000;
            5'b11111  : choice <= 32'b10000000000000000000000000000000;
            default : choice <= 32'b00000000000000000000000000000000;
         endcase

Latch latch0(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[0]),
    .LED(LED[0])
);

Latch latch1(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[1]),
    .LED(LED[1])
);

Latch latch2(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[2]),
    .LED(LED[2])
);

Latch latch3(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[3]),
    .LED(LED[3])
);

Latch latch4(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[4]),
    .LED(LED[4])
);

Latch latch5(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[5]),
    .LED(LED[5])
);

Latch latch6(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[6]),
    .LED(LED[6])
);

Latch latch7(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[7]),
    .LED(LED[7])
);

Latch latch8(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[8]),
    .LED(LED[8])
);

Latch latch9(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[9]),
    .LED(LED[9])
);

Latch latch10(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[10]),
    .LED(LED[10])
);

Latch latch11(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[11]),
    .LED(LED[11])
);

Latch latch12(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[12]),
    .LED(LED[12])
);

Latch latch13(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[13]),
    .LED(LED[13])
);

Latch latch14(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[14]),
    .LED(LED[14])
);

Latch latch15(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[15]),
    .LED(LED[15])
);

Latch latch16(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[16]),
    .LED(LED[16])
);

Latch latch17(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[17]),
    .LED(LED[17])
);

Latch latch18(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[18]),
    .LED(LED[18])
);

Latch latch19(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[19]),
    .LED(LED[19])
);

Latch latch20(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[20]),
    .LED(LED[20])
);

Latch latch21(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[21]),
    .LED(LED[21])
);

Latch latch22(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[22]),
    .LED(LED[22])
);

Latch latch23(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[23]),
    .LED(LED[23])
);

Latch latch24(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[24]),
    .LED(LED[24])
);

Latch latch25(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[25]),
    .LED(LED[25])
);

Latch latch26(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[26]),
    .LED(LED[26])
);

Latch latch27(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[27]),
    .LED(LED[27])
);

Latch latch28(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[28]),
    .LED(LED[28])
);

Latch latch29(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[29]),
    .LED(LED[29])
);

Latch latch30(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[30]),
    .LED(LED[30])
);

Latch latch31(
    .pwmLatch(pwmLatch),
    .pwm(pwm),
    .address(choice[31]),
    .LED(LED[31])
);

endmodule