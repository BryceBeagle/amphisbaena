cdef class BlockDataTransferInstruction(Instruction):
    def __init__(self, unsigned int instruction):
        super().__init__(instruction)

        self.indexing_type = <IndexingType> self.bit_range(24, 24)
        self.offset_direction = <OffsetDirection> self.bit_range(23, 23)
        self.s = <Flag> self.bit_range(22, 22)
        self.write_back = <Flag> self.bit_range(21, 21)
        self.transfer_type = <TransferType> self.bit_range(20, 20)
        self.rn = <Register> self.bit_range(16, 19)
        self.register_list = <RegisterList> self.bit_range(0, 15)
