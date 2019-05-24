from amphisbaena.instruction.base_instruction import BaseInstruction
from amphisbaena.rom.rom import ROM

rom_obj = ROM("roms/super_mario_advance.gba")
print(rom_obj.rom_header)

a = BaseInstruction().condition
print(a)
