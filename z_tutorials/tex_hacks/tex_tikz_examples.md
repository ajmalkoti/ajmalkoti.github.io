# Tikz Tutorial 


## Tikz overview 
**A basic Tikz code**  
* The preamble part is stanadard. 
* The latex code must include the command ``` \usepackage{tikz}``` in preamble to enable the commands provided by tikz.  
* The code between the   ```\begin{tikzpicture}  --- \end{tikzpicture}``` is the code to be drawn.

```tex
% This is a comment as it has % sign in beginning 

\documentclass[11pt]{standalone}     %Other document classes (e.g. article, book, etc) can also be used.
\usepackage[utf8]{inputenc}
\usepackage{tikz}

\begin{document}
\begin{tikzpicture}[scale=2]
\draw (0,0) -- (2,5) -- (5,0)--cycle;
\end{tikzpicture}
\end{document}
```
Rest of the commands are defined in following parts


**Basic commands in Tikz are**
| Command | Description | 
|---------|-------------|
|\draw    | Used to draw the curves (borders only)  |
|\fill       | Used to fill the curves (inside body) |
|\drawfill   | Used to draw as well as fill the curves.|
|\shade      | Use to provide the shading |
|\coordinate | Used to assign a coordinate e.g  \coordinate (Name) at (4,5)|
|\path       | Used to define a path. It does not draw unless mentioned explicitly. It can be used to find the intersection points of curves.|


**Defining coordinates**    
| Type    | Description | 
|---------|-------------|
|(x,y)    | Cartesian coordinates e.g., (3cm,4.67cm) |
|(theta:radius) | Polar coordinates e.g., (45:2cm) |
| ++(a,b) | Position relative to last point, e.g. ```(2,3) -- ++(1,1))```  is equivalent to writing (2,3)--(3,4) |
|(x,y).north| Anchor on north of the given coordinate. Options: east,west,north,south. Example: (2,3).north-- (5,5)  |
|(x,y).angle | Anchor at given angle on the given coordinate. Example- (2,3).-45 -- (5,5)  |

Adding/subtracting coordinates (requires \usetikzlibrary{calc})
```tex
\coordinate (A) at (0,0); 
\coordinate (B) at ($ (A) + (0,2) $);
```

**Units in Tikz**  
The units can be specified when coordinates are provided, such as (1pt, 3pt)  or (3in, 4in) etc.

| Units   | Description | 
|---------|-------------|
| cm      | centimeters |
| in      | inches   |
| em      | m width  |
| pt      | points  |


**Scaling the complete figure**
* Magnify the figure size by 1.5 times   
  ```\begin{tikzpicture}[scale=1.5]  --- \end{tikzpicture}```  
  
* Shrink the figure size by  0.7 times  
  ```\begin{tikzpicture}[scale=0.7]  --- \end{tikzpicture}```  
  
* Stretch the figure along x by 1.5 times   
  ```\begin{tikzpicture}[xscale=1.5]  --- \end{tikzpicture}```  
  
* Stetch the figure along y by 2 times  
  ```\begin{tikzpicture}[yscale=2]  --- \end{tikzpicture}```  





## Drawing Line and changing its properties
* A straight line (with default properties) by connecting n-coordinates  
  ```\draw (0,0) -- (1,1) -- (2,0) ;```
* A straight line with end points joined  
  ```\draw (0,0) -- (1,1) -- (2,0) --cycle;```
* Draw a straight line such that the point are joined using the L-path following the grids.
  ```\draw (0,0) |- (1,1) -- (2,0) --cycle;```
* Modified properties of the line 
  ```\draw[thick,dotted, latex-latex,red,rounded corners] (0,0) -- (1,1) -- (2,0) ; ```

**Line properties**
* Line width: ultra thin, very thin, thin, thick, very thick, ultra thick
* Line type : dotted, dashed, help lines
* Line color : red, green, blue, cyan, magenta, yellow, black, gray, darkgray, lightgray, brown, lime, olive, orange, pink, purple, teal, violet and white
* Arrow type at the line ends:  <-, -> , <-> , latex-,  -latex, latex-latex, etc.
* Line cap : round,  

```tex
\draw[very thick] (0,0) to [out=90,in=195] (2,1.5);
```

```tex
\draw[green, ultra thick, domain=0:1] plot (\x, {\x*\x*\x+\x-0.025});
```

```tex
% change below to coordinate
\draw[green, ultra thick] plot[smooth, tension=1] coordinate{(0,0) (1,2) (3,1) (5,7) (6,1)};
```

```tex
\draw (0,0) .. controls (0,4) and (4,0) .. (4,4);
```


## Defining the nodes and text
* Placing the text at the given location   
  ```tex 
  \node at (1cm, -2.5cm) {Some text};        % Place the text at the given coordinate
  \node (A) at (1cm, -2.5cm) {Some text};    % Also define the coordinate by name "A".
  ```
  
