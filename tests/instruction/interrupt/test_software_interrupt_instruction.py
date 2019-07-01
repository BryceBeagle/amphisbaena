from amphisbaena.instruction import SoftwareInterruptInstruction
# noinspection PyUnresolvedReferences
from amphisbaena.instruction import Condition


class TestSingleDataSwapInstructionBitFields:

    def test_all_zeros(self):
        inst = 0b00001111_00000000_00000000_00000000
        instruction = SoftwareInterruptInstruction(inst)

        assert instruction.condition == Condition.EQ
        assert instruction.comment_field == 0b00000000_00000000_00000000

    def test_comment_field(self):

        inst = 0b00001111_10110010_10111010_11000111
        instruction = SoftwareInterruptInstruction(inst)

        assert instruction.comment_field == 0b10110010_10111010_11000111
