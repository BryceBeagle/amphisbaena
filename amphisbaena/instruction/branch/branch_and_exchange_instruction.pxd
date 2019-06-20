from ..base_instruction cimport Instruction
from ..base_instruction cimport Register

cdef class BranchAndExchangeInstruction(Instruction):
    cpdef public Register rn
    """Operand register"""
