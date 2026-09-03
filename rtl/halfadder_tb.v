`timescale 1ns/1ps

module halfadder_tb;

reg a;
reg b;
wire sum;
wire carry;

integer errors;

halfadder dut (
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
);

initial begin
    errors = 0;

    a = 1'b0; b = 1'b0;
    #10;
    if (sum !== 1'b0 || carry !== 1'b0) begin
        $display("TEST 1 FAILED: a=%b b=%b sum=%b carry=%b", a, b, sum, carry);
        errors = errors + 1;
    end

    a = 1'b0; b = 1'b1;
    #10;
    if (sum !== 1'b1 || carry !== 1'b0) begin
        $display("TEST 2 FAILED: a=%b b=%b sum=%b carry=%b", a, b, sum, carry);
        errors = errors + 1;
    end

    a = 1'b1; b = 1'b0;
    #10;
    if (sum !== 1'b1 || carry !== 1'b0) begin
        $display("TEST 3 FAILED: a=%b b=%b sum=%b carry=%b", a, b, sum, carry);
        errors = errors + 1;
    end

    a = 1'b1; b = 1'b1;
    #10;
    if (sum !== 1'b0 || carry !== 1'b1) begin
        $display("TEST 4 FAILED: a=%b b=%b sum=%b carry=%b", a, b, sum, carry);
        errors = errors + 1;
    end

    if (errors == 0)
        $display("ALL TEST CASES TRUE");
    else
        $display("TEST FAILED: %0d test case(s) failed", errors);

    $finish;
end

endmodule
