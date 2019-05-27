# # >>> ctypedef bint Condition[4] throws a build error
# # Trying to avoid https://stackoverflow.com/a/4523537/8134178 but this may not
# # be necessary
# # TODO: Maybe structs of bints are bad?
ctypedef struct RegisterList:
    bint[12] _
ctypedef bint Offset  # Make an array (struct?) of these yourself

cdef class Instruction:
    cpdef public unsigned int instruction
    cpdef public Condition condition

    cdef unsigned int bit_range(self, int start, int end)

ctypedef bint Flag

cdef class MultiplyLongInstruction(Instruction):
    cpdef public Flag u
    cpdef public Flag a
    cpdef public Flag s  # Update CSPR flags
    cpdef public Register rd_hi
    cpdef public Register rd_lo
    cpdef public Register rs
    cpdef public Register rm

cdef class SingleDataSwapInstruction(Instruction):
    cpdef public Flag b
    cpdef public Register rn
    cpdef public Register rd
    cpdef public Register rm

cdef class HalfwordDataTransferRegisterOffsetInstruction(Instruction):
    cpdef public Flag p
    cpdef public Flag u
    cpdef public Flag w
    cpdef public Flag l
    cpdef public Register rn
    cpdef public Register rd
    cpdef public Flag s
    cpdef public Flag h
    cpdef public Register rm

cdef class HalfwordDataTransferRegisterImmediateInstruction(Instruction):
    cpdef public Flag p
    cpdef public Flag u
    cpdef public Flag w
    cpdef public Flag l
    cpdef public Register rn
    cpdef public Register rd
    cpdef public Offset[4] offset_hi  # Unsigned
    cpdef public Flag s
    cpdef public Flag h
    cpdef public Offset[4] offset_lo  # Unsigned

cdef class SingleDataTransferInstruction(Instruction):
    cpdef public Flag p
    cpdef public Flag u
    cpdef public Flag b
    cpdef public Flag w
    cpdef public Flag l
    cpdef public Register rn
    cpdef public Register rd
    cpdef public Offset[12] offset  # Unsigned

cdef class BlockDataTransferInstruction(Instruction):
    cpdef public Flag p
    cpdef public Flag u
    cpdef public Flag s
    cpdef public Flag w
    cpdef public Flag l
    cpdef public Register rn
    cpdef public RegisterList register_list

cdef class SoftwareInterruptInstruction(Instruction):
    pass

# Explicit undefined, not unknown instruction
cdef class UndefinedInstruction(Instruction):
    pass

cpdef public enum Condition:
    EQ = 0b0000,  # Equal
    NE = 0b0001,  # Not equal
    CS = 0b0010,  # Unsigned higher or same
    CC = 0b0011,  # Unsigned lower
    MI = 0b0100,  # Negative
    PL = 0b0101,  # Positive or zero
    VS = 0b0110,  # Overflow
    VC = 0b0111,  # No overflow
    HI = 0b1000,  # Unsigned higher
    LS = 0b1001,  # Unsigned lower or same
    GE = 0b1010,  # Greater than or equal
    LT = 0b1011,  # Less than
    GT = 0b1100,  # Greater than
    LE = 0b1101,  # Less than or equal
    AL = 0b1110,  # Always
    RESERVED = 0b1111  # Must never be used

cpdef public enum Register:
    # System and User mode
    R00 = 0b0000,
    R01 = 0b0001,
    R02 = 0b0010,
    R03 = 0b0011,
    R04 = 0b0100,
    R05 = 0b0101,
    R06 = 0b0110,
    R07 = 0b0111,
    R08 = 0b1000,
    R09 = 0b1001,
    R10 = 0b1010,
    R11 = 0b1011,
    R12 = 0b1100,
    R13 = 0b1101,
    R14 = 0b1110,
    R15_PC = 0b1111,

    # FIQ mode
    R08_fiq = 0b1000,
    R09_fiq = 0b1001,
    R10_fiq = 0b1010,
    R11_fiq = 0b1011,
    R12_fiq = 0b1100,
    R13_fiq = 0b1101,
    R14_fiq = 0b1110,

    # Supervisor mode
    R13_svc = 0b1101,
    R14_svc = 0b1110,

    # Abort mode
    R13_abt = 0b1101,
    R14_abt = 0b1110,

    # IRQ mode
    R13_irq = 0b1101,
    R14_irq = 0b1110,

    # Undefined mode
    R13_und = 0b1101,
    R14_und = 0b1110,

    # ARM State Program Status Registers (special)
    CPSR = 0b10000,
    SPSR_fiq = 0b10001
    SPSR_svc = 0b10001
    SPSR_abt = 0b10001
    SPSR_irq = 0b10001
    SPSR_und = 0b10001
