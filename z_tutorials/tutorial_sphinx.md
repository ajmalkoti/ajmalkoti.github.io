## Using Sphinx for documentation 

Assume that we have a package- waves, with following structure.

```
seisimage-master
    |-----seisimage
    |       |---boreholes
    |       |---seismics
    |       |---horizons
    |       |---test
    |       |--- ...etc...
    |
    |-----docs   
```

#### Prepartion 
1. Install  the Sphinx package using either 
     * $ sudo apt-get install python3-sphinx  
     * $ python -m pip install sphinx  

     Check sphinx version  
     * $ sphinx-build --version

2. Install new themes (this is optional step)

     * alabaster theme:: already installed 
     * FURO theme:: pip install furo
     * RDT theme:: pip install sphinx_rdt_theme   OR   conda install conda-forge::sphinx_rtd_theme
     * Numpy theme:: pydata_sphinx_theme


#### Steps to generate documentation 
1. Create document layout  

     ```shell
     seisimage-master$ cd docs
     seisimage-master$ mkdir docs
     seisimage-master$ cd docs
     seisimage-master/docs$ sphinx-quickstart
     ```

     Alternatively, following command will automatically create folder
     and place all relevant files in that.

     ```shell
     $ cd waves
     waves$ sphinx-quickstart docs
     ```

2. It will ask for following questions 
     ```
     Separate source and build directories (y/n) [n]: n
     Project name: seisimage
     Author name(s): XYZ.
     Project release []: 0.0.1
     Project language [en]: <Press Enter>   
     ```

3. Configuring sphinx using conf.py  
   The sphinx configuration is in **docs/conf.py**"  you should change
   following
    * correcting the path
      ```
      import os
      import sys
      sys.path.insert(0, os.path.abspath('../seisimage/'))
      ```
      
    * Include teh extensions
      ```
      extensions = ['sphinx.ext.autodoc',
                    'sphinx.ext.viewcode',
                    'sphinx.ext.napoleon'
                   ]
      ``` 
      
    * By default the sphinx doesn't include the classes, so include following code.  
      special-members : this function is always included  
      exclude-members : these functins are excluded, 
                       __wekref__ implies intrinsic function will be excluded  
      ```
      autodoc_default_options = {
              'members': True,
              'member-order': 'bysource',
              'special-members': '__init__',
              'undoc-members': True,
              'exclude-members': '__weakref__'
              }
       ```
       

    * One may wish to choose a better theme over default (named 'alabastor')
      e.g. classic, furo, sphinx_rdt_theme,
       
       ```python
       html_theme = 'albastor'
       ```

4.  Generate the rst files for the **seisimage** package 
    and place them in **docs** directory
    ```shell
    seisimage-master/docs$ cd ..
    seisimage-master$ sphinx-apidoc -o docs seisimage
    ```
    
    This will generate follwoing file in docs folder
    * index.rst file
    * modules.rs file 
    * .rst file for each module. 

     
5. Modify **docs/index.rst** file.  Add following text at bottom of the file.

   ``` rst
   .. include:: modules.rst
   ```


6.  Now we can generate a very naive docs without much information. 

     ```  shell
     waves$ cd docs
     waves/docs$ make html
     ```

     The other documentation formats can also be generated as 
     
     * HTML :  make html
     * EPUB :  make epub
     * etc.
     
       

### References:
1.  Ref: https://www.youtube.com/watch?v=5s3JvVqwESA
2.  List of sphinx themes ::  https://sphinx-themes.org/#themes
3.  RTD theme 
    - Example:: https://sphinx-themes.org/sample-sites/sphinx-rtd-theme/  
                https://sphinx-rtd-tutorial.readthedocs.io/en/latest/sphinx-config.html
                https://docs.readthedocs.io/en/stable/examples.html
                
    - configuration:: https://sphinx-rtd-theme.readthedocs.io/en/stable/configuring.html
 
4.  Sphinx Documentation examples
    - https://github.com/readthedocs-examples/example-sphinx-basic/tree/main
    - https://github.com/readthedocs/sphinx_rtd_theme/blob/master/docs/index.rst?plain=1
5.  Example of a sphinx config file::   https://github.com/frannerin/AlloViz/blob/main/docs/source/conf.py
6. How to chage default setting of autodoc:: 
    - https://stackoverflow.com/questions/75880273/sphinx-autodoc-ignores-default-settings-in-conf-py 
    - "autodoc_default_options" : https://smobsc.readthedocs.io/en/stable/usage/extensions/autodoc.html 
7. Stack overflow questions.
    - How to include classes in Sphinx doc.:: https://stackoverflow.com/questions/31479835/sphinx-doesnt-process-python-classes?rq=4
    - Cant find my python module:: https://stackoverflow.com/questions/53668052/sphinx-cannot-find-my-python-files-says-no-module-named
    - How to autodoc class init method :: https://stackoverflow.com/questions/5599254/how-to-use-sphinxs-autodoc-to-document-a-classs-init-self-method







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



 
  
