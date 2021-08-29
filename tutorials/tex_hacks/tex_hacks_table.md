# Tables 

## Changing coloumn and row separation 
```tex 
\begingroup
\setlength{\tabcolsep}{10pt} % Default value: 6pt
\renewcommand{\arraystretch}{1.5} % Default value: 1
\begin{tabular}{ c c c }
First Row & -6 & -5 \\
Second Row & 4 & 10\\
Third Row & 20 & 30\\
Fourth Row & 100 & -30\\
\end{tabular}
\endgroup
```



## Typesetting many coloums with same style 
For the purpose use the coloum specifier-** *{num}{form} 
```tex
\begin{tabular}{*{3}{|l|}}
a &b &c 
\end{tabular}
```

## Long coloumns
If there is too much text in a single coloumn then opt one of the following strategy 
1. predefine the coloum-width for that coloum as
```tex
\begin{tabular}{ccp{5cm}}
a &b & Some very-very-very long text is placed here and it has to be handeled nicely
\end{tabular}
```
2. Use tabularx package. It will automatically adjust the widh according to page width 
```tex 
\usepackage{tabularx}
\begin{tabularx}{\textwidth}{|l|X|} \hline
Summary & Tabularx Description\\ \hline
Text &\blindtext \\ \hline
\end{tabularx}
```

## Multicoloumns and multirow 
Combinging many coloumns to form a single column can be done by  command 
```tex
\multicoloumn{NoOfColoumn}{ColoumnFormatting}{TextInColoumn}
```


## Colors in table
```tex
\usepackage[table]{xcolor}
\rowcolors{2}{green!20}{blue!20}
\begin{tabular}{c|c}
\rowcolor{yellow!60}
	\hline
	Title 		&Description\\ \hline
	Popular item 	&Thing thing \\
	People choice 	&That thing\\
	Company choice 	&something else \\
	Recommended one &out of world \\ \hline
\end{tabular}
```

## List in table 
It is possible to define a list in a table as following 
```tex
\begin{tabular}{|l|m{6cm}|}\hline
		Fedora Version &Editions \\ \hline
	Fedora 32 &\begin{itemize}
		\item CoreOS
		\item Silverblue
		\item IoT
	\end{itemize} \\ \hline
\end{tabular}
```


## Sideways table
```tex
\usepackage{sidewaystable}
\begin{sidewaystable}
\centering
\caption{Sideways Table}
\label{sidetable}
\begin{tabular}{ll}
	\hline
	Title 		&Description\\ \hline
	Popular item 	&Thing thing \\
	People choice 	&That thing\\
	Company choice 	&something else \\
	Recommended one &out of world \\ \hline
\end{tabular}\vspace{3mm}
\end{sidewaystable}
```


# Changing type of an entire coloumn 
