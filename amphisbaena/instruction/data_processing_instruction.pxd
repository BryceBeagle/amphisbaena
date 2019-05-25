from .base_instruction cimport Instruction
from .base_instruction cimport Flag, Register

# And FSR Transfer Instruction (I think for debugging)
cdef class DataProcessingInstruction(Instruction):
    cpdef public Opcode opcode
    """Opcode"""
    cpdef public Flag i
    """Immediate operand"""
    cpdef public Flag s  # Update CSPR flags
    """Set condition codes"""
    cpdef public Register rn
    """1st operand register"""
    cpdef public Register rd
    """Destination register"""

    # If I is set
    cpdef public unsigned int shift
    """[Optional | 8 bit] Shift applied to Rm"""
    cpdef public Register rm
    """[Optional] 2nd operand register"""

    # If I is not set
    cpdef public unsigned int rotate
    """[Optional | 4 bit] Shift applied to imm"""
    cpdef public unsigned int imm
    """[Optional | 8 bit] Unsigned immediate value"""

    @staticmethod
    cdef Opcode _opcode(unsigned int instruction)

    @staticmethod
    cdef Flag _i(unsigned int instruction)

    @staticmethod
    cdef Flag _s(unsigned int instruction)

    @staticmethod
    cdef Register _rn(unsigned int instruction)

    @staticmethod
    cdef Register _rd(unsigned int instruction)

    # If I is set
    @staticmethod
    cdef unsigned int _shift(unsigned int instruction)

    @staticmethod
    cdef Register _rm(unsigned int instruction)

    # If I is not set
    @staticmethod
    cdef unsigned int _rotate(unsigned int instruction)

    @staticmethod
    cdef unsigned int _imm(unsigned int instruction)

ctypedef enum Opcode:
    # arm7tdmi_datasheet_pt2.pdf#page=10
    AND = 0b0000,  # rd := op1 AND op2
    EOR = 0b0001,  # rd := op1 EOR op2
    SUB = 0b0010,  # rd := op1 - op2
    RSB = 0b0011,  # rd := op2 - op1
    ADD = 0b0100,  # rd := op1 + op2
    ADC = 0b0101,  # rd := op1 + op2 + C
    SBC = 0b0110,  # rd := op1 - op2 + C - 1
    RSC = 0b0111,  # rd := op2 - op1 + C - 1
    TST = 0b1000,  # Set condition codes on op1 AND op2
    TEQ = 0b1001,  # Set condition codes on op1 EOR op2
    CMP = 0b1010,  # Set condition codes on op1 - op2
    CMN = 0b1011,  # Set condition codes on op1 + op2
    ORR = 0b1100,  # rd := op1 OR op2
    MOV = 0b1101,  # rd := op2
    BIC = 0b1110,  # rd := op1 AND NOT op2
    MVN = 0b1111,  # rd := NOT op2
