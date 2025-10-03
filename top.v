// Implement top level module
module top(
    input [7:0] sw,
    output [5:0] led
);

wire carry_out;

light light_switch(
    .downstairs(sw[0]),
    .upstairs(sw[1]),
    .stair_light(led[0])
);

adder single_bit(
    .A(sw[2]),
    .B(sw[3]),
    .Y(led[1]),
    .Carry(led[2])
);

full_adder adder_one(
    .Cin(0),
    .A(sw[4]),
    .B(sw[6]),
    .Y(led[3]),
    .Cout(carry_out)
);

full_adder adder_two(
    .Cin(carry_out),
    .A(sw[5]),
    .B(sw[7]),
    .Y(led[4]),
    .Cout(led[5])
);

endmodule