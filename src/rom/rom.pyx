from libc.stdio cimport fopen, fread, fclose

import numpy as np

DEF ROM_HEADER_SIZE = 192
DEF ROM_HEADER_GAME_TITLE_SIZE = 12
DEF ROM_HEADER_GAME_CODE_SIZE = 4
DEF ROM_HEADER_MAKER_CODE_SIZE = 2
DEF ROM_HEADER_RESERVED_AREA_1_SIZE = 7
DEF ROM_HEADER_RESERVED_AREA_2_SIZE = 2

cdef class ROM:
    cpdef const unsigned int[:] rom
    cpdef public ROMHeader rom_header

    def __init__(self, str rom_path):
        """Initialize a new rom using a filepath
        
        :param rom_path: path to rom file
        """
        self.rom_header = ROMHeader(rom_path)
        with open(rom_path, "br") as rom_fd:
            self.rom = np.fromfile(rom_fd, dtype='<u4')

    def print_rom_instructions(self):
        for instruction in self.rom[0:48]:
            print(hex(instruction))

    def __repr__(self):
        return repr(self.rom_header)


cdef class ROMHeader:
    cpdef public unsigned int entry_point_address
    cpdef unsigned char[156] logo
    cpdef public str game_title
    cpdef public str game_code
    cpdef public str maker_code
    cpdef public unsigned char fixed_value
    cpdef public unsigned char main_unit_code
    cpdef public unsigned char device_type
    # noinspection PyUnresolvedReferences
    cpdef unsigned char[ROM_HEADER_RESERVED_AREA_1_SIZE] reserved_area1
    cpdef public unsigned char software_version
    cpdef unsigned char checksum
    # noinspection PyUnresolvedReferences
    cpdef unsigned char[ROM_HEADER_RESERVED_AREA_2_SIZE] reserved_area2

    cpdef public str rom_path

    def __init__(self, str rom_path):
        # TODO: Don't open file twice

        self.rom_path = rom_path

        rom_fd = fopen(rom_path.encode('ascii'), "rb")
        if not rom_fd:
            raise IOError()

        # Entry point address
        fread(&self.entry_point_address, sizeof(self.entry_point_address), 1, rom_fd)

        # Nintendo logo
        fread(self.logo, sizeof(self.logo), 1, rom_fd)

        # 12 character game title
        cdef char[ROM_HEADER_GAME_TITLE_SIZE] game_title_temp
        fread(&game_title_temp, sizeof(game_title_temp), 1, rom_fd)
        self.game_title = game_title_temp[:ROM_HEADER_GAME_TITLE_SIZE].decode('ascii')

        # 4 character game code
        cdef char[ROM_HEADER_GAME_CODE_SIZE] game_code_temp
        fread(&game_code_temp, sizeof(game_code_temp), 1, rom_fd)
        self.game_code = game_code_temp[:ROM_HEADER_GAME_CODE_SIZE].decode('ascii')

        # 2 character game code
        cdef char[ROM_HEADER_MAKER_CODE_SIZE] maker_code_temp
        fread(&maker_code_temp, sizeof(maker_code_temp), 1, rom_fd)
        self.maker_code = maker_code_temp[:ROM_HEADER_MAKER_CODE_SIZE].decode('ascii')

        # Value=96 that is used for checksum
        fread(&self.fixed_value, sizeof(self.fixed_value), 1, rom_fd)

        # Main unit code (should be 0x00)
        fread(&self.main_unit_code, sizeof(self.main_unit_code), 1, rom_fd)
        
        # Device type
        fread(&self.device_type, sizeof(self.device_type), 1, rom_fd)
        
        # Reserved area 1
        fread(self.reserved_area1, sizeof(self.reserved_area1), 1, rom_fd)

        # Software version. Usually 0x00
        fread(&self.software_version, sizeof(self.software_version), 1, rom_fd)

        # Header checksum
        fread(&self.checksum, sizeof(self.checksum), 1, rom_fd)

        # Reserved area 2
        fread(self.reserved_area2, sizeof(self.reserved_area2), 1, rom_fd)

        fclose(rom_fd)

    def __repr__(self):
        string = ""
        string += f'<ROMHeader ("{self.rom_path}") at {id(self)}>\n'
        string += f'\tEntry Point:      {hex(self.entry_point_address)}\n'
        string += f'\tGame Title:       {self.game_title}\n'
        string += f'\tGame Code:        {self.game_code}\n'
        string += f'\tMaker Code:       {self.maker_code}\n'
        string += f'\tMain Unit Code:   {self.main_unit_code}\n'
        string += f'\tDevice Type:      {self.device_type}\n'
        string += f'\tReserved Area 1:  {self.reserved_area1}\n'
        string += f'\tSoftware Version: {self.software_version}\n'
        string += f'\tChecksum:         {self.checksum}\n'
        string += f'\tReserved Area 2:  {self.reserved_area2}'

        return string