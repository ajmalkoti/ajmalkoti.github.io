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





## A list of available lstset options (most useful ones) 

1. Unsorted commands
   * language= Matlab         	Defines the language
   * upquote=〈true|false〉      Print the quote as stright
   * captionpos= t              Caption position top/ bottom
   * sensitive=〈true|false〉    The keywords are case sensetive 
2. Setting up the numbering 
   * `numbers = left`
   * `numberstyle=\tiny`
   * `stepnumber=2` 
   * `numbersep=5pt`
3. Tabs and spaces
   * tabsize=2`                 Size of tab is replaced by these many space
   * `showspaces=true`,         Space will be turned into 'wide visible space' character
   * `showtabs=true`,           Tab will be turned into 'wide visible space' character
4. Frame aound the code
   * `frame= single`,           Single frame around the code. Options= none/leftline/topline/bottomline/lines/single/shadowbox 
   * `frame= trBL`,             Double frame around the code (captial letter means double frame), options= trblTRBL
   * `frameround=fttt`,         Rounded corner frame. 't' denote rounded corner. counter clockwise from right top corner
   * `framerule=2pt`            Frame thickness
   * `rulecolor=\color{red}`    Frame color
   * backgroundcolor=\color{yellow}        Color of body   
5. Emphasize on special words using special style/color
   * emph={square},        
   * emphstyle=\color{red},      Emphasis (style 1) words will be in red color 
   * emph={[2]root,base}, 
   * emphstyle={[2]\color{blue}} Emphasis (style 1) words will be in blue color
6. Strings 
   * morestring=[b]",            First way to define string using "
   * morestring=[d]’             Second way to define string using '
7. Working with Comments
   * morecomment=[l]{//},                   First way of commenting require only one argument (shown by l)
   * morecomment=[s][\color{blue}]{/*}{*/}, Second way of commenting require only two argument (shown by s)
   * morecomment=[n][\color{red}]{(*}{*)},  Second way of commenting (aliter) require only two argument (shown by n)
   * morecomment=[is]{(*}{*)}               Prefix i makes the comment invisible
8. Add/Delete/Highlight on the keywords  
   * keywords={[1]  }
   * morekeywords={[2]delta,gamma},  Add keywords to list 2. Default list is in 1.
   * deletekeywords={[2] gamma}      Remove keyword gamma from list
9. Code line break etc.
   * linewidth = \linewidth          Line width
   * xleftmargin=1pt              
   * xrightmargin=1pt
   * breaklines=true                 Break long lines
   * prebreak=
   * postbreak={...}                 Token after breaking the line
   * breakindent=20pt                Indentation after breaking the line