* The text can be rotated (by given angle) and aligned (=left/right/above/below) to the given coordinate. 
  ``` \node [rotate=45, align=left] at (1cm, -2.5cm) {Some text};  ```
 
  
* If you want to place the text in middle of a line and in a slanted way then use the position as follows.
```tex
\draw[->,thick] (0,0) -- (4,2) node[pos=.5,sloped,above] {$x$};
\draw[->,thick] (0,0) -- (4,-2) node[pos=.5,sloped,below] {$y$};
```

* place node with repect to given node
```tex
\node[below]  (A) at (0,1) {some text 1}         % just below the point A
\node[below of=A]  (B) at (0,1) {some text 2}    % below the point A (different from above) 
\node[below of=A, xshift=1, yshift=2]  (B) at (0,1) {some text 2}    % below the point A with given shift in x and y 
```
* Node text in shapes
```tex 
\node[circle] at (1,4) {some text}
\node[rectangle] at (1,4) {some text}
\node[rectangle,rounded corners] at (1,4) {some text}
```
* Multiline text (reqires aligning)
```tex
\node[align=center] at (0,0) {some text1// some text 2}
```


## Drawing other 2D shapes
```tex
\draw (2,2) circle (2cm);     
\draw (9,2) ellipse (2cm and 1.5cm);
\draw (15,1.5) arc (0:75:3cm);
\draw[step=1cm,gray,very thin] (-2.9,-2.9) grid (6.9,6.9);
\draw (0,0) parabola (3,3);
\draw (-1,-1) rectangle (4.5,4.5);
```

## Finding intersection of curves and drawing through them
\usepakcage{through}
```tex 
\begin{tikzpicture}[scale=2]
\coordinate [label=left:$A$] (A) at (0,0);
\coordinate [label=right:$B$] (B) at (1.25,0.25);
\draw (A) -- (B);
\node (D) [draw,circle through=(B),label=left:$D$] at (A) {};
\node (E) [draw,circle through=(A),label=right:$E$] at (B) {};
\coordinate[label=above:$C$] (C) at (intersection 2 of D and E);\draw [red] (A) -- (C);
\draw [red] (B) -- (C);
\end{tikzpicture}
```




# Some useful tricks
**Shifting a curve**
* If using the command \draw, then use  
  ```tex 
  \begin{scope}{xshift=2cm,yshift=1cm}     
  \draw ....   
  \end{scope}  
  ```
  Scope accepts following arguments   
  scale, xscale, yscale  
  shift, xshift, yshift   
  rotate 
  
* If using the plot command with draw command 
```tex 
\draw plot[smooth,tension=1, shift={(2,1)}]
```



**Defining new variables in the tikz**  
|Command                   | Example |
|--------------------------|---------|
|\def{\varname}{varvalue}              | \def\x{2.5}               |
|\pgfmathsetmacro{\varname}{\varvalue} | \pgfmathsetmacro{\X}{2.5} | 


pgfmath package is inbuilt in tikz 


## PGFmath Packages
* Assign a Macro  
```tex 
\def\a{0.5}
\def\b{0.5}
\def\bAngle {-10}
\pgfmathsetmacro{\X}{2.5}
\pgfmathsetmacro {\hyp}{\a*0.5 / cos (84)}
\pgfmathsetmacro {\len}{sqrt(\hyp*\hyp -0.25*\a*\a)}
```
* Caculate a value/point etc.

* Add/subtract points 


## Conditions based upon if-else
<!--  https://tex.stackexchange.com/questions/167153/dynamically-hide-latex-beamer-frame-based-on-tags -->

In following line we create a condition name- "Show" which if set to true/false, will run/hide the code.
```tex 
\newif\ifShow        %%% Create conditions
\Showtrue            %%%% Set the condtion value as true

\ifShow
 Place commands to be run/hide according the value of condtion
\fi
```

## Tutorials for tikz from internet 

