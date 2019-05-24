ctypedef enum InstructionTypes:
    DATA_PROCESSING,
    MULTIPLY,
    MULTIPLY_LONG,
    SINGLE_DATA_SWAP,
    BRANCH_AND_EXCHANGE,
    HALFWORD_DATA_TRANSFER_IMMEDIATE_OFFSET,
    SINGLE_DATA_TRANSFER,
    BLOCK_DATA_TRANSFER,
    BRANCH,
    COPROCESSOR_DATA_TRANSFER,
    COPROCESSOR_DATA_OPERATION,
    COPROCESSOR_REGISTER_TRANSFER,
    SOFTWARE_INTERRUPT,
    UNDEFINED

cdef class BaseInstruction:

    def __init__(self):
        print(self.condition)

    property condition:
        def __get__(self):
            return 0b0000