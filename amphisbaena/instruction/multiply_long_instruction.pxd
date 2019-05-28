from .base_instruction cimport Instruction
from .base_instruction cimport Flag, Register

cdef class MultiplyLongInstruction(Instruction):
    """Multiply and write a 64bit int to RdHi and RdLo"""

    cpdef public Flag signed_
    """Treat all operands as unsigned and write an unsigned 64 bit result"""
    cpdef public Flag accumulate
    """Add result of multiplication to RdHi and RdLo (i.e. accumulate)"""
    cpdef public Flag s
    """Set CSPR condition codes"""
    cpdef public Register rd_hi
    """Register to write upper 32 bits of result to"""
    cpdef public Register rd_lo
    """Register to write lower 32 bits of result to"""
    cpdef public Register rs
    """Register holding multiplier"""
    cpdef public Register rm
    """Register holding multiplicand"""
