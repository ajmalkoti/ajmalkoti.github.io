# Installation
(The user must take utmost care in installing the OS as it may result in data loss).
1. It would require you to first decide your partition configuration. It can be done in many ways, and ubuntu also offers a default way as well.However I prefere the following layout 
 i. Swap partition = 2x RAM size
 ii. Root partition = 50 GB (Which is more than sufficient) 
 iii Home partition = rest of the space
 
2. Creation of startup disk.  First, you must download the latest version of Ubuntu from the official website and a have a USB disk with sufficient sapce (8GB is sufficient). Now this Ubuntu image can be transferred to the USB using special tools. If you are using Ubuntu then use "startup disk creator" tool which is actually preinstalled in every Ubuntu distro. If you are using Windows then download and install the Rufus tool. These tools have very simple interface where you need to provide the location of Linux image and the location of USB drive to which the image will be transferrred.
3. Now you plug the pendrive to the computer where you want to install Ubuntu. Boot the computer, i.e. switch off the computer (if running) and then power on it. 
4. Check your BIOS setting for the first boot device, which should be set to the USB. 
5. If your BIOS setting are right and Ubuntu image is transferred correctly it should start with Ubuntu with and option to install.
6. Once you choose to install it will ask some trivial details such as Time zone, Keyboard type, etc. Care must be taken when it asks for which partition to install on. It may wipe your entire disk (including OS and data). Choose the unpartitioned space and create partitions as shown in step 1.
7. After that it will ask for some extra details e.g. username and password, and what extra software you want to install, etc. 
8. Once the process is finished your Ubuntu is ready to use.



# Software and Manintainance
### Important software list
| Software      | Description   |
| ------------- | ------------- |
| Pinta, Imagemagick, GhostScript   |  Used for editing the images|
| Inkscape                     | Used for drawing the figures|
| Ktouch, Qstamina             | For learning typing |
| Foxit, DjView, PDFarranger   | PDF viewer and editor|
| VLC                          | Plays most of the video formats |
|Dropbox                       | Online sync of files|
|Simple screen recorder        | Recording the screen |
|Texstudio and Texmaker, latex | For writing scientific documents |
|Play on linux                 | Running few windows application on linux |


### Some add-on
 1. Installing Complete Multimedia Support:  
In order to play media files like MP#, MPEG4, AVI etc, you’ll need to install media codecs. Ubuntu has them in their repository but doesn’t install it by default because of copyright issues in various countries.
```sh 
sudo apt install ubuntu-restricted-extras
```

2. Improve Battery by installing TLP for Linux
```sh
sudo apt-get install tlp tlp-rdw
sudo tlp start
```
3. Enable GNOME Shell Extension to add extensions to OS and browser (e.g. GS connect)
4. Changing desktop environment
```sh 
sudo apt install gnome-tweak-tool -y
```
5. Installing flatpack for more options

### List of some trivial issues
1. Getting preview of files as thumbnail.
```sh 
sudo apt install gstreamer1.0-libav 
sudo apt install ffmpegthumbnailer
```  

2. Cleaning the unused package
```sh 
sudo apt-get autoclean
sudo apt-get clean
sudo apt-get autoremove
```
3. Setting Night-mode on for ease of eyes at night 
```Settings > Devices > Screen Display >Night Light```
4. Setting minimization on click for the Ubuntu dock
```sh
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
```


# Using linux
### Changing Linux prompt
 PS1='aj@cchpc:\w$ '
 
### Transferring bulk of files from linux to windows (or external drive)
Unix file naming system follows UTF8 while for windows it is different. Therefore one may want to remove the incompatible characters so that files get transferred. For bulk of file it can be done using detox as follows.
```sh
detox -r -v /path/to/your/files
```
where  
-r Recurse into subdirectories  
-v Be verbose about which files are being renamed   
-n Can be used for a dry run (only show what would be changed)  


 
### Working with images 
|  Task  | Software| Command  | 
|--------|----------|--------|
|Crop image/removing white space around the image. | Imagemagick | ```mogrify -trim *.png```   |
|Crop image based upon pixel                       | Imagemagick | ```convert input.jpg -crop WxH+L+T output.jpg```<br> where,<br> W, H= width and height of the figure; <br> L = Distance between the  left edge of the image and left side of cropped area.;<br> T = Distance between the top of the image and Top of the cropped area.|
|Changing resolution| GhostScript |

### Working with pdf
|  Task  | Software| Command  | 
|--------|----------|--------|
| Extract a single/ set of pages from a pdf| PDFtk  |  ```pdftk in.pdf cat 2-2 output singlepage.pdf``` |
| Joining two pdf                          | PDFtk  |  ```pdftk in1.pdf in2.pdf cat output joined.pdf```|
| Delete a page                            | PDFtk  |  ```pdftk in.pdf cat 1-12 14-end output out1.pdf```
| Crop PDF/Removes white space around it   | PDFCROP|  ```pdfcrop IPFileName.pdf  OPFileName.pdf```|
| Convert the PDF file to jpg or png       | PDFtoPPM |  ```pdftoppm -jpeg -r 300 input.pdf output ``` |
|                                          |Imagemagick | ```convert -density 150 input.pdf -quality 90 output.png ``` <br>Imagemagick may require some explicit permission.|
| Repair a pdf                             | PDFtk     |  ```pdftk broken.pdf output fixed.pdf```|


