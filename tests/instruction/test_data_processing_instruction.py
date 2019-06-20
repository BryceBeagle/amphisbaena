from amphisbaena.instruction import DataProcessingInstruction
# noinspection PyUnresolvedReferences
from amphisbaena.instruction import Condition, Register
# noinspection PyUnresolvedReferences
from amphisbaena.instruction.base_instruction import ShiftFormat, ShiftType
# noinspection PyUnresolvedReferences
from amphisbaena.instruction.data_processing import DataProcessingOpcode


class TestDataProcessingInstructionBitFields:

    def test_all_zeros(self):
        inst = 0b00000000_00000000_00000000_00000000
        instruction = DataProcessingInstruction(inst)

        assert instruction.condition == Condition.EQ
        assert instruction.i is False
        assert instruction.opcode == DataProcessingOpcode.AND
        assert instruction.s is False
        assert instruction.rn == Register.R00
        assert instruction.rd == Register.R00

        assert instruction.rm == Register.R00
        assert instruction.shift_format == ShiftFormat.IMMEDIATE
        assert instruction.shift_type == ShiftType.LSL
        assert instruction.shift_amount == 0

    def test_condition_field(self):
        inst = 0b11100000_00000000_00000000_00000000
        instruction = DataProcessingInstruction(inst)

        assert instruction.condition == Condition.AL

    def test_opcode_field(self):
        inst = 0b00000001_00100000_00000000_00000000
        instruction = DataProcessingInstruction(inst)

        assert instruction.opcode == DataProcessingOpcode.TEQ

    def test_s_field(self):
        inst = 0b00000000_00010000_00000000_00000000
        instruction = DataProcessingInstruction(inst)

        assert instruction.s is True

    def test_rn_field(self):
        inst = 0b00000000_00001100_00000000_00000000
        instruction = DataProcessingInstruction(inst)

        assert instruction.rn == Register.R12

    def test_rd_field(self):
        inst = 0b00000000_00000000_10100000_00000000
        instruction = DataProcessingInstruction(inst)

        assert instruction.rd == Register.R10

    def test_shift_type_field(self):
        inst = 0b00000000_00000000_00000000_01100000
        instruction = DataProcessingInstruction(inst)

        assert instruction.i is False
        assert instruction.shift_type == ShiftType.ROR

    def test_immediate_shift_amount_field(self):
        """Shift controlled by immediate value"""
        inst = 0b00000000_00000000_00001001_00000000
        instruction = DataProcessingInstruction(inst)

        assert instruction.i is False
        assert instruction.shift_format == ShiftFormat.IMMEDIATE
        assert instruction.shift_amount == 0b10010

    def test_shift_register_field(self):
        """Shift controlled by register"""
        inst = 0b00000000_00000000_00001001_00010000
        instruction = DataProcessingInstruction(inst)

        assert instruction.i is False
        assert instruction.shift_format == ShiftFormat.REGISTER
        assert instruction.rs == Register.R09

    def test_rm_field(self):
        inst = 0b00000000_00000000_00000000_0001011
        instruction = DataProcessingInstruction(inst)

        assert instruction.i is False
        assert instruction.rm == Register.R11

    def test_rotate_field(self):
        inst = 0b00000010_00000000_00001010_00000000
        instruction = DataProcessingInstruction(inst)

        assert instruction.i is True
        assert instruction.rotate == 0b1010

    def test_immediate_field(self):
        inst = 0b00000010_00000000_00000000_10101001
        instruction = DataProcessingInstruction(inst)

        assert instruction.i is True
        assert instruction.imm == 0b10101001
