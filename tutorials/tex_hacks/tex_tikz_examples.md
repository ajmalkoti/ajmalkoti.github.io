# Examples for tikz from internet 

* (Tikz PGF manual)[https://ctan.org/pkg/pgf?lang=en]
* (Visual tikz)[http://tug.ctan.org/info/visualtikz/VisualTikZ.pdf].               
* (PPT by Jan-Philipp Kappmeier, How to Tikz)[https://www.coga.tu-berlin.de/fileadmin/i26/download/AG_DiskAlg/FG_KombOptGraphAlg/kappmeier/How_to_TikZ_-_current.pdf]                
                
                
* (Tikz Animiation export to gif)[https://tex.stackexchange.com/questions/435875/draw-an-animated-image-with-tikz]  
* (Using the style command)[https://tex.stackexchange.com/questions/411150/define-tikzstyle-with-postaction]  
* (Use of intersection Library)[https://tex.stackexchange.com/questions/147143/whats-the-difference-between-path-and-draw-in-tikz]  
* (Draw axis)[https://tex.stackexchange.com/questions/222882/drawing-minimal-xy-axis]
* (Channels within a plate)[https://tex.stackexchange.com/questions/373616/draw-a-multi-channel-plate?rq=1]
* (Draw cylinders)[https://tex.stackexchange.com/questions/475078/cylindrical-diagram-of-a-water-filter?rq=1]
* (Water droplets)[https://tex.stackexchange.com/questions/195639/drawing-water-droplets-with-tikz?rq=1]


Basic commands in Tikz are
* \draw  : Used to draw the curves (borders only)
* \fill  : Used to fill the curves (inside body)
* \drawfill : Used to draw as well as fill the curves.
* \coordinate Used to assign a coordinate e.g  \coordinate (Name) at (4,5)
* \path : Used to define a path. It does not draw unless mentioned explicitly. It can be used to find the intersection points of curves.


Coordinates 
* Cartesian coordinates are given in (x,y) form
* Polar coordinates are given in (r,theta) form
* Relative coordinates: coordinate position with respect to last point is given by ++(a,b).
* Adding/subtracting coordinates

Shifting a curve 
* If using the command \draw, then use  \begin{scope}{xshift=2cm,yshift=1cm}   \draw .... \end{scope} 
* If using the command \draw plot[smooth,tension=1], then use \draw plot[smooth,tension=1, shift={(2,1)}]