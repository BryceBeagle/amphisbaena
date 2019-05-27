cdef class BranchAndExchangeInstruction(Instruction):
    def __init__(self, unsigned int instruction):
        super().__init__(instruction)

        self.rn = <Register> self.bit_range(0, 3)
