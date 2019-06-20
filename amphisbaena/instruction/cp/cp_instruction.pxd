from ..base_instruction cimport Instruction
from ..base_instruction cimport Flag, Register, Offset

ctypedef Register CPRegister
ctypedef struct CPNum:
    bint[4] _
ctypedef struct CPOpcodeSmall:
    bint[3] _
ctypedef struct CPOpcodeLarge:
    bint[4] _
ctypedef struct CPInfo:
    bint[3] _

cdef class CoprocessorDataTransferInstruction(Instruction):
    cpdef public Flag p
    cpdef public Flag u
    cpdef public Flag n
    cpdef public Flag w
    cpdef public Flag l
    cpdef public Register rn
    cpdef public CPRegister cp_rd
    cpdef public CPNum cp_num
    cpdef public Offset[8] offset  # Unsigned

cdef class CoprocessorDataOperationInstruction(Instruction):
    cpdef public CPOpcodeLarge cp_opcode
    cpdef public CPRegister cp_rn
    cpdef public CPRegister cp_rd
    cpdef public CPNum cp_num
    cpdef public CPInfo cp_info
    cpdef public CPRegister cp_rm

cdef class CoprocessorRegisterTransferInstruction(Instruction):
    cpdef public CPOpcodeSmall cp_op_mode
    cpdef public Flag l
    cpdef public CPRegister cp_rn
    cpdef public Register rd
    cpdef public CPNum cp_num
    cpdef public CPInfo cp_info
    cpdef public CPRegister cp_rm
