## Changing Linux prompt
 PS1='aj@cchpc:\w$ '
 
## Working with images 
* Crop images
  - Using Imagemagick:  `mogrify -trim *.png `. 
    It removes the white space around the image
  - Crop based upon pixel
    `convert input.jpg -crop WxH+L+T output.jpg `
     where,  
     W, H= width and height of the figure;    
     L = Distance between the  left edge of the image and left side of cropped area.;  
     T = Distance between the top of the image and Top of the cropped area.
* change resolution


## Working with pdf
* Extract a single/ set of pages from a pdf 
  - Using PDFTK : `pdftk`
* Cropping PDF
  - Using PDFCROP `pdfcrop IPFileName.pdf  OPFileName.pdf`. Removes white space around the pdf.
* Convert the PDF file to jpg or png
  - Using  PDFtoPPM : ```pdftoppm -jpeg -r 300 input.pdf output ```
  - Using  Imagemagik: ```convert -density 150 input.pdf -quality 90 output.png ```. 
    Though it may require some explicit permission. 
    
    
## Creating a soft link to some executable
   Several time we have a code and its executables in a directory 
   (lets call it code directory) and we have a working folder in which 
   we will be performing tests aka "working directory". 

   Execution of the code takes following way
   `./a_very_long_path_to_code_dir/exename `

   Instead of calling code executable each time from the code we can create 
   a soft link in working directory with the following command
   `link -s  path_of executable    path_where_to_create link `
    i.e.     `link -s  a_very_long_path_to_code_dir/exename  .`
    Note:  the dot in command (.) represent the current directory.


##  Accessing the Remote server
Sometime the user require to access the software/applications installed at server. This can be easily achieved in following ways depending upon the platform you are using. Assume 
1. Username is 'HarryPotter'                
2. Server IP address is  192.168.8.5  
STEPS
1.  Open the terminal by "ALT + CTRL + T"
2.  Use the SSH command as following:      `$ssh username@IP_Address`
    e.g.      `$ssh HarryPotter@192.168.8.5 `
3.  After this the server asks for your password.  Once you enter the password,  you are in.
4.  If you want to see the graphics while accessing the remote terminal then you have to 
    use X11 port forwarding. For this you must do following 
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
     - Now use following command to connect with server with x11 forwarding 
       ```sh
       $ssh -v -C -X user@host```
       where         
       -X is for x11  
       -C is for compression  and  
       -v is for verbose to check for warnings.  


##  Transferring the files from one system to another system1.
1. If sending to remote server from computer   
   `scp /file/to/send username@remote:/where/to/put`   
   If receiving from remote server to computer   
   `scp username@remote:/file/to/send /where/to/put`

2.  Between a remote source and remote receiver.   
    `scp username@source:/location/to/file username@destination:/where/to/put`


## Periodic transfer/copy of files/files from server A to B using Rsync
To sync the files from server A (having original copy) to server B (where data to be copied)
1. Install rsync on both servers.
   `apt-get install rsync`
2. Generate SSH key on server B (with defaults).
    `ssh-keygen`
   The keys can be found in folder:  /RootOfServerB/.ssh/id_rsa.pub 
3. Copy contents of key from B to A
4. Copy contenet in A  /RootOfServerA/.ssh/authorized_keys
5. Start sync by running following command at server B
   ```sh
    rsync -avrt --delete --rsh='ssh -p 22' root@SERVER_A_IP_ADDRESS:/path PathServerB
    rsync -rh --delete --progress  root@IP:~/specfem3d-master ~/Documents 
    ```
6. Setup Cron job (repeated job)
   ``'/etc/crontab
    */3 * * * * root rsync -avrt --delete --rsh='ssh -p 22' root@SERVER_A_IP_ADDRESS:/path PathServerB/ >/dev/null 2>&1
    ```



##  Installing BLAS, LAPACK, LAPACKE, etc. 
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
   
