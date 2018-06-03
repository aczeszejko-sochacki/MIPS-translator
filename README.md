# MIPS-translator
## Requirements
MIT/GNU Scheme 9.1.1 or later
## Usage
1. Load app before executing each test
```
(load "main.scm")
```
2. Execute test <name> from /tests
```
"<name>"
```
Tests are to be in format `"<instruction> <r1>,<r2>,<r3> # comment"`. Comment is optional. Number of registers/immediates depends on instruction.

