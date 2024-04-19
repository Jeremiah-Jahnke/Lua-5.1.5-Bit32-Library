--- This module provides bitwise operations in Lua.
--- It defines a table `bit` with various bitwise functions.
--- To use this module, create an instance of `bit` using `bit.new()`.
--- Example usage:
--- ```lua
--- local bit = require("cbit")
--- local b = bit.new()
--- local result = b:band(5, 3) -- Performs bitwise AND operation: 5 AND 3
--- print(result) -- Output: 1
--- ```
local bit = {}
bit.__index = bit

--- Creates a new instance of the `bit` module.
--- @return table: The new `bit` instance.
function bit.new()
    local self = setmetatable({}, bit)
    return self
end

--- Performs a bitwise left shift operation.
--- @param a number: The number to be shifted.
--- @param b number: The number of bits to shift by.
--- @return number: The result of the left shift operation.
function bit:lshift(a, b)
    return a * 2 ^ b
end

--- Performs a bitwise right shift operation.
--- @param a number: The number to be shifted.
--- @param b number: The number of bits to shift by.
--- @return number: The result of the right shift operation.
function bit:rshift(a, b)
    return math.floor(a / 2 ^ b)
end

--- Performs a bitwise AND operation.
--- @param a number: The first operand.
--- @param b number: The second operand.
--- @return number: The result of the AND operation.
function bit:band(a, b)
    local result = 0
    local bit = 1

    while a > 0 and b > 0 do
        if a % 2 == 1 and b % 2 == 1 then
            result = result + bit
        end

        a = math.floor(a / 2)
        b = math.floor(b / 2)
        bit = bit * 2
    end

    return result
end

--- Performs a bitwise XOR operation.
--- @param a number: The first operand.
--- @param b number: The second operand.
--- @return number: The result of the XOR operation.
function bit:bxor(a, b)
    local result = 0
    local bit = 1

    while a > 0 or b > 0 do
        if a % 2 ~= b % 2 then
            result = result + bit
        end

        a = math.floor(a / 2)
        b = math.floor(b / 2)
        bit = bit * 2
    end

    return result
end

--- Performs a bitwise OR operation.
--- @param a number: The first operand.
--- @param b number: The second operand.
--- @return number: The result of the OR operation.
function bit:bor(a, b)
    local result = 0
    local bit = 1

    while a > 0 or b > 0 do
        if a % 2 == 1 or b % 2 == 1 then
            result = result + bit
        end

        a = math.floor(a / 2)
        b = math.floor(b / 2)
        bit = bit * 2
    end

    return result
end

--- Performs an arithmetic right shift on a number.
--- If the number is non-negative, it performs a logical right shift.
--- If the number is negative, it performs an arithmetic right shift.
--- @param a number: The number to be shifted.
--- @param b number: The number of bits to shift by.
--- @return number: The result of the arithmetic right shift.
function bit:arshift(a, b)
    if a >= 0 then
        return self:rshift(a, b)
    else
        local shifted = self:rshift(a, b)
        local mask = self:lshift(1, 32 - b) - 1
        local complement = self:bor(shifted, self:lshift(mask, b))
        return complement
    end
end

--- Performs a bitwise right rotation.
--- @param a number: The number to be rotated.
--- @param b number: The number of bits to rotate by.
--- @return number: The result of the right rotation.
function bit:rrotate(a, b)
    local mask = self:lshift(1, 32) - 1
    local shifted = self:rshift(a, b)
    local complement = self:bor(shifted, self:lshift(a, 32 - b))
    return self:band(complement, mask)
end

--- Performs a bitwise left rotation.
--- @param a number: The number to be rotated.
--- @param b number: The number of bits to rotate by.
--- @return number: The result of the left rotation.
function bit:lrotate(a, b)
    local mask = self:lshift(1, 32) - 1
    local shifted = self:lshift(a, b)
    local complement = self:bor(self:rshift(a, 32 - b), shifted)
    return self:band(complement, mask)
end

--- Replaces a portion of a number with another number.
--- @param a number: The original number.
--- @param b number: The number to insert.
--- @param p number: The starting position of the replacement.
--- @param n number: The number of bits to replace.
--- @return number: The result of the replacement.
function bit:replace(a, b, p, n)
    local mask = self:lshift(1, n) - 1
    local shifted = self:lshift(b, p)
    local complement = self:band(a, self:bor(mask, self:lshift(mask, p)))
    return self:bor(complement, shifted)
end

--- Extracts a portion of a number.
--- @param a number: The original number.
--- @param p number: The starting position of the extraction.
--- @param n number: The number of bits to extract.
--- @return number: The extracted portion.
function bit:extract(a, p, n)
    local mask = self:lshift(1, n) - 1
    return self:rshift(self:band(a, self:lshift(mask, p)), p)
end

--- Tests if a specific bit is set in a number.
--- @param a number: The number to test.
--- @param b number: The position of the bit to test.
--- @return boolean: `true` if the bit is set, `false` otherwise.
function bit:btest(a, b)
    return self:band(a, self:lshift(1, b)) == 0
end

return bit