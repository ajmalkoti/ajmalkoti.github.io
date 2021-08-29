# Here is a list of all the useful tips in matlab




## Defining/Accessing structures
  ```matlab
    % simple structure is defined as
    vector.x=12;    vector.y=23;    vector.z=56;    
    
    % accessing values (method 1)
    vector.x
    
    % accessing values (method 2)
    SelField= y;
    vector.(SelField) = 12
  ```
## Useful functions 
* **validatestring** It checks if the sting, STR is present in cell of strings, 
  VALIDSTR = validatestring(STR,VALID_STRINGS,FUNC_NAME,VAR_NAME,ARG_INDEX) 
  other are useful for producing error msg, which include the Function name 
  where error occured, the variable name which caused it and its index number.
  e.g.
  validatestring('C',{'A','B'},'func_name','var_name',2)
  
* **validateattributes** it validates that array A belongs
    to at least one of the specified CLASSES and has all of the specified
    ATTRIBUTES. If A does not meet the criteria, MATLAB issues a formatted
    error message.
    e.g.
    A = [ 1 2 3; 4 5 6 ];    B = [ 7 8 9; 10 11 12];      C = cat(3,A,B);
    validateattributes(C,{'numeric'},{'2d'},'my_func','my_var',2)


## Classes and  OOP 

### A complex class is defined as 
  ```matlab
    defclass CLASSNAME
      properties 
         % No restriction on following var access/modified  (within/outside class)
         a1; b1;  c1 ;    
      end
      
      properties (setaccess=private,getaccess=public)
         % These variable's value can be accessed by anyone but can't be modified outside the class.
         a2; b2;c2       
      end
      
      properties (setaccess=private,getaccess=private,hidden)
        % These variable's value can be accessed/modified within the class only
        a2; b2;c2
      end
      
      properties (dependent)
         % these variables values is not stored and these are computed only during access, 
         % i.e. these depend upon the state of other variables. 
         a3;   b3;   c3    
      end
      
      methods             
            % This function is used for instantiating the class, i.e. when class is called for first time . 
            % Its name must be same as the class name. These function are called as  
            % P=CLASSNAME(IPARG1,IPARG2,...)            
            
            function obj = CLASSNAME(IPARG1,IPARG2,...)                  
                obj.a1 = 43;
                obj.a2 = 36;
                ...
            end
            
            % Other methods/functions associated with this class can also be defined.
            % These function are called as              
            % P=CLASSNAME.CLASSFUN(IPARG1,IPARG2,...)
             
            function obj = CLASSFUN(IPARG1,IPARG2,...)    % used for instantiating the class
                obj.a1 = 43;
                obj.a2 = 36;
                ...
            end
      end
      
      methods (Static)    
          % Static fun can be called independelty as CLASSNAME.FUNNAME(IPARG1,IPARG2,...)
          
          % Method 1: explicitly define static function
          function OPARG = FUNNAME(IPARG1,IPARG2,...)
             .....  
          end
          
          % Method 2: placing the function in separate file in same class folder i.e. @CLASSNAME
          % and defining an interface here
          OPARG = FUNNAME5(IPARG1,IPARG2,...)    
      end
    end
  ```
