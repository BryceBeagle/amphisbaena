cdef class SingleDataSwapInstruction(Instruction):
    def __init__(self, unsigned int instruction):
        super().__init__(instruction)

        self.swap_quantity = <SwapQuantity> self.bit_range(22, 22)
        self.rn = <Register> self.bit_range(16, 19)
        self.rd = <Register> self.bit_range(12, 15)
        self.rm = <Register> self.bit_range(0, 3)
