from amphisbaena.instruction import HalfwordSignedDataTransferInstruction
# noinspection PyUnresolvedReferences
from amphisbaena.instruction import Condition, Register
# noinspection PyUnresolvedReferences
from amphisbaena.instruction.transfer.halfword_signed_data_transfer_instruction import \
    HalfwordSignedDataTransferOffsetType
# noinspection PyUnresolvedReferences
from amphisbaena.instruction.transfer.base_transfer import IndexingType, \
    OffsetDirection, TransferType


class TestHalfwordSignedDataTransferInstruction:

    def test_all_zeros(self):
        inst = 0b00000000_00000000_00000000_10010000
        instruction = HalfwordSignedDataTransferInstruction(inst)

        assert instruction.condition == Condition.EQ
        assert instruction.indexing_type == IndexingType.POST
        assert instruction.offset_direction == OffsetDirection.OFFSET_SUBTRACT
        assert instruction.offset_type == \
               HalfwordSignedDataTransferOffsetType. \
                   HSDTI_REGISTER_OFFSET
        assert instruction.write_back is False
        assert instruction.transfer_type == TransferType.STORE
        assert instruction.rn == Register.R00
        assert instruction.rd == Register.R00
        assert instruction.s is False
        assert instruction.h is False
        assert instruction.rm == Register.R00

    def test_indexing_type_field(self):
        inst = 0b00000001_00000000_00000000_10010000
        instruction = HalfwordSignedDataTransferInstruction(inst)

        assert instruction.indexing_type == IndexingType.PRE

    def test_offset_direction_field(self):
        inst = 0b00000000_10000000_00000000_10010000
        instruction = HalfwordSignedDataTransferInstruction(inst)

        assert instruction.offset_direction == OffsetDirection.OFFSET_ADD

    def test_offset_type_field(self):
        inst = 0b00000000_01000000_00000000_10010000
        instruction = HalfwordSignedDataTransferInstruction(inst)

        assert instruction.offset_type == \
               HalfwordSignedDataTransferOffsetType. \
                   HSDTI_IMMEDIATE_OFFSET

    def test_write_back_field(self):
        inst = 0b00000000_00100000_00000000_10010000
        instruction = HalfwordSignedDataTransferInstruction(inst)

        assert instruction.write_back is True

    def test_transfer_type_field(self):
        inst = 0b00000000_00010000_00000000_10010000
        instruction = HalfwordSignedDataTransferInstruction(inst)

        assert instruction.transfer_type == TransferType.LOAD

    def test_rn_field(self):
        inst = 0b00000000_00001001_00000000_10010000
        instruction = HalfwordSignedDataTransferInstruction(inst)

        assert instruction.rn == Register.R09

    def test_rd_field(self):
        inst = 0b00000000_00000000_11100000_10010000
        instruction = HalfwordSignedDataTransferInstruction(inst)

        assert instruction.rd == Register.R14

    def test_s_field(self):
        inst = 0b00000000_00000000_00000000_11010000
        instruction = HalfwordSignedDataTransferInstruction(inst)

        assert instruction.s is True

    def test_h_field(self):
        inst = 0b00000000_00000000_00000000_10110000
        instruction = HalfwordSignedDataTransferInstruction(inst)

        assert instruction.h is True

    def test_rm_field(self):
        inst = 0b00000000_00000000_00000000_100111000
        instruction = HalfwordSignedDataTransferInstruction(inst)

        assert instruction.rm == Register.R08

    def test_offset_field(self):
        inst = 0b00000000_01000000_00001010_10010010
        instruction = HalfwordSignedDataTransferInstruction(inst)

        assert instruction.offset_type == \
               HalfwordSignedDataTransferOffsetType. \
                   HSDTI_IMMEDIATE_OFFSET
        assert instruction.offset == 0b10100010
