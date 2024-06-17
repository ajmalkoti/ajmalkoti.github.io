## Using Sphinx for documentation 

Assume that we have a package- waves, with following structure.

```
waves
|-- src
    |-- bc
        |-- raynold.py
        |-- mur.py
        |-- abc.py
    |-- calc
        |-- calcA.py
        |-- calcB.py
|-- test
    |-- test1.py
    |-- test2.py    
```



#### Installation of required packages 

1. Install  the Sphinx package using either 
     * $ sudo apt-get install python3-sphinx  
     * $ python -m pip install sphinx  

     Check sphinx version  
     * $ sphinx-build --version

2. Install new themes (this is optional step)

     * alabaster theme:: already installed 
     * FURO theme:: pip install furo
     * RDT theme:: pip install sphinx_rdt_theme

3. Create document layout  

     ```shell
     $ cd waves
     waves$ mkdir docs
     $ cd docs
     waves/docs$ sphinx-quickstart
     ```

     or the following command will automatically create folder and place all relevant files in that.

     ```shell
     $ cd waves
     waves$ sphinx-quickstart docs
     ```

4. It will ask for following questions 
     ```
     Separate source and build directories (y/n) [n]: n
     Project name: waves
     Author name(s): XYZ.
     Project release []: 0.0.1
     Project language [en]: <Press Enter>   
     ```

5. Customization of theme

     * Find **docs/conf.py**"  and then change the theme to your wish.

       ```python
       html_theme = 'albastor'
       html_theme = 'furo'
       html_theme = 'sphinx_rdt_theme'
       ```

6. Now we can generate a very naive docs without much information. 

     ```  shell
     waves$ cd docs
     waves/docs$ make html
     ```

     The documentation can be generated as 

     * HTML :  make html

     * EPUB :  make epub

     * etc.
     
       

#### API Documentation for Python 

Ref: https://www.youtube.com/watch?v=5s3JvVqwESA

STEP 1. **Modify  docs/config.py** as following 

* Uncomment lines containing following text (line no 13,14,15) in **docs/conf.py** .

    ```python
    import os
    import sys
    sys.path.insert(0, os.path.abspath('.'')) 
    ```

    

* Change the path in **docs/conf.py** 

​	``` sys.path.insert(0, os.path.abspath('..'))```

* Add following extensions to **docs/conf.py** as shown below

  ```python
  extensions = [
  'sphinx.ext.autodoc',
  'sphinx.ext.viewcode',
  'sphinx.ext.napoleon']
  ```
  
  

SETP 2. **Generate the api docs**

* The following command tells sphinx to generate the **api-docs** for the **waves** package and place them in **docs** directory

  ```shell
  cd ..
  waves$ sphinx-apidoc -o docs src
  ```
  
  This step generates many "rst" format files which are stored in the directory **docs/**. which also includes the **modules.rst** file.

STEP 3. Modify **docs/index.rst** file. 

   ``` rst
   .. include:: modules.rst
   ```

STEP4. Now you can run the documentation for the code

```shell
cd docs
waves/docs$ make html
```





#### API Documentation for MATLAB 

REF: https://devanginiblog.wordpress.com/2015/11/16/how-to-properly-document-matlab-code/

REF: https://github.com/sphinx-contrib/matlabdomain/tree/master/tests/test_docs_automodule

REF: https://stackoverflow.com/questions/74688932/sphinx-with-matlab-does-not-generate-documentation

STEP 1. **Modify  docs/config.py** as following 

```matlab
import sys
import os

# General information about the project.
project = "test_docs_automodule"
copyright = "2023, Jørgen Cederberg"
author = "Jørgen Cederberg"

# Setup extension
sys.path.insert(0, os.path.abspath(os.path.join("..", "..")))
matlab_src_dir = os.path.abspath("..")
extensions = ['sphinx.ext.viewcode',"sphinx.ext.autodoc", "sphinxcontrib.matlab"]
primary_domain = "mat"

templates_path = ["_templates"]
exclude_patterns = ["_build", "Thumbs.db", ".DS_Store"]
html_theme = "default"
```



STEP 2: Change **docs/index.rst** file by Insert the following piece of code.

```rst
functions
=========
.. automodule:: bc
    :members:
    :show-inheritance:
    :undoc-members:
    
.. automodule:: src
    :members:
    :show-inheritance:
    :undoc-members:    


```



STEP 3: Make the file

```shell
waves$ cd docs
waves/docs$ make html
```

