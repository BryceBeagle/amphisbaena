import logging

cdef class Instruction:
    def __init__(self, unsigned int instruction):
        self.instruction = instruction
        self.condition = <Condition> self.bit_range(28, 31)

        if self.condition == Condition.RESERVED:
            logging.warn("Instruction has condition of RESERVED")

    cdef unsigned int bit_range(self, int start, int end):
        """Get range of bits from uint32. Inclusive-inclusive"""
        cdef int left_shift = 31 - end
        cdef int right_shift = left_shift + start
        return self.instruction << left_shift >> right_shift
