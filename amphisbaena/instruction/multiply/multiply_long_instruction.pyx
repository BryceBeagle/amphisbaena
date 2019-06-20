cdef class MultiplyLongInstruction(Instruction):
    def __init__(self, unsigned int instruction):
        super().__init__(instruction)

        self.signed_ = <Flag> self.bit_range(22, 22)
        self.accumulate = <Flag> self.bit_range(21, 21)
        self.s = <Flag> self.bit_range(20, 20)
        self.rd_hi = <Register> self.bit_range(16, 19)
        self.rd_lo = <Register> self.bit_range(12, 15)
        self.rs = <Register> self.bit_range(8, 11)
        self.rm = <Register> self.bit_range(0, 3)
