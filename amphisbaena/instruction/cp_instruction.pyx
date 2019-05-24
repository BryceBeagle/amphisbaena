from .base_instruction cimport BaseInstruction

cdef class CoprocessorDataTransferInstruction(BaseInstruction):
    def __init__(self):
        print(self.condition)

        print(self.condition == 0b0000)