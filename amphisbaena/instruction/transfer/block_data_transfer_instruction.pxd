from ..base_instruction cimport Instruction
from ..base_instruction cimport Flag, Register
from .base_transfer cimport IndexingType, OffsetDirection, TransferType

ctypedef unsigned int RegisterList
"""15 bit unsigned integer"""

cdef class BlockDataTransferInstruction(Instruction):
    cpdef public IndexingType indexing_type
    """Add offset before or after transfer"""
    cpdef public OffsetDirection offset_direction
    """Subtract/add offset from/to base"""
    cpdef public Flag s
    """Load PSR or force user mode"""
    cpdef public Flag write_back
    """Write modified base value back into the base or keep old base value"""
    cpdef public TransferType transfer_type
    """Load or store transfer"""
    cpdef public Register rn
    """Base register"""
    cpdef public RegisterList register_list
