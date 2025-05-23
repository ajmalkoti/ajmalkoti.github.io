## How to install the GitHub on ubuntu
The [wiki tutorial](https://wiki.paparazziuav.org/wiki/Github_manual_for_Ubuntu) describes well about 
to install the GIT however there are a few gliches. 
Therefore, I will try to avoid those and it goes as follows. 

1. Open the terminal (or press Alt+Ctrl+T)  
2. Go to the .ssh folder (```$cd ~/.ssh```)   
3. Generate the SSH key with your email id.  
    ```$ ssh-keygen -t rsa -C "your_email@youremail.com"```      
   It asks for file name and password.
   Just press enter if you dont want to give any (altenatively you can provide above information).
   Now we assume you did not provide any filename or password so it will generate two files
   id_rsa, and id_rsa.pub
   
4. Make a copy of the generated key and store it in separate directory  
   ```mkdir github_keys```  
   ```cp id_rsa* github_keys```  
5. You need to add the same keys (that you generated on your desktop/compter) to your GitHub account (online) 
   So open your Github account setting (online) and navigate as follows.  
   1. Open your Github account (online)
   2. Click on your account name (left top corner). 
   3. In the drop down menue, choose "Settings" 
   4. Select SSH and GPG Keys 
   5. Click on- Add new SSH key     
6. Now it will ask for name of key, so, give a suitable name to this key so that you can recognize to which system it is connected.  
7. It will also ask for the value of key. This was generated above and stored in file "id_rsa.pub" in your desktop.  
   You can open the file "id_rsa.pub" present in your desktop, with gedit.
   Copy its content and paste it into your GitHub account.   
6. Now you finally add these keys to known-host list by issuing the following command.  
   ```ssh-add```

The setup is complete now.


## Install the git  
  ```sudo apt-get install git-core git-gui git-doc```

## How to create a new repository  on desktop
1. Make a folder in your home directory e.g. 
   ```mkdir ~/GitHub```  
2. Assume the project name is "test"  then create a directory with same name.   
   ```mkdir test```  
   ```cd test```  
3. Initialize the git for the project (note one must be inside the directory)
   git init  
4. Connect it to remote/GitHub directory "test"  
   ```git remote add origin  https://github.com/your_username/test```   
   
The github and the desktop directory may not have same names. For simplicity we kept both as same.  

Sometime it maynot work. So another way is to create a repository online and then clone/copy it and later update it as described in steps below.

## Creating a repository online 
1. Go to your home page. 
2. On left pane, click on "New" button to create a new repository. 
3. Provide a unique name for the repository.
4. Select if it is private or public.
5. Add a ReadMe.md file in which you can provide the description for the repository.
6. Choose a licence, and file to ignore (gitignore).




## How to copy and existing repository
1. Make a folder in your home directory e.g. ```mkdir ~/GitHub```. Ignore if it exists.
2. Change directory, ```cd GitHub```  
3. Clone the project within this directory, where a new directory, with same name as project will be created.  
   git clone git@github.com:username/projectname   
   e.g.   
   ```/Home/User/GitHub>> git clone git@github.com:ajmalkoti/ANCC_MCHVRatio```  
  It may ask for the password that you provided during creation of ssh-keys. It is not your github password.   
  
Now you should be able to download all the documents within the project.

## How to make some changes and update the repository
Let us assume that you made changes in the files present within project directory. 
1. Now add all files to be updating list individually  
   ```git add filename```    
   or or all at once as   
   ```git add .```  
2. Add some message for the update you are making   
   ```git commit -m "some_meaningful_message"```   
3. Issue command to update. Until you issue this command the files will not be uploaded/updated to GitHub.  
   ```git push origin master```


## Some special situations while pulling or pushing the respository
1. Ignore local changes and pull the version online
```
git reset --hard
git pull
```
2. Error while you added tried to push large (>100 MB) files.  
   The solution proposed here (taken from internet) will remove the file so one should find all such files first and back them up.
    Step 1. Find all files size>100 MB and if take backup of all such files. On ubuntu you may use following command
    ```
    find ./Github/ -type f -size +100M
    ```
    Step 2. Use git filter  command to remove all such files. This operation will DELETE the file.!!!
    ```
    git filter-branch --index-filter 'git rm --cached --ignore-unmatch FILENAME'
    ```
    Step 3. Apply the git push.

4. 
