from amphisbaena.instruction import SingleDataSwapInstruction
# noinspection PyUnresolvedReferences
from amphisbaena.instruction import Condition, Register
# noinspection PyUnresolvedReferences
from amphisbaena.instruction.swap.single_data_swap_instruction \
    import SwapQuantity


class TestSingleDataSwapInstructionBitFields:

    def test_all_zeros(self):
        inst = 0b0000001_00000000_00000000_10010000
        instruction = SingleDataSwapInstruction(inst)

        assert instruction.condition == Condition.EQ
        assert instruction.swap_quantity == SwapQuantity.WORD
        assert instruction.rn == Register.R00
        assert instruction.rd == Register.R00
        assert instruction.rm == Register.R00

    def test_swap_quantity_field(self):
        inst = 0b00000001_01000000_00000000_10010000
        instruction = SingleDataSwapInstruction(inst)

        assert instruction.swap_quantity == SwapQuantity.BYTE

    def test_rn_field(self):
        inst = 0b00000001_00001101_00000000_10010000
        instruction = SingleDataSwapInstruction(inst)

        assert instruction.rn == Register.R13

    def test_rd_field(self):
        inst = 0b00000001_00000000_10010000_10010000
        instruction = SingleDataSwapInstruction(inst)

        assert instruction.rd == Register.R09

    def test_rm_field(self):
        inst = 0b00000001_00000000_00000000_10011000
        instruction = SingleDataSwapInstruction(inst)

        assert instruction.rm == Register.R08
