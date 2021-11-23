# Highlighting the code using the *lstlisting* package.

## Including your code in latex 
```tex
\usepackage{lstlisting}
\lstset{language=Matlab}

\begin{document}
% first way: typing your code   
\begin{lstlisting}
  type your code here
\end{lstlisting}

% second way: including the file only.
\lstinputlisting{mycode.m}
\end{document}


% Inline code
\lstinline{ your code comes here }
```

## Special argument to the listing environment
* To include it as a float with caption and label
```tex
\begin{lstlisting}[float,caption=My first code, label=firstcode]
  your code is here
\end{lstlisting}
```

* To include it with title only (no numbering)
```tex
\begin{lstlisting}[float,title=My first code]
  your code is here
\end{lstlisting}
```


* To include only specific  set of line use following  
```tex 
\lstinputlisting[first=5,last=20]{mycode.m}
```
* If the code is shown in two parts then we can have a continuous numbering by assigning some unique name.
```tex
begin{lstlisting}[name=xcode]
  your xcode part1 here 
\end{lstlisting}

And we continue the listing:
\begin{lstlisting}[name=xcode]
  your xcode part2 here
\end{lstlisting}
```



## General command set 
```tex
\usepackage{listings}
\usepackage{xcolor}

\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

\lstdefinestyle{mystyle}{
    backgroundcolor=\color{backcolour},   
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,         
    breaklines=true,                 
    captionpos=b,                    
    keepspaces=true,                 
    numbers=left,                    
    numbersep=5pt,                  
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=2
}

\lstset{style=mystyle}
```
  




## A list of all available lstset options

* language= Matlab


* \lstdefinestyle{options}  % number appear on left side
* numbers = left            
* numberstyle=\tiny,
* stepnumber=2, 
* numbersep=5pt


* tabsize=2              % size of tab is replaced by these many space
* showspaces=true,       % space will be turned into 'wide visible space' character
* showtabs=true,         % tab will be turned into 'wide visible space' character


* frame= single    % Single frame around the code, options= none/leftline/topline/bottomline/lines/single/shadowbox 
* frame= trBL      % Single frame around the code, options= trblTRBL, captial letter means double frame
* frameround=fttt  % rounded frame corner. t denote rounded corner. counter clockwise from right top corner
* framerule=2pt    % frame thickness
* rulecolor=\color{red}
* backgroundcolor=\color{yellow}

Emphasize on special words using special style/color
* emph={square}, emphstyle=\color{red},
* emph={[2]root,base},emphstyle={[2]\color{blue}}

\lstdefinelanguage{name}{options}   
* keywords=
* morekeywords={[2]delta,gamma},    % add keywords to list 2. Default list is in 1.
* deletekeywords={[2] gamma}        % remove keyword gamma from list


* morecomment=[l]{//},          %first way of commenting require only one argument (shown by l)
* morecomment=[s][\color{blue}]{/*}{*/},     %second way of commenting require only two argument (shown by s)
* morecomment=[n][\color{red}]{(*}{*)},      %second way of commenting (aliter) require only two argument (shown by n)
* morecomment=[is]{(*}{*)}                   % prefix i makes the comment invisible


* morestring=[b]",              % first way to define string using "
* morestring=[d]’               % second way to define string using '

* upquote=〈true|false〉        % print the quote as stright

* captionpos= t    % caption position top/ bottom

* linewidth = \linewidth  % line width
* xleftmargin=1pt
* xrightmargin=1pt
* breaklines=true      % break long lines
* prebreak=
* postbreak={...}     % token after breaking the line
* breakindent=20pt    % indentation after breaking the line

* sensitive=〈true|false〉  % the keywords are case sensetive 


