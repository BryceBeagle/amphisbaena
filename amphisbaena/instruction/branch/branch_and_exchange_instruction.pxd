from ..base_instruction cimport Instruction
from ..base_instruction cimport Register

cdef class BranchAndExchangeInstruction(Instruction):
    cpdef public Register rn
    """Operand register
    
    If bit 0 == 0, subsequent instructions decoded as ARM
    If bit 0 == 1, subsequent instructions decoded as THUMB
    """
