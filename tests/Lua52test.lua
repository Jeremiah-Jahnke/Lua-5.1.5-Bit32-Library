local bit32 = require("bit32")

print("Bitwise operations using lua 5.2 bit32 library:")

print("Bitwise AND:", bit32:band(5, 3))
print("Bitwise OR:", bit32:bor(5, 3))
print("Bitwise XOR:", bit32:bxor(5, 3))
print("Arithmetic right shift:", bit32:arshift(-8, 2))
print("Rotate left:", bit32:lrotate(5, 2))
print("Rotate right:", bit32:rrotate(5, 2))
print("Replace:", bit32:replace(5, 2, 1, 7))
print("Extract:", bit32:extract(21, 0, 2, 3))
print("Bit test:", bit32:btest(5, 1))

--[[

Bitwise operations using lua 5.2 bit32 library:
Bitwise AND:    1
Bitwise OR:     7
Bitwise XOR:    6
Arithmetic right shift: 4294967294
Rotate left:    20
Rotate right:   1073741825
Replace:        5
Extract:        1
Bit test:       true

]]--