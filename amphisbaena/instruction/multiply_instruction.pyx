cdef class MultiplyInstruction(Instruction):
    def __init__(self, unsigned int instruction):
        super().__init__(instruction)

        self.a = MultiplyInstruction._a(instruction)
        self.s = MultiplyInstruction._s(instruction)
        self.rd = MultiplyInstruction._rd(instruction)
        self.rn = MultiplyInstruction._rn(instruction)
        self.rs = MultiplyInstruction._rs(instruction)
        self.rm = MultiplyInstruction._rm(instruction)

    @staticmethod
    cdef Flag _a(unsigned int instruction):
        return <Flag> Instruction.bit_range(instruction, 21, 21)

    @staticmethod
    cdef Flag _s(unsigned int instruction):
        return <Flag> Instruction.bit_range(instruction, 20, 20)

    @staticmethod
    cdef Register _rd(unsigned int instruction):
        return <Register> Instruction.bit_range(instruction, 19, 19)

    @staticmethod
    cdef Register _rn(unsigned int instruction):
        # "Rn is ignored, and should be set to zero for compatibility with
        # possible future upgrades to the instruction set."
        rn = Instruction.bit_range(instruction, 12, 15)
        assert rn == 0b0000, "Multiply instruction Rn is not set to 0b0000"
        return <Register> rn

    @staticmethod
    cdef Register _rs(unsigned int instruction):
        return <Register> Instruction.bit_range(instruction, 8, 11)

    @staticmethod
    cdef Register _rm(unsigned int instruction):
        return <Register> Instruction.bit_range(instruction, 0, 3)
