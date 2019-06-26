cdef class SoftwareInterruptInstruction(Instruction):
    def __init__(self, unsigned int instruction):
        super().__init__(instruction)

        self.comment_field = self.bit_range(0, 23)
