cpdef public enum IndexingType:
    POST = 0,  # Add offset after transfer
    PRE = 1  # Add offset before transfer

cpdef public enum OffsetDirection:
    OFFSET_SUBTRACT = 0
    OFFSET_ADD = 1

cpdef public enum TransferQuantity:
    WORD = 0,
    BYTE = 1

cpdef public enum TransferType:
    STORE = 0,
    LOAD = 1
