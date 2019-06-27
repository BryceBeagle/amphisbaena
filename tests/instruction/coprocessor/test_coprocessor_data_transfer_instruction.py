from amphisbaena.instruction import CoprocessorDataTransferInstruction
# noinspection PyUnresolvedReferences
from amphisbaena.instruction import Condition, Register
# noinspection PyUnresolvedReferences
from amphisbaena.instruction.swap.single_data_swap_instruction \
    import SwapQuantity
# noinspection PyUnresolvedReferences
from amphisbaena.instruction.transfer.base_transfer import IndexingType, \
    OffsetDirection, TransferType


class TestCoprocessorDataTransferInstructionBitFields:

    def test_all_zeros(self):
        inst = 0b00001100_00000000_00000000_00000000
        instruction = CoprocessorDataTransferInstruction(inst)

        assert instruction.condition == Condition.EQ
        assert instruction.indexing_type == IndexingType.POST
        assert instruction.offset_direction == OffsetDirection.OFFSET_SUBTRACT
        assert instruction.transfer_length == 0
        assert instruction.write_back is False
        assert instruction.transfer_type == TransferType.STORE
        assert instruction.rn == Register.R00
        assert instruction.cp_rd == Register.R00
        assert instruction.cp_num == 0
        assert instruction.offset == 0b00000000

    def test_indexing_type_field(self):
        inst = 0b00001101_00000000_00000000_00000000
        instruction = CoprocessorDataTransferInstruction(inst)

        assert instruction.indexing_type == IndexingType.PRE

    def test_offset_direction_field(self):
        inst = 0b00001100_10000000_00000000_00000000
        instruction = CoprocessorDataTransferInstruction(inst)

        assert instruction.offset_direction == OffsetDirection.OFFSET_ADD

    def test_transfer_length_field(self):
        inst = 0b00001100_01000000_00000000_00000000
        instruction = CoprocessorDataTransferInstruction(inst)

        assert instruction.transfer_length == 1

    def test_write_back_field(self):
        inst = 0b00001100_00100000_00000000_00000000
        instruction = CoprocessorDataTransferInstruction(inst)

        assert instruction.write_back is True

    def test_transfer_type_field(self):
        inst = 0b00001100_00010000_00000000_00000000
        instruction = CoprocessorDataTransferInstruction(inst)

        assert instruction.transfer_type == TransferType.LOAD

    def test_rn_field(self):
        inst = 0b00001100_00001001_00000000_00000000
        instruction = CoprocessorDataTransferInstruction(inst)

        assert instruction.rn == Register.R09

    def test_cp_rd_field(self):
        inst = 0b00001100_00000000_11100000_00000000
        instruction = CoprocessorDataTransferInstruction(inst)

        assert instruction.cp_rd == Register.R14

    def test_cp_num_field(self):
        inst = 0b00001100_00000000_00001010_00000000
        instruction = CoprocessorDataTransferInstruction(inst)

        assert instruction.cp_num == 10

    def test_offset_field(self):
        inst = 0b00001100_00000000_00000000_10010100
        instruction = CoprocessorDataTransferInstruction(inst)

        assert instruction.offset == 0b10010100
