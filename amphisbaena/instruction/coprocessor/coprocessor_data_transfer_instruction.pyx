cdef class CoprocessorDataTransferInstruction(Instruction):
    def __init__(self, unsigned int instruction):
        super().__init__(instruction)

        self.indexing_type = <IndexingType> self.bit_range(24, 24)
        self.offset_direction = <OffsetDirection> self.bit_range(23, 23)
        self.transfer_length = self.bit_range(22, 22)
        self.write_back = <Flag> self.bit_range(21, 21)
        self.transfer_type = <TransferType> self.bit_range(20, 20)
        self.rn = <Register> self.bit_range(16, 19)
        self.cp_rd = <Register> self.bit_range(12, 15)
        self.cp_num = <CPNum> self.bit_range(8, 11)
        self.offset = <Offset> self.bit_range(0, 7)
