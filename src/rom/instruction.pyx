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

# >>> ctypedef bint Condition[4] throws a build error
# Trying to avoid https://stackoverflow.com/a/4523537/8134178 but this may not
# be necessary
# TODO: Maybe structs of bints are bad?
ctypedef bint Flag
ctypedef struct Condition:
    bint[4] _
ctypedef struct Opcode:
    bint [4] _
ctypedef struct Register:
    bint[4] _
ctypedef struct Operand:
    bint[12] _
ctypedef struct RegisterList:
    bint[12] _
ctypedef bint Offset  # Make an array (struct?) of these yourself

ctypedef Register CPRegister
ctypedef struct CPNum:
    bint[4] _
ctypedef struct CPOpcodeSmall:
    bint[3] _
ctypedef struct CPOpcodeLarge:
    bint[4] _
ctypedef struct CPInfo:
    bint[3] _

cdef class BaseInstruction:
    cpdef public Condition condition

# And FSR Transfer Instruction (I think for debugging)
cdef class DataProcessing(BaseInstruction):
    cpdef public Opcode opcode
    cpdef public Flag s  # Update CSPR flags
    cpdef public Register rn
    cpdef public Register rd
    cpdef public Operand operand2

cdef class MultiplyInstruction(BaseInstruction):
    cpdef public Flag a
    cpdef public Flag s  # Update CSPR flags
    cpdef public Register rd
    cpdef public Register rn
    cpdef public Register rs
    cpdef public Register rm

cdef class MultiplyLongInstruction(BaseInstruction):
    cpdef public Flag u
    cpdef public Flag a
    cpdef public Flag s  # Update CSPR flags
    cpdef public Register rd_hi
    cpdef public Register rd_lo
    cpdef public Register rs
    cpdef public Register rm

cdef class SingleDataSwapInstruction(BaseInstruction):
    cpdef public Flag b
    cpdef public Register rn
    cpdef public Register rd
    cpdef public Register rm

cdef class BranchAndExchangeInstruction(BaseInstruction):
    cpdef public Register rn

cdef class HalfwordDataTransferRegisterOffsetInstruction(BaseInstruction):
    cpdef public Flag p
    cpdef public Flag u
    cpdef public Flag w
    cpdef public Flag l
    cpdef public Register rn
    cpdef public Register rd
    cpdef public Flag s
    cpdef public Flag h
    cpdef public Register rm

cdef class HalfwordDataTransferRegisterImmediateInstruction(BaseInstruction):
    cpdef public Flag p
    cpdef public Flag u
    cpdef public Flag w
    cpdef public Flag l
    cpdef public Register rn
    cpdef public Register rd
    cpdef public Offset[4] offset_hi  # Unsigned
    cpdef public Flag s
    cpdef public Flag h
    cpdef public Offset[4] offset_lo  # Unsigned

cdef class SingleDataTransferInstruction(BaseInstruction):
    cpdef public Flag p
    cpdef public Flag u
    cpdef public Flag b
    cpdef public Flag w
    cpdef public Flag l
    cpdef public Register rn
    cpdef public Register rd
    cpdef public Offset[12] offset  # Unsigned

cdef class BlockDataTransferInstruction(BaseInstruction):
    cpdef public Flag p
    cpdef public Flag u
    cpdef public Flag s
    cpdef public Flag w
    cpdef public Flag l
    cpdef public Register rn
    cpdef public RegisterList register_list

cdef class BranchInstruction(BaseInstruction):
    cpdef public Flag l
    cpdef public Offset[24] offset  # Signed

cdef class CoprocessorDataTransferInstruction(BaseInstruction):
    cpdef public Flag p
    cpdef public Flag u
    cpdef public Flag n
    cpdef public Flag w
    cpdef public Flag l
    cpdef public Register rn
    cpdef public CPRegister cp_rd
    cpdef public CPNum cp_num
    cpdef public Offset[8] offset  # Unsigned

cdef class CoprocessorDataOperationInstruction(BaseInstruction):
    cpdef public CPOpcodeLarge cp_opcode
    cpdef public CPRegister cp_rn
    cpdef public CPRegister cp_rd
    cpdef public CPNum cp_num
    cpdef public CPInfo cp_info
    cpdef public CPRegister cp_rm

cdef class CoprocessorRegisterTransferInstruction(BaseInstruction):
    cpdef public CPOpcodeSmall cp_op_mode
    cpdef public Flag l
    cpdef public CPRegister cp_rn
    cpdef public Register rd
    cpdef public CPNum cp_num
    cpdef public CPInfo cp_info
    cpdef public CPRegister cp_rm

cdef class SoftwareInterruptInstruction(BaseInstruction):
    pass

# Explicit undefined, not unknown instruction
cdef class UndefinedInstruction(BaseInstruction):
    pass
