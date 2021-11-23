# Almost essential packages
* graphicx
* amsmath
* xcolor
* tikz
* pgf
* pgfplots
* bm 

# Font Selection
* ComputerModern - cmr - default font, roman-fontfamily
* Utopia Fourier - put
* Palatino       - ppl 
* Fira Sans 
* plex-sans
   




Specialized tool box
* xpatch 
* **xspace**- The xspace package provides a single command that looks at what comes after it in the command stream, and decides whether to insert a space to replace one “eaten” by the TeX command decoder. 
Use it as : \newcommand{\test}{Some command or text here \xspace} 


## Font selection and setting 
A written text has many aspects for which the type setting can be  chosen as folloing
1. Font Size - \tiny, \scriptsize, \footnotesize, \small, \normalsize, \large, \Large, \LARGE, \huge, \Huge
2. Font Style (six types)- 
   1. bold  - \textbf{TEXT HERE}, or \bfseries
   2. medium - \textmd{TEXT HERE}, or \mdseries 
   3. italic - \textit{TEXT HERE}, or\itshape
   4. stanted - \textsl{TEXT HERE}, or \slshape
   5. small cap - \textsc{TEXT HERE}, or \scshape
   6. upright - \textup{TEXT HERE}, \upshape   
3. Font Family (three families)
   1. Serif (roman)          - \textrm{TEXT HERE}, \rmfamily
   2. Sans serif             - \textsf{TEXT HERE}, \sffamily
   3. Typewriter (monotype)  - \texttt{TEXT HERE}, \ttfamily
4. Font typeface 
   There are probably hundreds of font families out. They can be classified on many basis
   first is 
   1. Computer Modern Fonts (cmr)
   2. Latin modern Fonts (lmr)
   3. Post Script Fonts
   4. TeX Gyre
   
The default font typeface is selected by command \usepackage{FontName}
It can be changed at any time in text using the command \fontfamily{FontCode}\selectfont
   
   Name           - code - remark
   
   ComputerModern - cmr - default font, roman-fontfamily
   
   Utopia Fourier - put
   
   Palatino       - ppl 
   
   Fira Sans 
   
   plex-sans
   
   
A font can  be selected as
* \usepackage{plex-serif}  use the font for serif font only 
* \usepackage{plex-sans}  use the font for sans font only  
* \usepackage{plex-mono}  use the font for mono font only 


\usefont{<encoding>}{<family>}{<series>}{<shape>}
\usefont{T1}{pcr}{m}{sl}
   
   
## Code highlighting 
* lstlisting is used generally
* mcode can be used only for matlab. It is preset for MATLAB.




## a LIST OF PACKAGES COPIED FROM INTERNET

https://nasa.github.io/nasa-latex-docs/html/misc/quick-start.html#quickstartguide


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Required packages for the LaTeX template
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% for creating hyperlinks (must come before glossaries for proper hyperlinks to work)
\RequirePackage[pdfencoding=auto,psdextra,hyperfootnotes=false]{hyperref}

% to list and index acronyms            
\RequirePackage[nomain,nowarn,acronym,style=super,xindy, nonumberlist,nopostdot,toc,nogroupskip] {glossaries} 
% needed for including graphics e.g. EPS, PS, PDF, PNG, JPEG
\RequirePackage{graphicx}            

% needed for header and footer
\RequirePackage{fancyhdr}           

% allows control of paper geometry
\RequirePackage{geometry}

% required for color            
\RequirePackage[table]{xcolor}

% allows detailed control of complex tables      
\RequirePackage{multirow} 

% to thicken table lines           
\RequirePackage{booktabs}

% for setting table width sizes             
\RequirePackage{tabularx}

% Solution for Latex 2018 error due to chngcntr package update
% https://tex.stackexchange.com/questions/425600/latex-error-command-counterwithout-already-defined?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
\let\counterwithout\relax
\let\counterwithin\relax

% to reset counter of figures and tables per section            
\RequirePackage{chngcntr}       

% for customizing section titles    
\RequirePackage{titlesec}       

% for table of contents material    
\RequirePackage{titletoc}   

% package to toggle figure, table, and equation captions        
\RequirePackage{caption}                

% package to add figure sub-captions        
\RequirePackage{subcaption}

% to help align tables, figures, pages
\RequirePackage{float}      

% for custom verbatim code definitions - block of code      
\RequirePackage{fancyvrb}

% for custom verbatim code definitions - inline code            
\RequirePackage{newverbs}       

% manges hyphenation patterns for a wide range of languages 
\RequirePackage[english]{babel}

% for creating lists        
\RequirePackage{enumitem}   

% typesetting of multi-line and other mathematical statements - also loads amsmath package
\RequirePackage{mathtools} 

% package used to create math symbols          
\RequirePackage{amssymb}            

% for enhanced reference capability must be loaded after amsmath package
\RequirePackage[noabbrev,capitalise]{cleveref}

% Fixes issue with quotes not rendering
\RequirePackage[utf8]{inputenc}

% Fixes issue with quotes being backwards
\RequirePackage[autostyle, english = american]{csquotes} 

% TOC, LOT, and LOF modification package
\RequirePackage[titles]{tocloft} 

% to list verbatim source code   
\RequirePackage{listings}           

% More configurable table options
\RequirePackage{array}  

% Used to generate dummy text           
\RequirePackage{lipsum}             

% Used for tracking version history of document
\RequirePackage[nochapter]{vhistory}    

% To add appendices to docuemnt
\RequirePackage[toc]{appendix}

% to list matlab code - formatted
\RequirePackage[framed,numbered,autolinebreaks]{mcode} 

% For porper text encoding (certain characters dont show up in pdf properly)
\RequirePackage[T1]{fontenc}

% Resolve font encoding errors for missing commands
\RequirePackage{textcomp}

% For drawing manual pictures - i.e flowcharts, block diagrams, etc...
\RequirePackage{tikz}

% For creating PDF bookmarks in PDF viewer
\RequirePackage{bookmark}

% For creating custom line spacing
\RequirePackage{setspace}

% For adding a large letter to beginning of paragraph 
\RequirePackage{lettrine}

% To indent first paragraph
\RequirePackage{indentfirst}

% To create multiple column documents
\RequirePackage{multicol}

% To manage arrays in LaTeX
% IMPORTANT: http://tex.stackexchange.com/questions/65073/latex-doesnt-recognize-endarray
% Errors occure when 'arrayjob' package and 'amsmath' package are used because of \array
% Using 'arrayjobx' resolves the issue by defining \arrayx macro instead of conflicting \array
\RequirePackage{arrayjobx}

% To create for loops
\RequirePackage{multido}

% Additional package that allows for more than 9 symbols for footnotes
\RequirePackage{alphalph}

% For saythanks command
\RequirePackage{abstract}

% For saythanks command
\RequirePackage{lettrine}

% To determine last page of each section
\RequirePackage{lastpage}

% For adding cover sheet
\RequirePackage{wallpaper}  
