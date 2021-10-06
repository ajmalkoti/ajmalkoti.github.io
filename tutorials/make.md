### What is Make File?
It is a file containing the shell commands which are executed based upon the list of rules provided/written in the file.

These files are particularly useful, when working with a code that is partitioned (in form of functions/modules) 
to various files and each file may have different dependency. As the project grows the complexity in compilation increases
due to dependency as well as the compilation time increases. 
It can be reduced with the help of make file. A simple example for the Fortran 90 file is described below.


### Understanding the complexity in compilation.
Assume that we have the main Driver code residing in the file- main.f95, 
and its subroutines/functions residing in separate files having names- sub1.f95, sub2.f95, sub3.f95. 
```f90
main.f95
    |----- sub1.f95
    |----- sub2.f95
    |----- sub3.f95
```

Then we can compile above in two steps (compiling and linking) as following:

1. Compiling the subroutines separately:
```
gfortran -c sub1.f95
gfortran -c sub2.f95
gfortran -c sub3.f95 
```

2. Link object files to main files (produce executable name 'a.exe'):
```
gfortran main.f95 sub1.o sub2.o sub3.o 
```
or (which produce executable with name 'main.exe')
```
gfortran main.f95 sub1.o sub2.o sub3.o -o main.exe
```


When we are working on a project then we may have to deal with a large number of files. 
In such case two issues are faced
1) File linking command obviously becomes lengthy and complex.
2) The interdependency of the files has to be taken into account.

MAKE utility help us to avoid all above problems.




###  How to use MAKE?
First, we need to get all the fortran source files in a folder, let us call it 'src'.
Now we create a MAKE file with some name e.g. 'abc.mak'.  However a default name 'make.mak' is a common practice.
This file can be run from the terminal by issuing the make command
```
make FileName                
make abc.mak        # running MAKE file with name 'abc.mak'
make                # running MAKE file with default name: 'make'.
```


What is the general structure of commands in a MAKE file?

General structure of MAKE file.
```
Target :...... Prerequisites.....
 <TAB>  Command
```

**Example 1**:

For the program, discussed in the beginning of this blog, a simple MAKE file can be written as following:
```
main: sub1.o sub2.o sub3.o
    gfortran main.f95  sub1.o sub2.o sub3.o -o main

sub1.o: sub1.f95
    gfortran -c sub1.f95

sub2.o: sub2.f95
    gfortran -c sub2.f95

sub3.o: sub3.f95
    gfortran -c sub3.f95$$$$$
```

A better version is given following with details afterward.
The advantage of above format is, no matter how many files you have above can be compiled just by changing the files in OBJ list.
```
FC= gfortran                          # Fortran compiler used
OBJ= sub1.o sub2.o sub3.o main.o      # list of all object files
FFLAGS= -O3                           # type of flag you want to use              $

main: $(OBJ)                                                                      

    $(FC) $(OBJ) -o main 
%.o: %.f95
    $(FC) ${OBJ} -c ${FFLAGS} $<
clean:
        rm main.exe $(objects)
```

Explanation of some of automatic variables
1) Use of $    :
            It is used to place the value of variable at the place. for example ${FC} = gfortran
2) Use of %   :
            It is used as a wild card character. e.g. (%.o) means all the object files and  (%.f95) means all the fortran 95 source code files present in the folder.
3) use of $<   :
         It means the first pre-requisite in the complete list of pre-requisites.
some more automatic variables
4) use of $^    :
           It means all the pre-requisite
5) use of $@   :
          It means the target
We have not discussed the last part i.e. clean command
It is very handy to remove all the other mod and executable files so that we can freshly compile and link all files and modules.

make        # for compiling code
make clean  # to remove everything but source files and starting afresh        


**Example 2**:  
Let us take another example and there is a  main fortran file (main.f95) which calls the other subroutines residing in separate files (e.g. aaa.f95, bbb.f95, ccc.f95, etc.. ).
Let us make its dependency tree as shown following:

```
main.f95
    |----- aaa.f95
    |              |----- aaa1.f95
    |              |----- aaa2.f95
    |              |----- aaa3.f95
    |----- bbb.f95
    |              |----- bbb1.f95
    |              |----- bbb2.f95
    |              |----- bbb3.f95
    |----- ccc.f95
    |              |----- ccc1.f95
    |              |----- ccc2.f95
    |              |----- ccc3.f95
```

yet to write


**Example 3**: Handling compiler dependency.

What happens if you are running same code in windows and unix. In this case, it matters how you are compiling codes.

yet to write



References:
https://www.gnu.org/software/make/manual/
https://source.ggy.bris.ac.uk/wiki/Make
https://aoterodelaroza.github.io/devnotes/modern-fortran-makefiles/
https://www.gnu.org/software/make/manual/make.pdf   
