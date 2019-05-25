cdef class Instruction:
    def __init__(self, unsigned int instruction):
        self.instruction = instruction
        self.condition = Instruction._condition(instruction)

    @staticmethod
    cdef unsigned int bit_range(unsigned int instruction, int start, int end):
        """Get range of bits from uint32. Inclusive-inclusive"""
        cdef int left_shift = 31 - end
        cdef int right_shift = left_shift + start
        return instruction << left_shift >> right_shift

    @staticmethod
    cdef Condition _condition(unsigned int instruction):
        return <Condition> Instruction.bit_range(instruction, 28, 31)
