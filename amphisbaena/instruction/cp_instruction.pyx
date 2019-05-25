from .base_instruction cimport Instruction

cdef class CoprocessorDataTransferInstruction(Instruction):
    def __init__(self):
        print(self.condition)

        print(self.condition == 0b0000)