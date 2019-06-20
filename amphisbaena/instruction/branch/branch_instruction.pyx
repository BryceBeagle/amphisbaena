cdef class BranchInstruction(Instruction):
    def __init__(self, unsigned int instruction):
        super().__init__(instruction)

        self.branch_type = <BranchType> self.bit_range(24, 24)
        """Referred to as link bit in the documentation"""
        self.offset = <Offset> self._offset()

    cpdef Offset _offset(self):
        # "Branch instructions contain a signed 2's complement 24 bit offset.
        # This is shifted left two bits, sign extended to 32 bits, and added to
        # the PC."

        # The `6` brings our new 26 bit int to the MSBs of the 32bit integer
        # We shift up and then back down to sign extend
        cdef signed int offset = self.instruction << 2 << 6
        offset >>= 6  # Note: Signed numbers get arithmetic shifts
        return <Offset> offset
