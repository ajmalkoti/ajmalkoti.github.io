# Tutorials for tikz from internet 

* (Tikz PGF manual)[https://ctan.org/pkg/pgf?lang=en]
* (Visual tikz)[http://tug.ctan.org/info/visualtikz/VisualTikZ.pdf].               
* (PPT by Jan-Philipp Kappmeier, How to Tikz)[https://www.coga.tu-berlin.de/fileadmin/i26/download/AG_DiskAlg/FG_KombOptGraphAlg/kappmeier/How_to_TikZ_-_current.pdf]                
* (An Introduction to TikZ - Dr. N.K. Sudev)[https://mleczko.faculty.wmi.amu.edu.pl/wp-content/uploads/2020/03/AnIntroductiontoTikZ.pdf]
* (Tikz with maths)[http://www.math.uni-leipzig.de/~hellmund/LaTeX/pgf-tut.pdf]
* (Simple tutorials)[http://www.statistiker-wg.de/pgf/tutorials.htm]  
                
                
# Examples for stack Exchange                
* (Tikz Animiation export to gif)[https://tex.stackexchange.com/questions/435875/draw-an-animated-image-with-tikz]  
* (Using the style command)[https://tex.stackexchange.com/questions/411150/define-tikzstyle-with-postaction]  
* (Use of intersection Library)[https://tex.stackexchange.com/questions/147143/whats-the-difference-between-path-and-draw-in-tikz]  
* (Draw axis)[https://tex.stackexchange.com/questions/222882/drawing-minimal-xy-axis]
* (Channels within a plate)[https://tex.stackexchange.com/questions/373616/draw-a-multi-channel-plate?rq=1]
* (Draw cylinders)[https://tex.stackexchange.com/questions/475078/cylindrical-diagram-of-a-water-filter?rq=1]
* (Water droplets)[https://tex.stackexchange.com/questions/195639/drawing-water-droplets-with-tikz?rq=1]


* (Available libraries)[https://tex.stackexchange.com/questions/42611/list-of-available-tikz-libraries-with-a-short-introduction/42679#42679]


**A basic Tikz code**
```tex
% This is a comment as it has % sign in beginning 

\documentclass[11pt]{standalone}     %Other document classes (e.g. article, book, etc) can also be used.
\usepackage[utf8]{inputenc}
\usepackage{tikz}

\begin{document}
\begin{tikzpicture}
\draw (0,0) -- (2,5) -- (5,0)--cycle;
\end{tikzpicture}
\end{document}
```

As shown the code must include the command ``` \usepackage{tikz}``` in preamble.  
The code between the ```\begin{tikzpicture}  --- \end{tikzpicture}``` is the code to be drawn.
The other command are defined in follwoing parts

**Basic commands in Tikz are**
* \draw  : Used to draw the curves (borders only)
* \fill  : Used to fill the curves (inside body)
* \drawfill : Used to draw as well as fill the curves.
* \shade : Use to provide the shading 
* \coordinate Used to assign a coordinate e.g  \coordinate (Name) at (4,5)
* \path : Used to define a path. It does not draw unless mentioned explicitly. It can be used to find the intersection points of curves.


**Defining coordinates**
* Cartesian coordinates are given in (x,y) form
* Polar coordinates are given in (r,theta) form
* Relative coordinates: coordinate position with respect to last point is given by ++(a,b).
* Adding/subtracting coordinates

**Shifting a curve**
* If using the command \draw, then use  \begin{scope}{xshift=2cm,yshift=1cm}   \draw .... \end{scope}  
* If using the command \draw plot[smooth,tension=1], then use \draw plot[smooth,tension=1, shift={(2,1)}]



**Defining new variables in the tikz**  
\def{\varname}{varvalue}  
\pgfmathset{}



**Scaling the complete figure**
Magnify the figure size by 1.5 times```\begin{tikzpicture}[scale=1.5]  --- \end{tikzpicture}```   
Shrink the figure size by  0.7 times```\begin{tikzpicture}[scale=0.7]  --- \end{tikzpicture}```  
Stretch the figure along x by 1.5 times```\begin{tikzpicture}[xscale=1.5]  --- \end{tikzpicture}```  
Stretch the figure along y by 2 times```\begin{tikzpicture}[yscale=2]  --- \end{tikzpicture}```  

**Drawing Line and changing its properties**
```tex
% line with default properties
\draw (0,0) -- (1,1) -- (2,0) ;                                
\draw (0,0) -- (1,1) -- (2,0) --cycle;
% line with modified properties
\draw[thick,dotted, latex-latex,red,rounded corners] (0,0) -- (1,1) -- (2,0) ;  
```

* Line width: ultra thin, very thin, thin, thick, very thick, ultra thick
* Line type : dotted, dashed, help lines
* Line color : red, green, blue, cyan, magenta, yellow, black, gray, darkgray, lightgray, brown, lime, olive, orange, pink, purple, teal, violet and white

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


**Placing the text**
* If you want to place the text at the given location/coordinate (1cm, -2.5cm) then we can use following  
  ```tex 
  \node [rotate=45, align=left] at (1cm, -2.5cm) {Some text}; 
  ```
  The text can be aligned left/right/above/below to the given coordinate. 
  
* If you want to place the text in middle of a line and in a slanted way then use the position as follows.
```tex
\draw[->,thick] (0,0) -- (4,2) node[pos=.5,sloped,above] {$x$};
\draw[->,thick] (0,0) -- (4,-2) node[pos=.5,sloped,below] {$y$};
```


**Drawing other 2D shapes**
```tex
\draw (2,2) circle (2cm);     
\draw (9,2) ellipse (2cm and 1.5cm);
\draw (15,1.5) arc (0:75:3cm);
\draw[step=1cm,gray,very thin] (-2.9,-2.9) grid (6.9,6.9);
\draw (0,0) parabola (3,3);
\draw (-1,-1) rectangle (4.5,4.5);
```


**Finding intersection of curves and drawing through them**
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
