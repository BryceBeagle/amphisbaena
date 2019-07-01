from ..base_instruction cimport Instruction
from ..base_instruction cimport Register
# noinspection PyUnresolvedReferences
from ..transfer.base_transfer cimport IndexingType, OffsetDirection, \
    TransferType
from .base_coprocessor cimport CPNum

ctypedef public unsigned int CPOpcode
"""3 bit unsigned integer"""
ctypedef public unsigned int CPInfo
"""3 bit unsigned"""

cdef class CoprocessorRegisterTransfersInstruction(Instruction):
    """Only bits 4 and 24-31 are used by ARM7TDMI. The rest are used by the
    coprocessor.

    These fields are designated as convention but coprocessors may redefine the
    use of all fields except for CP# if desired

    (arm7tdmi_datasheet_pt2.pdf page 4-51)
    """

    cpdef public CPOpcode cp_opcode
    """Operation to perform"""
    cpdef public Register cp_rn
    """Operand register 1"""
    cpdef public Register cp_rd
    """Destination register"""
    cpdef public CPNum cp_num
    """Contains a an identifying number (0-15) for each coprocessor. 
    Coprocessors will ignore any instruction that does their number in the field
    """
    cpdef public CPInfo cp_info
    """Immediate value for use by the coprocessor. Constant evaluated from
    expression in assembly"""
    cpdef public Register cp_rm
    """Operand register 2"""
