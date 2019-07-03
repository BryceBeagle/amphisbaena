from ..base_instruction cimport Instruction
from ..base_instruction cimport Flag, Register, ShiftAmount, ShiftFormat, \
    ShiftType
from .base_transfer cimport IndexingType, OffsetDirection, TransferQuantity, \
    TransferType

ctypedef unsigned int ImmediateOffset
"""12 bit unsigned integer"""

cdef class SingleDataTransferInstruction(Instruction):
    cpdef public SingleDataTransferOffsetType offset_type
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
    """Base register"""
    cpdef public Register rd
    """Source/destination register"""

    cpdef public ImmediateOffset immediate_offset
    """Offset from base"""

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

cpdef public enum SingleDataTransferOffsetType:
    SDTI_IMMEDIATE_OFFSET = 0,
    SDTI_SHIFT_AND_REGISTER_OFFSET = 1
