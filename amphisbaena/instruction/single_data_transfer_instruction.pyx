cdef class SingleDataTransferInstruction(Instruction):
    def __init__(self, unsigned int instruction):
        super().__init__(instruction)

        self.offset_type = <SingleDataTransferOffsetType> self.bit_range(25, 25)
        self.indexing_type = <IndexingType> self.bit_range(24, 24)
        self.offset_direction = <OffsetDirection> self.bit_range(23, 23)
        self.transfer_quantity = <TransferQuantity> self.bit_range(22, 22)
        self.write_back = <Flag> self.bit_range(21, 21)
        self.transfer_type = <TransferType> self.bit_range(20, 20)

        self.rn = <Register> self.bit_range(16, 19)
        self.rd = <Register> self.bit_range(12, 15)

        if self.offset_type == SingleDataTransferOffsetType.\
                SINGLE_DATA_TRANSFER_IMMEDIATE_OFFSET:
            self.immediate_offset = <ImmediateOffset> self.bit_range(0, 11)
        else:
            # Should always be ShiftFormat.IMMEDIATE
            self.shift_format = <ShiftFormat> self.bit_range(4, 4)
            self.shift_type = <ShiftType> self.bit_range(5, 6)
            self.shift_amount = <ShiftAmount> self.bit_range(7, 11)
