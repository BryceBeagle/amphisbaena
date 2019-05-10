ctypedef enum MyEnum:
        OPT1,
        OPT2,
        OPT3

cdef class Instruction:
    cpdef MyEnum my_enum

    def __init__(self):
        self.my_enum = MyEnum.OPT1