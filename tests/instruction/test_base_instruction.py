from amphisbaena.instruction import Instruction
# noinspection PyUnresolvedReferences
from amphisbaena.instruction import Condition


def test_instruction_conditions():
    inst = 0b00000000_00000000_00000000_00000000
    assert Instruction(inst).condition == Condition.EQ

    inst = 0b00010000_00000000_00000000_00000000
    assert Instruction(inst).condition == Condition.NE

    inst = 0b00100000_00000000_00000000_00000000
    assert Instruction(inst).condition == Condition.CS

    inst = 0b00110000_00000000_00000000_00000000
    assert Instruction(inst).condition == Condition.CC

    inst = 0b01000000_00000000_00000000_00000000
    assert Instruction(inst).condition == Condition.MI

    inst = 0b01010000_00000000_00000000_00000000
    assert Instruction(inst).condition == Condition.PL

    inst = 0b01100000_00000000_00000000_00000000
    assert Instruction(inst).condition == Condition.VS

    inst = 0b01110000_00000000_00000000_00000000
    assert Instruction(inst).condition == Condition.VC

    inst = 0b10000000_00000000_00000000_00000000
    assert Instruction(inst).condition == Condition.HI

    inst = 0b10010000_00000000_00000000_00000000
    assert Instruction(inst).condition == Condition.LS

    inst = 0b10100000_00000000_00000000_00000000
    assert Instruction(inst).condition == Condition.GE

    inst = 0b10110000_00000000_00000000_00000000
    assert Instruction(inst).condition == Condition.LT

    inst = 0b11000000_00000000_00000000_00000000
    assert Instruction(inst).condition == Condition.GT

    inst = 0b11010000_00000000_00000000_00000000
    assert Instruction(inst).condition == Condition.LE

    inst = 0b11100000_00000000_00000000_00000000
    assert Instruction(inst).condition == Condition.AL

    inst = 0b11110000_00000000_00000000_00000000
    assert Instruction(inst).condition == Condition.RESERVED