* (Tikz PGF manual)[https://ctan.org/pkg/pgf?lang=en]
* (Visual tikz)[http://tug.ctan.org/info/visualtikz/VisualTikZ.pdf].               
* (PPT by Jan-Philipp Kappmeier, How to Tikz)[https://www.coga.tu-berlin.de/fileadmin/i26/download/AG_DiskAlg/FG_KombOptGraphAlg/kappmeier/How_to_TikZ_-_current.pdf]                
* (An Introduction to TikZ - Dr. N.K. Sudev)[https://mleczko.faculty.wmi.amu.edu.pl/wp-content/uploads/2020/03/AnIntroductiontoTikZ.pdf]
* (Tikz with maths)[http://www.math.uni-leipzig.de/~hellmund/LaTeX/pgf-tut.pdf]
* (Simple tutorials)[http://www.statistiker-wg.de/pgf/tutorials.htm]  
                
                
## Examples for stack Exchange                
* (Tikz Animiation export to gif)[https://tex.stackexchange.com/questions/435875/draw-an-animated-image-with-tikz]  
* (Using the style command)[https://tex.stackexchange.com/questions/411150/define-tikzstyle-with-postaction]  
* (Use of intersection Library)[https://tex.stackexchange.com/questions/147143/whats-the-difference-between-path-and-draw-in-tikz]  
* (Draw axis)[https://tex.stackexchange.com/questions/222882/drawing-minimal-xy-axis]
* (Channels within a plate)[https://tex.stackexchange.com/questions/373616/draw-a-multi-channel-plate?rq=1]
* (Draw cylinders)[https://tex.stackexchange.com/questions/475078/cylindrical-diagram-of-a-water-filter?rq=1]
* (Water droplets)[https://tex.stackexchange.com/questions/195639/drawing-water-droplets-with-tikz?rq=1]


* (Available libraries)[https://tex.stackexchange.com/questions/42611/list-of-available-tikz-libraries-with-a-short-introduction/42679#42679]

## Examples 
### How to annotate equations 

### How to annotate matrix 

\newcommand{\tikzmark}[2]{
	\tikz[overlay,remember picture,baseline] 
	\node[anchor=base] (#1) {$#2$};
}

```tex
\begin{align}
	\begin{bmatrix}
	\sigma_{11}\\  \sigma_{22}\\  \sigma_{33}\\  \sigma_{32}\\  \sigma_{31}\\  \sigma_{21}	
	\end{bmatrix}
	=
	\begin{bmatrix}
		\tikzmark{ext1}{c_{11}} & \tikzmark{exex1}{ c_{12}} & \tikzmark{exex3}{c_{13}} & \tikzmark{exsh1}{c_{14}} & c_{15}                   & c_{16}                    \\
		c_{21}                  & c_{22}                    & \tikzmark{exex2}{c_{23}} & c_{24}                   & c_{25}                   & c_{26}                    \\
		c_{31}                  & c_{32}                    & \tikzmark{ext2}{c_{33}}  & c_{34}                   & c_{35}                   & \tikzmark{exsh2}{c_{36}} \\
		c_{41}                  & c_{42}                    & c_{43}                   & \tikzmark{she1}{c_{44}}  & \tikzmark{shsh1}{c_{45}} & \tikzmark{shsh3}{c_{46}}  \\
		c_{51}                  & c_{52}                    & c_{53}                   & c_{54}                   & c_{55}                   & \tikzmark{shsh2}{c_{56}}  \\
		c_{61}                  & c_{62}                    & c_{63}                   & c_{64}                   & c_{65}                   & \tikzmark{she2}{c_{66} }
	\end{bmatrix}
	%
	\begin{bmatrix}
	\varepsilon_{11}\\  \varepsilon_{22}\\  \varepsilon_{33}\\  \varepsilon_{32}\\  \varepsilon_{31}\\  \varepsilon_{21}	
	\end{bmatrix}
\end{align}

% coordinate specifications
% a.east, a.west, a.north, a.south 
% a.135, a.-45

\begin{tikzpicture}[overlay,remember picture]
% pure extension
\draw[opacity=.4,line width=4mm,line cap=round] (ext1.center) -- (ext2.center) ;
\draw[thick,-stealth] (ext1.north)--++(0,.4cm)node[shift={(0,.2cm)}]{Extension};
% pure shear
\draw[opacity=.4,line width=4mm,line cap=round] (she1.center) -- (she2.center);
\draw[thick,-stealth] (she2.south)|-++(-.5,-.3cm)node[left]{Shear};
%%% extension-shear
\draw[red!30,fill=red!30,opacity=.4,line width=.5mm] (exex1.145)--(exex2.-45)--(exex3.45)--cycle;
\draw[thick,-stealth] (exex1.north)++(.4,0) |-++(.5cm,.9cm)node[right]{Extension-Extension coupling};
%% shear-shear 
\fill[opacity=.4,line width=3mm,line cap=round,color=green!30] (exsh1.135) rectangle (exsh2.-45);
\draw[thick,-stealth] (exsh1.north)++(.8,0)|- ++(0.5,.4cm)node[right]{Shear-Extension coupling};
%% shear extension
\draw[red!30,fill=red!30,opacity=.4,line width=.5mm] (shsh1.145)--(shsh2.-45)--(shsh3.45)--cycle;
\draw[thick,-stealth] (shsh2.east)--++(.2,0)-- ++(0,-1.5)--++(-.5,0)node[left]{Shear-shear coupling};
\end{tikzpicture}

```
