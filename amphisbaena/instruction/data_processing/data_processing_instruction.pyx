cdef class DataProcessingInstruction(Instruction):
    def __init__(self, unsigned int instruction):
        super().__init__(instruction)

        self.i = <Flag> self.bit_range(25, 25)
        self.opcode = <DataProcessingOpcode> self.bit_range(21, 24)
        self.s = <Flag> self.bit_range(20, 20)
        self.rn = <Register> self.bit_range(16, 19)
        self.rd = <Register> self.bit_range(12, 15)

        if self.i:
            self.rotate = <RotateAmount> self.bit_range(8, 11)
            self.imm = <RotateImmediate> self.bit_range(0, 7)
        else:
            self.rm = <Register> self.bit_range(0, 3)
            self.shift_format = <ShiftFormat> self.bit_range(4, 4)
            self.shift_type = <ShiftType> self.bit_range(5, 6)

            if self.shift_format == ShiftFormat.IMMEDIATE:
                self.shift_amount = <ShiftAmount> self.bit_range(7, 11)
            elif self.shift_format == ShiftFormat.REGISTER:
                self.rs = <Register> self.bit_range(8, 11)
