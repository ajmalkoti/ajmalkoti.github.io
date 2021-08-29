# lists
 **Remove the extra space between the items and para etc.** 
Using intrinsic commands: It will not adjust the space between para and list
``` tex
\begin{itemize} \itemsep0.75pt
    \item something A
    \item something B
    \item something C    
\end{itemize}
```

Using enumitem package

```tex
\usepackage{enumitem}
\setlist{nosep}
``` 
or
```tex
\begin{itemize}[noitemsep]
    \item something A
    \item something B
    \item something C
\end{itemize}
```

**If you want to separate the item in you list **
```tex
\begin[itemize]
  \item[type A]
  \item something
  \item something
  \item[type B]
  \item something
  \item something
\end[itemize]
```

**Changing the list appearance**
```tex
\begin{enumerate}[label=\Alph*.]
    \item something A
    \item something B
    \item something C
\end{enumerate}
```

Options for *Enumerated* list-	\alph*, \Alph*,  \arabic*,  \roman*, \Roman*

Options for *Itemized* list- $\bullet$,  $\cdot$, $\diamond$, $\ast$, $\circ$, $-$



**Change default bhaviour of the list by adding followin in preamble of tex code
``` tex
\renewcommand{\labelitemi}{$\ast$}
\renewcommand{\labelitemii}{$\diamond$}
\renewcommand{\labelitemiii}{$\bullet$}
\renewcommand{\labelitemiv}{$-$}
```