### Creating a soft link to some executable
Several time we have a code and its executables in a directory (lets call it code directory) and we have a working folder in which we will be performing tests. Lets call it **working directory**. The executable files are present as folloing  
```./a/very/long/path/to/code/directory/executable_file_name```. It will be time consuming to call the code/executable each time with full path, instead  of it we can create a soft link in working directory, which will be very convinient for use.  

| Task | Command |
| --- | ---|
|Creating soft link|  ```link -s  path_of executable  path_where_to_create link ``` |
|Example: create soft link in present folder | ```link -s  a_very_long_path_to_code_dir/exename  .``` <br>The dot (.) represents the current directory.|


###  Accessing the Remote server
Sometime the user require to access the software/applications installed at server. This can be easily achieved in following ways depending upon the platform you are using. Open the terminal by pressing keys "ALT + CTRL + T" and enter SSH command. Afterwards it asks you to enter the password and let you in. 
|  Task | Command  |  Example | 
| --- | --- | ---|
| Log in remote server | ```$ssh username@IP_Address```   |  e.g. ```$ssh HarryPotter@192.168.8.5 ``` |
| Log in remote server (with graphics) <br> through x11 forwarding| $ssh -v -C -X username@IP_Address|  e.g. ```$ssh -X HarryPotter@192.168.8.5 ``` |
|| Here, -X is for x11, -C is for compression <br> and  -v is for verbose to check for warnings.  ||

### Graphics issue in Remote access
If you want to see the graphics while accessing the remote terminal then you have to use X11 port forwarding. For this you must do following.    
- On the server your /etc/ssh/sshd_config file should have following settings:  
    ```
    X11Forwarding yes  
    X11DisplayOffset 10  
    X11UseLocalhost no  
    ```
- On the client side your ~/.ssh/config file should have following settings:  
    ```     
    Host *
    ForwardAgent yes
    ForwardX11 yes
    ```
    

###  Transferring the files from one system to another system1.
1. If sending to remote server from computer   
   `scp /file/to/send username@remote:/where/to/put`   
   If receiving from remote server to computer   
   `scp username@remote:/file/to/send /where/to/put`

2.  Between a remote source and remote receiver.   
    `scp username@source:/location/to/file username@destination:/where/to/put`


### Periodic transfer/copy of files/files from server A to B using Rsync
To sync the files from **server A** (having original copy) to **server B** (where data to be copied). 

1. Install rsync on both servers.
   `apt-get install rsync`
2. Generate SSH key on server B (with defaults).
    `ssh-keygen`  
   The keys can be found in folder:  `/RootOfServerB/.ssh/id_rsa.pub`  
3. Copy contents of key from B to A
4. Copy contenet in A  `/RootOfServerA/.ssh/authorized_keys`  

5. Start sync by running following command at server B
    ```sh
        rsync -avrt --delete --rsh='ssh -p 22' root@SERVER_A_IP_ADDRESS:/path PathServerB
        rsync -rh --delete --progress  root@IP:~/specfem3d-master ~/Documents 
    ```
6. Setup Cron job (repeated job)
    ```
    /etc/crontab
    */3 * * * * root rsync -avrt --delete --rsh='ssh -p 22' root@SERVER_A_IP_ADDRESS:/path PathServerB/ >/dev/null 2>&1
    ```



###  Installing BLAS, LAPACK, LAPACKE, etc. 
*  LAPACK  
   https://www.assistedcoding.eu/2017/11/04/how-to-install-lapacke-ubuntu/
   ```
   $ sudo apt install liblapack3
   $ sudo apt install liblapack-dev
   $ sudo apt install libopenblas-base
   $ sudo apt install libopenblas-dev
   $ sudo apt install liblapacke-dev
   $ sudo apt install liblapack-dev
   -lm -lblas -llapack -llapacke
   ```
*  OPENBLAS  
   `$ sudo apt-get install libopenblas-dev`
*  FFTW  
   `sudo apt-get install libfftw3-dev libfftw3-doc `
   
### Mounting ntfs on Redhat
Copied from : https://superuser.com/questions/251663/unable-to-mount-ntfs-drive-with-rhel-6
1. Install dkms and ntfs-3g from EPEL:  
    For i386:  
   ```  rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-7.noarch.rpm ```

    For x86_64:  
    ```rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-7.noarch.rpm```
2. Install the ntfs-3g as   
  ```yum install dkms ntfs-3g```

