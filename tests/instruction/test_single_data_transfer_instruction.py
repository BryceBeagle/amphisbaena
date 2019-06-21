from amphisbaena.instruction import SingleDataTransferInstruction
# noinspection PyUnresolvedReferences
from amphisbaena.instruction import Condition, Register
# noinspection PyUnresolvedReferences
from amphisbaena.instruction.base_instruction import ShiftFormat, ShiftType
# noinspection PyUnresolvedReferences
from amphisbaena.instruction.transfer.base_transfer import IndexingType, \
    OffsetDirection, TransferQuantity, TransferType
# noinspection PyUnresolvedReferences
from amphisbaena.instruction.transfer.single_data_transfer_instruction import \
    SingleDataTransferOffsetType


class TestSingleDataProcessingInstructionBitFields:

    def test_all_zeros(self):
        inst = 0b00000100_00000000_00000000_00000000
        instruction = SingleDataTransferInstruction(inst)

        assert instruction.condition == Condition.EQ
        assert instruction.offset_type == SingleDataTransferOffsetType. \
            SDTI_IMMEDIATE_OFFSET
        assert instruction.indexing_type == IndexingType.POST
        assert instruction.offset_direction == OffsetDirection.OFFSET_SUBTRACT
        assert instruction.transfer_quantity == TransferQuantity.WORD
        assert instruction.write_back is False
        assert instruction.transfer_type == TransferType.STORE
        assert instruction.rn == Register.R00
        assert instruction.rd == Register.R00
        assert instruction.immediate_offset == 0

    def test_offset_type_field(self):
        inst = 0b00000110_00000000_00000000_00000000
        instruction = SingleDataTransferInstruction(inst)

        assert instruction.offset_type == SingleDataTransferOffsetType. \
            SDTI_SHIFT_AND_REGISTER_OFFSET

    def test_indexing_type_field(self):
        inst = 0b00000101_00000000_00000000_00000000
        instruction = SingleDataTransferInstruction(inst)

        assert instruction.indexing_type == IndexingType.PRE

    def test_offset_direction_field(self):
        inst = 0b00000100_10000000_00000000_00000000
        instruction = SingleDataTransferInstruction(inst)

        assert instruction.offset_direction == OffsetDirection.OFFSET_ADD

    def test_transfer_quantity_field(self):
        inst = 0b00000100_01000000_00000000_00000000
        instruction = SingleDataTransferInstruction(inst)

        assert instruction.transfer_quantity == TransferQuantity.BYTE

    def test_write_back_field(self):
        inst = 0b00000100_00100000_00000000_00000000
        instruction = SingleDataTransferInstruction(inst)

        assert instruction.write_back is True

    def test_transfer_type_field(self):
        inst = 0b00000100_00010000_00000000_00000000
        instruction = SingleDataTransferInstruction(inst)

        assert instruction.transfer_type == TransferType.LOAD

    def test_rn_field(self):
        inst = 0b00000100_00001001_00000000_00000000
        instruction = SingleDataTransferInstruction(inst)

        assert instruction.rn == Register.R09

    def test_rd_field(self):
        inst = 0b00000100_00000000_11100000_00000000
        instruction = SingleDataTransferInstruction(inst)

        assert instruction.rd == Register.R14

    def test_immediate_offset_field(self):
        inst = 0b00000100_00000000_00001010_11011000
        instruction = SingleDataTransferInstruction(inst)

        assert instruction.immediate_offset == 0b1010_11011000

    def test_shift_format_field(self):
        inst = 0b00000110_00000000_00000000_00010000
        instruction = SingleDataTransferInstruction(inst)

        assert instruction.offset_type == SingleDataTransferOffsetType. \
            SDTI_SHIFT_AND_REGISTER_OFFSET
        assert instruction.shift_format == ShiftFormat.REGISTER

    def test_shift_type_field(self):
        inst = 0b00000110_00000000_00000000_01000000
        instruction = SingleDataTransferInstruction(inst)

        assert instruction.offset_type == SingleDataTransferOffsetType. \
            SDTI_SHIFT_AND_REGISTER_OFFSET
        assert instruction.shift_type == ShiftType.ASR

    def test_shift_amount_field(self):
        inst = 0b00000110_00000000_00001000_10000000
        instruction = SingleDataTransferInstruction(inst)

        assert instruction.offset_type == SingleDataTransferOffsetType. \
            SDTI_SHIFT_AND_REGISTER_OFFSET
        assert instruction.shift_amount == 0b10001
