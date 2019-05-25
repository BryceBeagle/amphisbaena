from amphisbaena.instruction.multiply_instruction import MultiplyInstruction
# noinspection PyUnresolvedReferences
from amphisbaena.instruction.base_instruction import Condition, Register


def test_multiply_instruction_bit_fields():

    inst = 0b00000000_00000000_00000000_10010000
    instruction = MultiplyInstruction(inst)

    assert instruction.condition == Condition.EQ
    assert instruction.a is False
    assert instruction.s is False
    assert instruction.rd == Register.R00
    assert instruction.rn == Register.R00
    assert instruction.rs == Register.R00
    assert instruction.rm == Register.R00

    inst = 0b10100000_00000000_00000000_10010000
    instruction = MultiplyInstruction(inst)

    assert instruction.condition == Condition.GE
    assert instruction.a is False
    assert instruction.s is False
    assert instruction.rd == Register.R00
    assert instruction.rn == Register.R00
    assert instruction.rs == Register.R00
    assert instruction.rm == Register.R00

    inst = 0b00000000_00100000_00000000_10010000
    instruction = MultiplyInstruction(inst)

    assert instruction.condition == Condition.EQ
    assert instruction.a is True
    assert instruction.s is False
    assert instruction.rd == Register.R00
    assert instruction.rn == Register.R00
    assert instruction.rs == Register.R00
    assert instruction.rm == Register.R00

    inst = 0b00000000_00010000_00000000_10010000
    instruction = MultiplyInstruction(inst)

    assert instruction.condition == Condition.EQ
    assert instruction.a is False
    assert instruction.s is True
    assert instruction.rd == Register.R00
    assert instruction.rn == Register.R00
    assert instruction.rs == Register.R00
    assert instruction.rm == Register.R00

    inst = 0b00000000_00001101_00000000_10010000
    instruction = MultiplyInstruction(inst)

    assert instruction.condition == Condition.EQ
    assert instruction.a is False
    assert instruction.s is False
    assert instruction.rd == Register.R13
    assert instruction.rn == Register.R00
    assert instruction.rs == Register.R00
    assert instruction.rm == Register.R00

    inst = 0b00000000_00000000_10010000_10010000
    instruction = MultiplyInstruction(inst)

    assert instruction.condition == Condition.EQ
    assert instruction.a is False
    assert instruction.s is False
    assert instruction.rd == Register.R00
    assert instruction.rn == Register.R09
    assert instruction.rs == Register.R00
    assert instruction.rm == Register.R00

    inst = 0b00000000_00000000_00001110_10010000
    instruction = MultiplyInstruction(inst)

    assert instruction.condition == Condition.EQ
    assert instruction.a is False
    assert instruction.s is False
    assert instruction.rd == Register.R00
    assert instruction.rn == Register.R00
    assert instruction.rs == Register.R14
    assert instruction.rm == Register.R00

    inst = 0b00000000_00000000_00000000_10011101
    instruction = MultiplyInstruction(inst)

    assert instruction.condition == Condition.EQ
    assert instruction.a is False
    assert instruction.s is False
    assert instruction.rd == Register.R00
    assert instruction.rn == Register.R00
    assert instruction.rs == Register.R00
    assert instruction.rm == Register.R13
