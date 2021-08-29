## Controlling breaking   of a word and inline equations.

* For inline equations, place \allowbreak command after the place where you want inline equation to break.
* For a word, The \hyphenation command declares allowed hyphenation points, where words is a list of words, separated by spaces, in which each hyphenation point is indicated by a - character, e.g. \hyphenation{man-u-script man-u-stripts ap-pen-dix}



## Table of content 

```tex
\usepackage{tocloft}
\setlength\ctfbeforesecskip{2pt}
\setlength\cftaftertoctitleskip{30pt}
```

## Hyperreference 
```tex
\PassOptionsToPackage{hyphens}{url}   % to break long url
\usepackage{hyperref}
\hypersetup{ pdfborder = {0 0 0}}     % to remove box around links
```

## Mofifying heading 
**Changing color and size**
```tex
\usepackage{titlesec}
\titleformat*{\section}{\Huge\bfseries\color{darkblue}}
\titleformat*{\subsection}{\huge\bfseries\color{darkblue}}
\titleformat*{\subsubsection}{\Large\bfseries\color{darkblue}}
```

**Changing the text appearnace**
```tex
\renewcommand{\thesection}{\arabic{section}}
\usepackage{titlesec}
\titleformat{\section}
{\normalfont\Large\bfseries}{Reviewer~\thesection}{1em}{}
```

# Page Style 
```
\pagestyle{fancy} %for header to be on each page
\fancyhead[L]{} %keep left header blank
\fancyhead[C]{} %keep centre header blank
\fancyhead[R]{\leftmark} %add the section/chapter to the header right
\fancyfoot[L]{Static Content} %add static test to the left footer
\fancyfoot[C]{} %keep centre footer blank
\fancyfoot[R]{\thepage} %add the page number to the right footer
\setlength\voffset{-0.25in} %space between page border and header (1in + space)
\setlength\headheight{12pt} %height of the actual header.
\setlength\headsep{25pt} %separation between header and text.
\renewcommand{\headrulewidth}{2pt} % add header horizontal line
\renewcommand{\footrulewidth}{1pt} % add footer horizontal line
```


## Adding Watermark 
```tex
\usepackage{draftwatermark} 
\SetWatermarkText{\color{red}Classified} %add watermark text 
\SetWatermarkScale{4} %specify the size of the text
```


## Question Answer with section numbering
If you want the question which preceeds by the section/subsection number then newtheorem environment can be use as following
```tex
\newtheorem{que}{Que}[section]
\newtheorem{ans}{Ans}[section]

\begin{que}
  place your question here. 
\end{que}
\begin{ans}
  Place your answer here
\end{ans}
```

