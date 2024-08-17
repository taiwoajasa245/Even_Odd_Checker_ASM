
# Even/Odd Number Checker in Assembly

This project is a simple command-line program written in assembly language that checks whether a given number is even or odd. The program is designed to run on Linux using the `nasm` assembler and the `ld` linker.

## Features- Prompts the user to enter a number.
- Determines whether the number is even or odd.
- Displays the result (either "The number is an even Number" or "The number is an odd Number").
- Continues running, allowing the user to test multiple numbers in a single session.

## Prerequisites

To compile and run this program, you'll need:
-`nasm` assembler: [Installation Instructions](https://www.nasm.us/doc/nasmdoc2.html)
-`ld` linker: Typically available with the GNU binutils package.

## How to Run
## 1.**Clone the Repository**:
   ```bash
   git clone https://github.com/taiwoajasa245/Even_Odd_Checker_ASM.git
   ```
## Assemble the Code:
  ```
  nasm -f elf32 even_odd.asm -o even_odd.o
  
  ```
## Link the Object File:
  ```
  ld -m elf_i386 -s -o even_odd even_odd.o
  ```

## Run the Program
  ```
  ./even_odd
  ```
## Sample Output
```
Welcome User, Test if a number is Even or Odd
Enter your Number: 5
The number is an odd Number
Enter your Number: 4
The Number is a even Number
Enter your Number: ......

```

# Contributing
Feel free to fork this repository and submit pull requests. For major changes, please open an issue first to discuss what you would like to change.

# License
This project is licensed under the MIT License. See the LICENSE file for details.

