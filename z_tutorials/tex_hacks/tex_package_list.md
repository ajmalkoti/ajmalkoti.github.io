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

1. **Font and Encoding**   

   | Pacakage | Description                                                  |
   | -------- | ------------------------------------------------------------ |
   | inputenc | Fixes issue with quotes not rendering e.g. \RequirePackage[utf8]{inputenc} |
   | textcomp | Resolve font encoding errors for missing commands            |
   | fontenc  | For porper text encoding (certain characters dont show up in pdf properly) e.g. \RequirePackage[T1]{fontenc} |

2. **Page geometry**  

   | Pacakage | Description                      |
   | -------- | -------------------------------- |
   | geometry | allows control of paper geometry |

3. **Index and table of content**   

   | Pacakage   | Description                                                  |
   | ---------- | ------------------------------------------------------------ |
   | glossaries | to list and index acronyms  e.g. \RequirePackage[nomain,nowarn,acronym,style=super,xindy, nonumberlist,nopostdot,toc,nogroupskip] {glossaries} |
   | titletoc   | for table of contents material                               |
   | tocloft    | % TOC, LOT, and LOF modification package e.g. \RequirePackage[titles]{tocloft} |

4. **Figure**   

   | Pacakage   | Description                                                  |
   | ---------- | ------------------------------------------------------------ |
   | graphicx   | needed for including graphics e.g. EPS, PS, PDF, PNG, JPEG   |
   | caption    | package to toggle figure, table, and equation captions       |
   | subcaption | package to add figure sub-captions                           |
   | float      | to help align tables, figures, pages                         |
   | tikz       | For drawing manual pictures - i.e flowcharts, block diagrams, etc. |

5. **Maths**

   | Pacakage   | Description                                                  |
   | ---------- | ------------------------------------------------------------ |
   | mathtools  | typesetting of multi-line and other mathematical statements - also loads amsmath package |
   | emathtools |                                                              |
   | amssymb    | package used to create math symbols                          |

6. **Table related** 

   | Pacakage | Description                               |
   | -------- | ----------------------------------------- |
   | multirow | allows detailed control of complex tables |
   | booktabs | to thicken table lines                    |
   | tabularx | for setting table width sizes             |
   | array    | More configurable table options           |

7. **Code **  

   | Pacakage | Description                                          |
   | -------- | ---------------------------------------------------- |
   | fancyvrb | for custom verbatim code definitions - block of code |
   | newverbs | for custom verbatim code definitions - inline code   |

8. **Lists**

   | Pacakage | Description                                                  |
   | -------- | ------------------------------------------------------------ |
   | enumitem | for creating lists                                           |
   | listings | to list verbatim source code                                 |
   | mcode    | to list matlab code - formatted e.g. \RequirePackage[framed,numbered,autolinebreaks]{mcode} |

9. **Refrencing**

   | Pacakage | Description                                                  |
   | -------- | ------------------------------------------------------------ |
   | cleveref | for enhanced reference capability must be loaded after amsmath package e.g. \RequirePackage[noabbrev,capitalise]{cleveref} |
   | hyperref | for creating hyperlinks (must come before glossaries), e.g. \RequirePackage[pdfencoding=auto,psdextra,hyperfootnotes=false]{hyperref} |

10.  **Formatting text and appearnace**  
   | Pacakage    | Description                                                  |
   | ----------- | ------------------------------------------------------------ |
   | csquotes    | Fixes issue with quotes being backwards e.g. \RequirePackage[autostyle, english = american]{csquotes} |
   | lipsum      | Used to generate dummy text                                  |
   | setspace    | For creating custom line spacing                             |
   | indentfirst | To indent first paragraph                                    |
   | lettrine    | For adding a large letter to beginning of paragraph          |
   | alphalph    | Additional package that allows for more than 9 symbols for footnotes |
   | abstract    | For formatted abstract \RequirePackage{abstract}             |
   | multicol    | To create multiple column documents                          |
   | appendix    | To add appendices to docuemnt \RequirePackage[toc]{appendix} |
   | bookmark    | For creating PDF bookmarks in PDF viewer                     |
   | fancyhdr    | needed for header and footer                                 |
   | titlesec    | for customizing section titles                               |

11.  **Programming Latex**   

   | Pacakage | Description         |
   | -------- | ------------------- |
   | multido  | To create for loops |


12. **Other**  
   | Pacakage | Description                                                  |
   | -------- | ------------------------------------------------------------ |
   | xcolor   | required for color  \RequirePackage[table]{xcolor}           |
   | vhistory | Used for tracking version history of document \RequirePackage[nochapter]{vhistory} |

% Solution for Latex 2018 error due to chngcntr package update
% https://tex.stackexchange.com/questions/425600/latex-error-command-counterwithout-already-defined?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
\let\counterwithout\relax
\let\counterwithin\relax
     


% To manage arrays in LaTeX
% IMPORTANT: http://tex.stackexchange.com/questions/65073/latex-doesnt-recognize-endarray
% Errors occure when 'arrayjob' package and 'amsmath' package are used because of \array
% Using 'arrayjobx' resolves the issue by defining \arrayx macro instead of conflicting \array
\RequirePackage{arrayjobx}

% manges hyphenation patterns for a wide range of languages 
\RequirePackage[english]{babel}


% To determine last page of each section
\RequirePackage{lastpage}

% For adding cover sheet
\RequirePackage{wallpaper}  
