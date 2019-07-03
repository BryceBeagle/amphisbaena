from ..base_instruction cimport Instruction
from ..base_instruction cimport Flag, Register
from .base_transfer cimport IndexingType, OffsetDirection, TransferType

ctypedef unsigned int ImmediateOffset
"""8 bit unsigned integer"""

cdef class HalfwordSignedDataTransferInstruction(Instruction):
    cpdef public IndexingType indexing_type
    """Add offset before or after transfer"""
    cpdef public OffsetDirection offset_direction
    """Subtract/add offset from/to base"""
    cpdef public HalfwordSignedDataTransferOffsetType offset_type
    """Switches between register and immediate based offsets
    
    offset_type == 0 selects register-based offset 
    offset_type == 1 selects immediate-based offset 
    """
    cpdef public Flag write_back
    """Write modified base value back into the base or keep old base value"""
    cpdef public TransferType transfer_type
    """Load or store transfer"""
    cpdef public Register rn
    """Base register"""
    cpdef public Register rd
    """Source/destination register"""
    cpdef public ImmediateOffset immediate_offset
    """Offset from base. Formed by concatenating bits 0-3 and 8-11"""
    cpdef public Flag s
    """Controls the loading of sign extended data
    
    When s == 1, the h Flag selects between bytes (h == 0) and half-words 
    (h == 1)
    
    When s == 0 and h == 1, unsigned half-words are transferred between an 
    ARM7TDMI register and memory
    """
    cpdef public Flag h
    """See docstring for s Flag"""
    cpdef public Register rm
    """Offset register"""

    cdef ImmediateOffset _immediate_offset(self)

cpdef public enum HalfwordSignedDataTransferOffsetType:
    HSDTI_REGISTER_OFFSET = 0,
    HSDTI_IMMEDIATE_OFFSET = 1
