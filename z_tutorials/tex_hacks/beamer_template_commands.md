Here I give a compilation of commands I used for tweaking the beamer class.

### Fonts
```tex
%\usepackage{beton}
%\usepackage{euler}   % mathfont
%%\usepackage[OT1]{fontenc}
%\usepackage{libertine}
%%\usepackage[T1]{fontenc}				%% good one
%%\usepackage{newtxtext,newtxmath}        % mathfont

\usepackage[p,osf]{scholax}						%% good
%% T1 and textcomp are loaded by package. Change that here, if you want
%% load sans and typewriter packages here, if needed
%\usepackage{amsmath,amsthm}% must be loaded before newtxmath
%% amssymb should not be loaded
%\usepackage[scaled=1.075,ncf,vvarbb]{newtxmath}% need to scale up math package
%% vvarbb selects the STIX version of blackboard bold.
```

### Logo on title page 
```tex
\usepackage{tikz}
\titlegraphic{
\begin{tikzpicture}[overlay,remember picture]
\node[right=0.2cm] at (-6.5,6.2){\includegraphics[width=2cm]{./figs/logo/logo_ngri.png} }; %% current page.30
\node[left=0.2cm] at (6.5,6.2){\includegraphics[width=2cm]{./figs/logo/logo_csir.png}};
\end{tikzpicture}
}
```



### Itemize
To change the symbols and color 
```tex
\setbeamercolor{itemize item}{fg=red, bg=white}
\setbeamercolor{itemize subitem}{fg=blue, bg=white}
\setbeamercolor{itemize subsubitem}{fg=cyan, bg=white}

\setbeamertemplate{itemize item}[square]
\setbeamertemplate{itemize subitem}[circle]
\setbeamertemplate{itemize subsubitem}[triangle]
```


### Enumitems package with the theme color
```tex
\usepackage{enumitem}
\setitemize{label=\usebeamerfont*{itemize item}%
\usebeamercolor[fg]{itemize item}
\usebeamertemplate{itemize item}}
```

### Table
* Using number of columns > 10
  ```tex
  \setcounter{MaxMatrixCols}{15}
  ```
* Reducing the spacing between coloumns

### Multicolumn with separator bar
```tex
\usepackage{multicol}
\setlength{\columnseprule}{1pt}
\def\columnseprulecolor{\color{blue}}
```
