from amphisbaena.rom.rom import ROM

rom_obj = ROM("roms/super_mario_advance.gba")
print(rom_obj.rom_header)
rom_obj.print_rom_instructions()
