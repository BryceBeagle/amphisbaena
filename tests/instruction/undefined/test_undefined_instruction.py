from amphisbaena.instruction import BranchInstruction
# noinspection PyUnresolvedReferences
from amphisbaena.instruction import Condition
# noinspection PyUnresolvedReferences
from amphisbaena.instruction.branch.branch_instruction import BranchType


class TestBranchInstructionBitFields:

    def test_all_zeros(self):
        inst = 0b00001100_00000000_00000000_00000000
        instruction = BranchInstruction(inst)

        assert instruction.condition == Condition.EQ
