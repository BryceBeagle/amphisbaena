from ..base_instruction cimport Instruction

ctypedef unsigned int CommentField
"""24 bit unsigned integer (for now at least)"""

cdef class SoftwareInterruptInstruction(Instruction):
    cpdef public CommentField comment_field
    """Ignored by processor, but maybe not?"""
