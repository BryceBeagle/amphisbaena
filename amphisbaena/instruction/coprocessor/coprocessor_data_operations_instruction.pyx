cdef class CoprocessorDataOperationsInstruction(Instruction):
    def __init__(self, unsigned int instruction):
        super().__init__(instruction)

        self.cp_opcode = <CPOpcode> self.bit_range(20, 23)
        self.cp_rn = <Register> self.bit_range(16, 19)
        self.cp_rd = <Register> self.bit_range(12, 15)
        self.cp_num = <CPNum> self.bit_range(8, 11)
        self.cp_info = <CPInfo> self.bit_range(5, 7)
        self.cp_rm = <Register> self.bit_range(0, 3)
