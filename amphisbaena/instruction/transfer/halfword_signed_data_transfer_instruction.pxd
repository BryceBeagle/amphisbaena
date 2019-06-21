from ..base_instruction cimport Instruction
from ..base_instruction cimport Flag, Register
from .base_transfer cimport IndexingType, OffsetDirection, TransferType

ctypedef unsigned int ImmediateOffset
"""8 bit unsigned integer"""

cdef class HalfwordSignedDataTransferInstruction(Instruction):
    cpdef public IndexingType indexing_type
    cpdef public OffsetDirection offset_direction
    cpdef public HalfwordSignedDataTransferOffsetType offset_type
    cpdef public Flag write_back
    cpdef public TransferType transfer_type
    cpdef public Register rn
    cpdef public Register rd
    cpdef public ImmediateOffset immediate_offset
    cpdef public Flag s
    cpdef public Flag h
    cpdef public Register rm
    cpdef public ImmediateOffset offset

    cdef ImmediateOffset _offset(self)

cpdef public enum HalfwordSignedDataTransferOffsetType:
    HSDTI_REGISTER_OFFSET = 0,
    HSDTI_IMMEDIATE_OFFSET = 1
