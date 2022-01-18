## Install mkdocs in anaconda
[link](https://anaconda.org/conda-forge/mkdocs)

```sh
conda env list                         # list all environments
conda create --name myenv              # create an enviornment
conda activate myenv                   # activate the environment
conda install -c conda-forge mkdocs    # install mkdocs   
```


## Basic commands
1. Getting help
```sh
mkdocs --help
```
2. Create the new doc name "FancyName"
```sh
mkdocs new FancyName
```
3. It created the folder with the gien name. 
4. To create the documentation use command
```
mkdocs serve
```
5. Now in **mkdocs.yml** file you can include the details such as
```
site_name: FDwave
site_url: https://example.com
nav: 
   - Home: index.md
   - Installation: install.md
   - About: about.md
   - Other_Tabs_Name: file_name.md
theme: readthedocs
```
5. You may add the contents to  **docs/index.md** file. Similarly you may create other files such as
**docs/installation.md**  
**docs/about.md**
6. Build the 
```
mkdocs build
```
8. Deploy the site
```
mkdocs gh-deploy
```
