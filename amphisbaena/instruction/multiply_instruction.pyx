cdef class MultiplyInstruction(Instruction):
    def __init__(self, unsigned int instruction):
        super().__init__(instruction)

        self.a = <Flag> self.bit_range(21, 21)
        self.s = <Flag> self.bit_range(20, 20)
        self.rd = <Register> self.bit_range(16, 19)
        self.rn = <Register> self.bit_range(16, 19)
        self.rs = <Register> self.bit_range(8, 11)
        self.rm = <Register> self.bit_range(0, 3)

    cdef Register _rn(self):
        # "Rn is ignored, and should be set to zero for compatibility with
        # possible future upgrades to the instruction set."
        cdef unsigned int rn = self.bit_range(12, 15)
        assert rn == 0b0000, "Multiply instruction Rn is not set to 0b0000"
        return <Register> rn
