from amphisbaena.rom import rom, instruction

rom_obj = rom.ROM("roms/super_mario_advance.gba")
print(rom_obj.rom_header)

instr = instruction.BaseInstruction()