# Lua Bitwise Operations

This module provides bitwise operations in Lua. It defines a table `bit` with various bitwise functions. This module is based on the bitewise operations in Lua 5.2. Made usable for lua 5.1.

## Usage

To use this module, follow these steps:

1. In your Lua script, import the `bit` module:
    ```lua
    local bit = require("cbit")
    ```

2. Create an instance of `bit` using `bit.new()`:
    ```lua
    local b = bit.new()
    ```

3. Perform bitwise operations using the available functions. For example, to perform a bitwise AND operation between two numbers:
    ```lua
    local result = b:band(5, 3) -- Performs bitwise AND operation: 5 AND 3
    print(result) -- Output: 1
    ```

## Available Functions

The `bit` module provides the following functions:

- `band(a, b)`: Performs a bitwise AND operation between `a` and `b`.
- `bor(a, b)`: Performs a bitwise OR operation between `a` and `b`.
- `bxor(a, b)`: Performs a bitwise XOR operation between `a` and `b`.
- `bnot(a)`: Performs a bitwise NOT operation on `a`.
- `lshift(a, n)`: Performs a left shift operation on `a` by `n` bits.
- `rshift(a, n)`: Performs a right shift operation on `a` by `n` bits.
- `arshift(a, b)`: Performs a right shift operation on `a` by `b` bits, preserving the sign bit.
- `lrotate(a, n)`: Performs a left rotation operation on `a` by `n` bits.
- `rrotate(a, n)`: Performs a right rotation operation on `a` by `n` bits.
- `replace(a, b, start, stop)`: Replaces the bits in `a` from `start` to `stop` with the bits in `b`.
- `extract(a, start, stop)`: Extracts the bits in `a` from `start` to `stop`.
- `btest(a, b)`: Tests if the bit at position `b` in `a` is set.

