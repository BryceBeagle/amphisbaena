from ..base_instruction cimport Instruction
from ..base_instruction cimport Register

cdef class SingleDataSwapInstruction(Instruction):
    cpdef public SwapQuantity swap_quantity
    """Amount of data to swap (byte or word)"""
    cpdef public Register rn
    """Base register"""
    cpdef public Register rd
    """Destination register"""
    cpdef public Register rm
    """Source register"""

cpdef public enum SwapQuantity:
    WORD = 0,
    BYTE = 1
