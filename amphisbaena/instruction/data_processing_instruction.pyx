cdef class DataProcessingInstruction(Instruction):
    def __init__(self, unsigned int instruction):
        super().__init__(instruction)

        self.i = DataProcessingInstruction._i(instruction)
        self.opcode = DataProcessingInstruction._opcode(instruction)
        self.s = DataProcessingInstruction._s(instruction)
        self.rn = DataProcessingInstruction._rn(instruction)
        self.rd = DataProcessingInstruction._rd(instruction)

        if self.i:
            self.shift = DataProcessingInstruction._shift(instruction)
            self.rm = DataProcessingInstruction._rm(instruction)
        else:
            self.rotate = DataProcessingInstruction._rotate(instruction)
            self.imm = DataProcessingInstruction._imm(instruction)

    @staticmethod
    cdef Flag _i(unsigned int instruction):
        return <Flag> Instruction.bit_range(instruction, 25, 25)

    @staticmethod
    cdef Opcode _opcode(unsigned int instruction):
        return <Opcode> Instruction.bit_range(instruction, 21, 24)

    @staticmethod
    cdef Flag _s(unsigned int instruction):
        return <Flag> Instruction.bit_range(instruction, 20, 20)

    @staticmethod
    cdef Register _rn(unsigned int instruction):
        return <Register> Instruction.bit_range(instruction, 16, 19)

    @staticmethod
    cdef Register _rd(unsigned int instruction):
        return <Register> Instruction.bit_range(instruction, 12, 15)

    @staticmethod
    cdef unsigned int _shift(unsigned int instruction):
        return <Register> Instruction.bit_range(instruction, 4, 11)

    @staticmethod
    cdef Register _rm(unsigned int instruction):
        return <Register> Instruction.bit_range(instruction, 0, 3)

    @staticmethod
    cdef unsigned int _rotate(unsigned int instruction):
        return <Register> Instruction.bit_range(instruction, 8, 11)

    @staticmethod
    cdef unsigned int _imm(unsigned int instruction):
        return <Register> Instruction.bit_range(instruction, 0, 7)
