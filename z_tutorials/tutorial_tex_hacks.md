# Following are some of the  shotcut to improve the tex documents

* [Hacks for lists](./tex_hacks_lists.md)
* [Hacks for tables](./tex_hacks_table.md)
* [Hacks for Tikz/PGF](./tex_tikz_examples.md)
* [Other Hacks](./tex_hacks_other.md)



Useful pacakges for latex

1. Convert table from excel to latex- [Excel2LaTeX](https://ctan.org/tex-archive/support/excel2latex?lang=en) 
2. Uploading you tex to ArXiv - [arxiv-latex-cleaner](https://pypi.org/project/arxiv-latex-cleaner/) -  
This tool allows you to easily clean the LaTeX code of your paper to submit to arXiv. From a folder containing all your code, e.g. /path/to/latex/, it creates a new folder /path/to/latex_arXiv/, that is ready to ZIP and upload to arXiv.
3. Finding difference between two latex file- difflatex
   ```sh
   $> latexdiff  InputTexFile1.tex InputTexFile2.tex > OutputTexDifferece.tex
   ```
4. Indenting the latex code- [latexindent](https://ctan.math.washington.edu/tex-archive/support/latexindent/documentation/latexindent.pdf)
5. Converting your document to docx - pandoc
   ```sh
   $> pandoc InputTexFileName.tex --bibliography=BibliographyFileName.bib -o OutPutFileName.docx
   ```
6. create booklet from pdf- [pdfbook](https://ctan.org/tex-archive/support/pdfbook2)
7. Crop the pdf - [pdfcrop](https://ctan.org/tex-archive/support/pdfcrop)
8. Check for non utf8 character in file 

The tex supported [pacakges list](https://ctan.org/tex-archive/support)



A very good list of packages to be included is in IEEE template for papers see **bare_jrnl_transmag.tex.** 



Tex editors
[TeXmacs](https://ctan.org/tex-archive/support/TeXmacs)




The lineno package has a problem due to which the paragraph next to equation has to be seaprated by a 
blank line otherwise the line number for that paragraph will not appear. 
It can be solved by using following code in preamble. 
The solution is copied from Tex-Stackexchange. 

```tex
\newcommand*\patchAmsMathEnvironmentForLineno[1]{
  \expandafter\let\csname old#1\expandafter\endcsname\csname #1\endcsname
  \expandafter\let\csname oldend#1\expandafter\endcsname\csname end#1\endcsname
  \renewenvironment{#1}
  {\linenomath\csname old#1\endcsname}
  {\csname oldend#1\endcsname\endlinenomath}}
  \newcommand*\patchBothAmsMathEnvironmentsForLineno[1]{
  \patchAmsMathEnvironmentForLineno{#1}
  \patchAmsMathEnvironmentForLineno{#1*}}
  \AtBeginDocument{
  \patchBothAmsMathEnvironmentsForLineno{equation}
  \patchBothAmsMathEnvironmentsForLineno{align}
  \patchBothAmsMathEnvironmentsForLineno{flalign}
  \patchBothAmsMathEnvironmentsForLineno{alignat}
  \patchBothAmsMathEnvironmentsForLineno{gather}
  \patchBothAmsMathEnvironmentsForLineno{multline}
}
```
