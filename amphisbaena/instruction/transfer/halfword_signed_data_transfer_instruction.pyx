cdef class HalfwordSignedDataTransferInstruction(Instruction):
    def __init__(self, unsigned int instruction):
        super().__init__(instruction)

        self.indexing_type = <IndexingType> self.bit_range(24, 24)
        self.offset_direction = <OffsetDirection> self.bit_range(23, 23)
        self.offset_type = \
            <HalfwordSignedDataTransferOffsetType> self.bit_range(22, 22)
        self.write_back = <Flag> self.bit_range(21, 21)
        self.transfer_type = <TransferType> self.bit_range(20, 20)
        self.rn = <Register> self.bit_range(16, 19)
        self.rd = <Register> self.bit_range(12, 15)
        self.s = <Flag> self.bit_range(6, 6)
        self.h = <Flag> self.bit_range(5, 5)

        if self.offset_type == HalfwordSignedDataTransferOffsetType. \
                HSDTI_REGISTER_OFFSET:
            self.rm = <Register> self.bit_range(0, 3)
        else:
            self.offset = self._offset()

    cdef ImmediateOffset _offset(self):
        cdef unsigned int low_nibble = self.bit_range(0, 3)
        cdef unsigned int high_nibble = self.bit_range(8, 11)

        cdef ImmediateOffset offset = (high_nibble << 4) | low_nibble

        return offset
