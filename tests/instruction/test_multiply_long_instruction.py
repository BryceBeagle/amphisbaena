from amphisbaena.instruction import MultiplyLongInstruction
# noinspection PyUnresolvedReferences
from amphisbaena.instruction import Condition, Register


class TestMultiplyLongInstructionBitFields:

    def test_all_zeros(self):

        inst = 0b00000000_10000000_00000000_10010000
        instruction = MultiplyLongInstruction(inst)

        assert instruction.condition == Condition.EQ
        assert instruction.signed_ is False
        assert instruction.accumulate is False
        assert instruction.s is False
        assert instruction.rd_hi == Register.R00
        assert instruction.rd_lo == Register.R00
        assert instruction.rs == Register.R00
        assert instruction.rm == Register.R00

    def test_condition_field(self):

        inst = 0b11100000_10000000_00000000_10010000
        instruction = MultiplyLongInstruction(inst)

        assert instruction.condition == Condition.AL

    def test_signed_field(self):

        inst = 0b00000000_11000000_00000000_10010000
        instruction = MultiplyLongInstruction(inst)

        assert instruction.signed_ is True

    def test_accumulate_field(self):

        inst = 0b00000000_10100000_00000000_10010000
        instruction = MultiplyLongInstruction(inst)

        assert instruction.accumulate is True

    def test_s_field(self):

        inst = 0b00000000_10010000_00000000_10010000
        instruction = MultiplyLongInstruction(inst)

        assert instruction.s is True

    def test_rd_hi_field(self):

        inst = 0b00000000_10001011_00000000_10010000
        instruction = MultiplyLongInstruction(inst)

        assert instruction.rd_hi == Register.R11

    def test_rd_lo_field(self):

        inst = 0b00000000_10000000_11110000_10010000
        instruction = MultiplyLongInstruction(inst)

        assert instruction.rd_lo == Register.R15_PC

    def test_rs_field(self):

        inst = 0b00000000_10000000_00001001_10010000
        instruction = MultiplyLongInstruction(inst)

        assert instruction.rs == Register.R09

    def test_rm_field(self):

        inst = 0b00000000_10000000_00000000_10011100
        instruction = MultiplyLongInstruction(inst)

        assert instruction.rm == Register.R12
