# ALU Module

This repository contains the Verilog code for a simple Arithmetic Logic Unit (ALU). The ALU is a digital circuit that performs a variety of arithmetic and bitwise operations on two 16-bit inputs, `A` and `B`. The operation performed is selected by the input signals `s3`, `s2`, `s1`, `s0`, and `Cin`. The results are stored in the output `F`, and an optional carry-out signal `Cout` is also provided.

## Features

- **16-bit Input Support**: Operates on two 16-bit binary numbers (`A` and `B`).
- **Arithmetic Operations**: Includes addition, subtraction, increment, decrement, and more.
- **Bitwise Operations**: Supports AND, OR, XOR, and complement.
- **Shift Operations**: Implements both logical left and right shifts.
- **Carry-In and Carry-Out**: Supports operations with carry-in and generates carry-out where applicable.

## Input/Output Ports

### Inputs:
- **Enter**: Clock signal to trigger the operation.
- **A [15:0]**: First 16-bit input operand.
- **B [15:0]**: Second 16-bit input operand.
- **s3, s2, s1, s0**: 4-bit selector to determine the operation.
- **Cin**: Carry-in input for operations involving carry.

### Outputs:
- **F [15:0]**: 16-bit output result of the operation.
- **Cout**: Carry-out output for operations involving carry.

## Operation Selection

The operation performed by the ALU is determined by the combination of the selector inputs (`s3`, `s2`, `s1`, `s0`) and `Cin`. The table below summarizes the operations:
--------------------------------------------------------------------------
| `s3` | `s2` | `s1` | `s0` | `Cin` | Operation                          |
|------|------|------|------|-------|------------------------------------|
| 0    | 0    | 0    | 0    | 0     | Transfer `A`                       |
| 0    | 0    | 0    | 0    | 1     | Increment `A`                      |
| 0    | 0    | 0    | 1    | 0     | Add `A` and `B`                    |
| 0    | 0    | 0    | 1    | 1     | Add `A`, `B`, and `Cin`            |
| 0    | 0    | 1    | 0    | 0     | Subtract `B` from `A` (with borrow)|
| 0    | 0    | 1    | 0    | 1     | Subtract `B` from `A`              |
| 0    | 0    | 1    | 1    | 0     | Decrement `A`                      |
| 0    | 0    | 1    | 1    | 1     | Transfer `A`                       |
| 0    | 1    | 0    | 0    | X     | `A` AND `B`                        |
| 0    | 1    | 0    | 1    | X     | `A` OR `B`                         |
| 0    | 1    | 1    | 0    | X     | `A` XOR `B`                        |
| 0    | 1    | 1    | 1    | X     | Complement `A`                     |
| 1    | 0    | X    | X    | X     | Logical right shift `A`            |
| 1    | 1    | X    | X    | X     | Logical left shift `A`             |
-------------------------------------------------------------------------
## Usage

To use the ALU module, instantiate it in your Verilog design and connect the appropriate inputs and outputs. The operation can be selected by setting the selector inputs and `Cin`, then triggering the operation with the `Enter` signal.

### Example

```verilog
module ExampleUsage;
    reg Enter;
    reg [15:0] A, B;
    reg s3, s2, s1, s0, Cin;
    wire [15:0] F;
    wire Cout;
    
    ALU myALU (
        .Enter(Enter),
        .A(A),
        .B(B),
        .s3(s3),
        .s2(s2),
        .s1(s1),
        .s0(s0),
        .Cin(Cin),
        .F(F),
        .Cout(Cout)
    );
    
    // Example testbench logic here...
endmodule
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contribution

Feel free to open issues or submit pull requests for any enhancements or bug fixes.