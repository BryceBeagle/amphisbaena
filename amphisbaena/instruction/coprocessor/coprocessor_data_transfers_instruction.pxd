from ..base_instruction cimport Instruction
from ..base_instruction cimport Flag, Register
# noinspection PyUnresolvedReferences
from ..transfer.base_transfer cimport IndexingType, OffsetDirection, \
    TransferType
from .base_coprocessor cimport CPNum

ctypedef unsigned int Offset
"""8 bit unsigned integer"""

cdef class CoprocessorDataTransfersInstruction(Instruction):
    cpdef public IndexingType indexing_type
    """Calculation performed before or after the base is used as the transfer
    address"""
    cpdef public OffsetDirection offset_direction
    """Whether to add/subtract the immediate offset"""
    cpdef public unsigned int transfer_length
    """By convention, used to choose one of two transfer length options.
    For example, N=0 could select the transfer of a single register and N=1
    could select the transfer of all the registers for context switching.
    
    May be interpreted by the coprocessor"""
    cpdef public Flag write_back
    """Whether to write the result back to the base register"""
    cpdef public TransferType transfer_type
    """Whether to load from or store to the coprocessor"""
    cpdef public Register rn
    """Base register"""
    cpdef public Register cp_rd
    """By convention, the register to be transferred to the coprocessor, but may
    be interpreted differently"""
    cpdef public CPNum cp_num
    """Coprocessor which is required to supply or accept the data"""
    cpdef public Offset offset
    """8 bit unsigned int that is shifted left 2 bits (<< 2) and then either 
    added to/subtracted from rn depending on transfer_type"""
