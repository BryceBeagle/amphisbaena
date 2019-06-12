from .base_instruction cimport Instruction
from .base_instruction cimport Flag, Register, ShiftAmount, ShiftFormat, \
    ShiftType

ctypedef unsigned int ImmediateOffset
"""12 bit unsigned integer"""

cdef class SingleDataTransferInstruction(Instruction):
    cpdef public OffsetType offset_type
    """Immediate or shift/register offset"""
    cpdef public IndexingType indexing_type
    """Add offset before or after transfer"""
    cpdef public OffsetDirection offset_direction
    """Subtract/add offset from/to base"""
    cpdef public TransferQuantity transfer_quantity
    """Transfer word or byte"""
    cpdef public Flag write_back
    """Write modified base value back into the base or keep old base value"""
    cpdef public TransferType transfer_type
    """Load or store transfer"""

    cpdef public Register rn
    cpdef public Register rd

    cpdef public ImmediateOffset immediate_offset

    ### Note: No rs for this instruction
    cpdef public ShiftType shift_type
    """Shift type"""
    cpdef public ShiftFormat shift_format
    """LSB of shift bit field that specifies whether to use immediate or 
    register"""
    cpdef public ShiftAmount shift_amount
    """5 bit unsigned integer"""
    cpdef public Register rm
    """Offset register"""

cpdef public enum OffsetType:
    OFFSET_IMMEDIATE = 0,
    SHIFT_AND_REGISTER = 1

cpdef public enum IndexingType:
    POST = 0, # Add offset after transfer
    PRE = 1  # Add offset before transfer

cpdef public enum OffsetDirection:
    OFFSET_SUBTRACT = 0
    OFFSET_ADD = 1,

cpdef public enum TransferQuantity:
    WORD = 0,
    BYTE = 1

cpdef public enum TransferType:
    STORE = 0,
    LOAD = 1
