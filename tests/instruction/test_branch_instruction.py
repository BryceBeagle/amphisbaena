from amphisbaena.instruction import BranchInstruction
# noinspection PyUnresolvedReferences
from amphisbaena.instruction import Condition
# noinspection PyUnresolvedReferences
from amphisbaena.instruction.branch.branch_instruction import BranchType


class TestBranchInstructionBitFields:

    def test_all_zeros(self):
        inst = 0b00001010_00000000_00000000_00000000
        instruction = BranchInstruction(inst)

        assert instruction.condition == Condition.EQ
        assert instruction.branch_type == BranchType.BRANCH
        assert instruction.offset == 0

    def test_branch_type_field(self):
        inst = 0b00001011_00000000_00000000_00000000
        instruction = BranchInstruction(inst)

        assert instruction.branch_type == BranchType.BRANCH_WITH_LINK

    def test_offset_field(self):
        inst = 0b00001010_00000000_00000000_00000111
        instruction = BranchInstruction(inst)

        assert instruction.offset == 28

    def test_offset_field_negative(self):
        inst = 0b00001010_11111111_11111111_11111111
        instruction = BranchInstruction(inst)

        assert instruction.offset == -4
