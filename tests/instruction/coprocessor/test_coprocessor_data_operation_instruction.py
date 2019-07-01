from amphisbaena.instruction import CoprocessorDataOperationsInstruction
# noinspection PyUnresolvedReferences
from amphisbaena.instruction import Condition, Register
# noinspection PyUnresolvedReferences
from amphisbaena.instruction.transfer.base_transfer import IndexingType, \
    OffsetDirection, TransferType


class TestCoprocessorDataTransferInstructionBitFields:

    def test_all_zeros(self):
        inst = 0b00001110_00000000_00000000_00000000
        instruction = CoprocessorDataOperationsInstruction(inst)

        assert instruction.condition == Condition.EQ
        assert instruction.cp_opcode == 0b0000
        assert instruction.cp_rn == Register.R00
        assert instruction.cp_rd == Register.R00
        assert instruction.cp_num == 0b0000
        assert instruction.cp_info == 0b000
        assert instruction.cp_rm == Register.R00

    def test_cp_opcode_field(self):
        inst = 0b00001110_11010000_00000000_00000000
        instruction = CoprocessorDataOperationsInstruction(inst)

        assert instruction.cp_opcode == 0b1101

    def test_cp_rn_field(self):
        inst = 0b00001110_00001101_00000000_00000000
        instruction = CoprocessorDataOperationsInstruction(inst)

        assert instruction.cp_rn == Register.R13

    def test_cp_rd_field(self):
        inst = 0b00001110_00000000_11000000_00000000
        instruction = CoprocessorDataOperationsInstruction(inst)

        assert instruction.cp_rd == Register.R12

    def test_cp_num_field(self):
        inst = 0b00001110_00000000_00001111_00000000
        instruction = CoprocessorDataOperationsInstruction(inst)

        assert instruction.cp_num == 0b1111

    def test_cp_info_field(self):
        inst = 0b00001110_00000000_00000000_10100000
        instruction = CoprocessorDataOperationsInstruction(inst)

        assert instruction.cp_info == 0b101

    def test_cp_rm_field(self):
        inst = 0b00001110_00000000_00000000_00001000
        instruction = CoprocessorDataOperationsInstruction(inst)

        assert instruction.cp_rm == Register.R08
