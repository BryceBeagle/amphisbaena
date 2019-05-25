cdef class DataProcessingInstruction(Instruction):
    def __init__(self, unsigned int instruction):
        super().__init__(instruction)

        self.i = <Flag> self.bit_range(25, 25)
        self.opcode = <Opcode> self.bit_range(21, 24)
        self.s = <Flag> self.bit_range(20, 20)
        self.rn = <Register> self.bit_range(16, 19)
        self.rd = <Register> self.bit_range(12, 15)

        if self.i:
            self.shift = self.bit_range(4, 11)
            self.rm = <Register> self.bit_range(0, 3)
        else:
            self.rotate = self.bit_range(8, 11)
            self.imm = self.bit_range(0, 7)
