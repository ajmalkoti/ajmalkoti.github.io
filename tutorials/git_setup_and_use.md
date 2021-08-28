## How to install the GitHub on ubuntu
The [wiki tutorial](https://wiki.paparazziuav.org/wiki/Github_manual_for_Ubuntu) describes well about 
to install the GIT however there are a few gliches. 
Therefore, I will try to avoid those and it goes as follows. 

1. Open the terminal (or press Alt+Ctrl+T)  
2. Go to the .ssh folder ($cd ~/.ssh)   
3. Generate the SSH key with your email id.  
    $ ssh-keygen -t rsa -C "your_email@youremail.com"      
   It will ask for a password so enter the desired one.
4. Make a copy of the generated key and store it in separate directory  
   mkdir github_keys  
   cp id_rsa* github_keys  
5. You need to add the same keys you generated on your desktop/compter to your GitHub account (online) 
   So open your Github account setting (online) and navigate as follows.  
   Your Account (left top corner) --> settings --> SSH and GPG Keys --> Add new SSH key  
  
6. Give a suitable name to this key   
7. Copy your computer/desktop github_keys here. 
   For this you open the file "id_rsa.pub" in your desktop with gedit.
   Copy its content and paste it into your GitHub account.   
6. Now you finally add these keys to known-host list by issuing the following command  
   ssh-add

The setup is complete now.


## Install the git  
  sudo apt-get install git-core git-gui git-doc

## How to create a new repository
1. Make a folder in your home directory e.g. mkdir ~/GitHub  
2. Assume the project name is "test"  then create a directory with same name. 
   mkdir test  
   cd test  
3. Initialize the git for the project (note one must be inside the directory)
   git init  
4. Connect it to remote/GitHub directory "test"  
   git remote add origin  https://github.com/your_username/test   
   
Note: the github and the desktop directory may not have same names. For simplicity we kept both as same.  


## How to copy and existing repository
1. Make a folder in your home directory e.g. mkdir ~/GitHub. Ignore if it exists.
2. Change directory, cd GitHub 
3. Clone the project within this directory, where a new directory, with same name as project will be created.  
   git clone git@github.com:username/projectname   
   e.g.   
   ~/GitHub>> git clone git@github.com:ajmalkoti/ANCC_MCHVRatio  

Now you should be able to download all the documents within the project.

## How to make some changes and update the repository
Let us assume that you made changes in the files present within project directory. 
1. Now add all files to be updating list individually 
   git add filename    
   or or all at once as   
   git add .  
2. Add some message for the update you are making 
   git commit -m "some meaningful message"   
3. Issue command to update. Until you issue this command the files will not be uploaded/updated to GitHub.
   git push origin master  
