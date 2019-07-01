from amphisbaena.instruction import BranchAndExchangeInstruction
# noinspection PyUnresolvedReferences
from amphisbaena.instruction import Condition, Register


class TestBranchAndExchangeInstructionBitFields:

    def test_all_zeros(self):
        inst = 0b00000001_00101111_11111111_00010000
        instruction = BranchAndExchangeInstruction(inst)

        assert instruction.condition == Condition.EQ
        assert instruction.rn == Register.R00

    def test_rn_field(self):
        inst = 0b00000001_00101111_11111111_00011001
        instruction = BranchAndExchangeInstruction(inst)

        assert instruction.rn == Register.R09
