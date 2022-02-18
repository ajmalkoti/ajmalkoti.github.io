**What is a debugger?**
 A debugger is a tool which can be used to detect the errors in a program/code.
 The errors are of two types, first, which are encountered during the  compilation of code; and second, which appears when the code runs. First type of error are easier to catch however the second type of error is  sometimes hard to detect.
 A debugger provides you the facility to run the program in step by step  manner as well as see the current value of any variable. Thus, a  debugger is very useful to detect the runtime errors.


 **What is GDB?**
 GDB is an acronym for GNU Debugger which can be used for debugging the C/fortran code.


 **Example:**
 We start with a simple example of "how to debug a program with GDB".
 Let us assume that we have a file with a name- "test.f90" which compiles successfully but have some runtime error. Following are the steps which explain how to debug the code: 

1. Compile the program and run it to create executable with "-g" flag.
   **$gfortran -test.f90 -g -o test**
2. Run executable file with gdb to start debugging
   **$gdb test**
3. Now debugger has started. So to set the first break point, issue following command
   **break main**
4. You may want to set break-point at some line (say 20). For this, you enter command
   **break 20**
5. We can step line by line or to next breakpoint by entering commands viz.
   **step**                              ! Goes to next line
   **continue**                      ! Goes to next breakpoint
   **next**                             ! Goes to next breakpoint
   For details see the list of command given at the bottom.
6. To run the code issue command and check the error line
   **run**
7. Now you can sort the errors in this file by issuing/repeating GDB commands.
   

**Some useful GNU commands are**

1. Placing the breakpoint for **debugging**

- b main - Since main refers to the beginning of code so it places a breakpoint at the beginning 
- b     - Places the breakpoint at the current line
-  b N   - Places the breakpoint at line number N.
-  b +N  - Places the breakpoint at the current line no + N. (i.e. N lines after current line)
-  b func - Places the breakpoint at the beginning of the given function, with name "func".
-  d N   - Deletes breakpoint number N
-  info break - list all the breakpoints

**2. Handling execution of program during debugging** 

-  r     - Runs the program until a breakpoint or error (shortened version of 'run' command)
-  c    - Continues running the program until the next breakpoint or error
-  f     - Runs until the current function is finished
-  s     - Runs the next line of the program
- s N   - Runs the next N lines of the program
-  n     - Like the GDB command 's', but it does not step into functions
- u N   - Runs until you get N lines in front of the current line

**3. Managing variables** 

-  p var  - Prints the current value of the variable "var"
-  set    - sets the value of the variable e.g. **set x=100**      
- watch  - Checks for the value of variable e.g. **watch x = = 0**

**4. Managing functions**

- call     - Calls the function  e.g.  **call func(x)** 
- backtrace - Backtraces code to determine the current level in the function stack. 
- up      - Goes up a level in the function stack
- down    - Goes down a level in the function stack

**5. Others**

- **where**         : To find the which line you are working on
- **list**            : To see the code around the current line
- **list <line no>**   : To see the code around the given line number