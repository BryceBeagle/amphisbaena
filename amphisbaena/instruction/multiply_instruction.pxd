from .base_instruction cimport Instruction
from .base_instruction cimport Flag, Register

# arm7tdmi_datasheet_pt2.pdf#page=23
cdef class MultiplyInstruction(Instruction):
    cpdef public Flag a
    """Accumulate"""
    cpdef public Flag s
    """Set CSPR condition codes"""
    cpdef public Register rd
    """Destination register"""
    cpdef public Register rn
    """[Ignored] 1st operand register. Should be set to 0b0000"""
    cpdef public Register rs
    """2nd operand register"""
    cpdef public Register rm
    """3rd operand register"""

    cdef Register _rn(self)
