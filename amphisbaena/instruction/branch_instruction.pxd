from .base_instruction cimport Instruction

ctypedef int Offset
"""24 bit signed integer"""

cdef class BranchInstruction(Instruction):
    cpdef public BranchType branch_type
    """Branch with or without link"""
    cpdef public Offset offset
    """Immediate signed 24 bit offset. Will be sign extended to 32 bits"""

    cpdef Offset _offset(self)

cpdef public enum BranchType:
    BRANCH,
    BRANCH_WITH_LINK
