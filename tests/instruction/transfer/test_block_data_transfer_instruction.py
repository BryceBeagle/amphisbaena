from amphisbaena.instruction import BlockDataTransferInstruction
# noinspection PyUnresolvedReferences
from amphisbaena.instruction import Condition, Register
# noinspection PyUnresolvedReferences
from amphisbaena.instruction.transfer.base_transfer import IndexingType, \
    OffsetDirection, TransferType


class TestBlockDataTransferInstructionBitFields:

    def test_all_zeros(self):
        inst = 0b00001000_00000000_00000000_00000000
        instruction = BlockDataTransferInstruction(inst)

        assert instruction.condition == Condition.EQ
        assert instruction.indexing_type == IndexingType.POST
        assert instruction.offset_direction == OffsetDirection.OFFSET_SUBTRACT
        assert instruction.s is False
        assert instruction.write_back is False
        assert instruction.transfer_type == TransferType.STORE
        assert instruction.rn == Register.R00
        assert instruction.register_list == 0b0000000_00000000

    def test_indexing_type_field(self):
        inst = 0b00001001_00000000_00000000_00000000
        instruction = BlockDataTransferInstruction(inst)

        assert instruction.indexing_type == IndexingType.PRE

    def test_offset_direction_field(self):
        inst = 0b00001000_10000000_00000000_00000000
        instruction = BlockDataTransferInstruction(inst)

        assert instruction.offset_direction == OffsetDirection.OFFSET_ADD

    def test_s_field(self):
        inst = 0b00001000_01000000_00000000_00000000
        instruction = BlockDataTransferInstruction(inst)

        assert instruction.s is True

    def test_write_back_field(self):
        inst = 0b00001000_00100000_00000000_00000000
        instruction = BlockDataTransferInstruction(inst)

        assert instruction.write_back is True

    def test_transfer_type_field(self):
        inst = 0b00001000_00010000_00000000_00000000
        instruction = BlockDataTransferInstruction(inst)

        assert instruction.transfer_type == TransferType.LOAD

    def test_rn_field(self):
        inst = 0b00001000_00001001_00000000_00000000
        instruction = BlockDataTransferInstruction(inst)

        assert instruction.rn == Register.R09

    def test_register_list_field(self):
        inst = 0b00001000_00000000_00101000_00001011
        instruction = BlockDataTransferInstruction(inst)

        assert instruction.register_list == 0b101000_00001011
