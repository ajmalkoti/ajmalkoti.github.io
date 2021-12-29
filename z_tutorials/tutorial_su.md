
## What is Seismic Unix (SU)?

Seismic unix is an open source software package for seismic data processing, which was developed under Unix environment.  

It was developed by Colorado school of mines and there were several contributors over the time. 

[SU Download ](https://github.com/JohnWStockwellJr/SeisUnix)   
[SU Manual Ver 4, 2008](http://web.mit.edu/cwpsu_v44r1/sumanual_600dpi_letter.pdf)

Available Interfaces
1. [TKSU](https://www.henrythorson.com/interface.htm), 
2. [Botoseis](https://sourceforge.net/projects/botoseis/), 
3. [GeBr](http://www.gebrproject.com/)

Other resources for SU
1. [KFUPM Manual](https://faculty.kfupm.edu.sa/ES/ashuhail/Undergraduate/GEOP320/Labs/Manual/Manual.pdf)
2. [SU tutorial by Stockwell]( https://yangpl.files.wordpress.com/2015/09/stockwell_su_tutorial_ch1-14.pdf)
3. [Theory of seismic imaging by Scales](http://sappho.eps.mcgill.ca/~olivia/EES/2018-Winter/TSI.pdf)
4. Data processing examples: 
[Example1](https://wiki.seg.org/wiki/Alaska_2D_land_line_31-81#Seismic_Unix_scripts_to_process_2D_land_lines)
[Example2](https://wiki.seg.org/wiki/Alaska_2D_land_line_16-81)



## Other softwares

[CPseis software](https://sourceforge.net/projects/cpseis/) and its [discussion group](http://www.processing-seismic.xyz/css.html)   
[Free USP download](https://freeusp.org/) 

## [Installing SU on windows](https://www.int.com/blog/tag/seismic-unix/)


## Installing SU on ubuntu

1. Download the SU latest package from [here]9https://nextcloud.seismic-unix.org/s/LZpzc8jMzbWG9BZ) and unzip the files.
```
gunzip cwp_su_all_4XRXX.tgz
tar -xvf cwp_su_all_4XRXX.tar 
```

2. I prefer to install the extra softwares in a directory named opt, within home directory. Therefore we will install the SU in directory  ```~/opt/su/```. 
Create above directory using as 
```
mkdir  ~/opt
mkdir ~/opt/su
```

3. Move the unzip files into this created directory.
```
mv ~/Downloads/aa_sesimic_data/cwp_su_all_44R23/src ~/opt/su/
```

4. Set the CWPROOT & Path variable to 'bashrc' file.
```
cd ~/opt/su/
export CWPROOT="$PWD" 
export PATH=$PATH:$CWPROOT/bin:
```
and apply the changes using
```
source .bashrc
```

5. Check if the changes has taken place
```
echo $CWPROOT
echo $PATH
```
6. Making changes to config files. ```Makefile.config_Linux_Ubuntu_20.04``` should be used as main configuration file, i.e. su/src/Makefile.config.

```
cd ~/opt/su/src/configs/
gedit Makefile.config_Linux_Ubuntu_20.04
cp Makefile.config_Linux_Ubuntu_20.04 ../Makefile.config
```
7. Install the SU
```
make install
```
8. Test the installation
``` 
suplane | supswigp > supswigp.eps 
```


**Optional Installations**    
1. ```make xminstall``` - for FFTLAB, a fun educational app for exploring the Fourier Transform.   
2. ```make mglinstall``` - Open GL applications, Graphics codes that could be built upon.  
3. ```make finstall``` - Fortran codes, modeling and anisotropy codes.  
4. ```make sfinstall``` - SFIO installation for segdread (the SEGD to SU data reader) 


```
sudo apt-get install libx11-dev libxt-dev 
make xtinstall  
```


```
sudo apt-get install freeglut3-dev
make mglinstall
```

