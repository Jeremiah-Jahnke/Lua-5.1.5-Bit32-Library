package.path = package.path .. ";../?.lua"

local bit = require("index")

print("Bitwise operations using custom bit library:")

print("Bitwise AND:", bit:band(5, 3))
print("Bitwise OR:", bit:bor(5, 3))
print("Bitwise XOR:", bit:bxor(5, 3))
print("Arithmetic right shift:", bit:arshift(-8, 2))
print("Rotate left:", bit:lrotate(5, 2))
print("Rotate right:", bit:rrotate(5, 2))
print("Replace:", bit:replace(5, 2, 1, 7))
print("Extract:", bit:extract(21, 0, 2, 3))
print("Bit test:", bit:btest(5, 1))

--[[

Bitwise operations using custom bit library:
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