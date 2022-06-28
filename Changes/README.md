## Changes and Tips

This part covers the changes from the [huwan/CityU_Thesis](https://github.com/huwan/CityU_Thesis) to match the style of our laboratory with lots of **personal preferences**

Basis of the framework could be learned from  [huwan/CityU_Thesis](https://github.com/huwan/CityU_Thesis)

Compared the `Current_thesis.pdf` and `huwan_thesis.pdf` for details.

package: `lipsum` and `math` were used for Placeholder Text.
```latex
\usepackage{lipsum}
\usepackage[math]{blindtext}
```

### 1. Title page
It is needed to modify the margin size with very long/short title.
Configurations start from `line 636 of section Title Page in PhDThesisPSnPDF.cls`.
`\vspace{xxbp}` was used for the margin setting. More details about `ex, em, in, pt, bp, dd, pc` could be found in [FAQ](#faq).

### 2. Adding Copyright Declaration
- Set the right environment as `PhDThesisPSnPDF.cls` first
- Proper usage of `\vspace*{\fill}`. `\textcopyright` for circle c 
- details on [rights.tex](../Front/rights.tex)

### 3. Unifying the font size, left asign of the Front sections
Including: ABSTRACT, ACKNOWLEDGEMENTS, LIST OF PUBLICATIONS, LIST OF ABBREVIATIONS, LIST OF FIGURES, LIST OF TABLES, References
Set name of each section using command like: `\newcommand{\@rightstitle}{COPY RIGHT}`
Set to: uppercase, left asign, unify the font size

### 4. Adding header for the Front sections
Setting in each environment in the `PhDThesisPSnPDF.cls`
```latex
\pagestyle{fancy} % \thispagestyle{plain}
\fancyhf{}
\fancyhead[L]{\ifthenelse{\isodd{\value{page}}}{}{\@abstracttitle}}
\fancyhead[R]{\ifthenelse{\isodd{\value{page}}}{\@abstracttitle}{}} 
\fancyfoot[C]{\thepage}
```
Notice:
- `\thispagestyle{plain}` should be change to `\pagestyle{fancy}`, otherwise the header will be set to `table of content` automatically.
- **`\fancyhead[LE,RO]{ABSTRACT}` not work**, seem `E` for even page and `O` for odd page not work for alphabet page numbering. Using `\isodd{\value{page}}` to check the odd/even page.
- Do not forget the page foot.

### 5. Fancyhdr setting not work for the last page in an environment 
where the header was not correctly shown.
Solution: just add `\clearpage` before the end of the environment in each .tex
[Reference 1](https://tex.stackexchange.com/questions/601020/setting-fancy-headers-and-footers-in-an-environment)
<img src="/Figures/fancyhdr1.png" width= 400 alt="fancyhdr1">
[Reference 2](https://tex.stackexchange.com/questions/629292/fancyhdr-not-showing-up-on-all-pages-of-appendix)
<img src="/Figures/fancyhdr2.png" width= 400>

### 6. More refined examples in publications
underline with the dagger
```latex
% Add underlines in publications
\usepackage{ulem}
\usepackage{amsmath}
\uline{\textbf{Paper Published ($^\dag{}$co-first author)}} % add dag
\begin{enumerate}[leftmargin=*]
\item \uline{\textbf{Yuzuriha Inori}}, Egoist, Chelly, Supercell, Ryo$^*$. Departures~Anata ni Okuru Ai no Uta~. \textit{Guilty Crown}. 2011 ; Vol. 1. \textbf{(IF=12.9)}

\item Kana Nishino$^\dag{}$, \uline{\textbf{Kanayan$^\dag{}$}}, Tookutemo ft. WISE, Always, Motto.., Kiminokoewo feat.Verbal(m-flo), SME Records$^*$, Sony Music Artists$^*$. Best friend: the first song of Kana I heared at highschool. \textit{First be Heared as BGM of a DNF video}. 2010 ; Vol. 2. \textbf{(IF=24)}
\end{enumerate}
```
![image](../Figures/publication.png)

### 7. Long table for `list of abbreviations` and Appendix
Here, I used long table for the presentation of `list of abbreviations`.
```latex
% long tables for multiple pages in appendix
\usepackage{longtable}
% \usepackage{caption}
% The longtable documentation does give an example of how to produce a full width table:
\setlength\LTleft{0pt}
\setlength\LTright{0pt}
\begin{longtable}{@{\extracolsep{\fill}}|c|c|c|@{}}
% 竖线边界由 |c|c|c| 或者\cline 决定，没有|||，则没有border
\toprule  % 粗上线
\endhead % add title for each page
\bottomrule
\end{longtable}
```
Details in [Appendix.tex](../Chapters/appendix1.tex)
References:
- [Table without borders](https://tex.stackexchange.com/questions/4400/how-can-one-make-a-table-without-borders)
- [Manually set the length of space/blank: \hspace{4em}](https://juejin.cn/post/6933209801585328142)

### 8. Change the font size of Chapter
```latex
\chapternumberfont{\fontsize{20pt}{20pt}\selectfont}
\chaptertitlefont{\fontsize{18pt}{18pt}\selectfont}
```

### 9. Make sectionmark/short-section for header
Normally, `\sectionmark{XXXXXXXX}` will shown as header. However, pages which begin with a new section shown wrong header (so it seems that the `\sectionmark` is not working in this case)
**Solution:**
```latex
\section[The example of setting headers with longlonglonglong title]{The example of setting headers with longlonglonglong title %
  \sectionmark{The example set to short}}
\sectionmark{The example set to short}
```

### 10. Set figure caption in bold:
```latex
\usepackage[singlelinecheck=false, labelfont=bf]{caption}
```
**Set figure caption starter:**
```latex
\RequirePackage[labelsep=space,tableposition=top]{caption}
\renewcommand{\figurename}{Figure}  % Figure 1.1
\renewcommand{\figurename}{Fig}  % Fig 1.1
```

### 11. Set title of table above:
Put caption before centering or others.
```latex
\begin{table}[htbp!]
\caption[Clinicopathologic characteristics]{Clinicopathologic characteristics of patients}
\centering
\includegraphics[width=1\textwidth]{Table 1.1}
\end{table}
```

### 12. Build own page style if needed
Default pagestyle: plain, fancy.
Build own style:
```latex
\fancypagestyle{definemyself}{
	\renewcommand{\headrulewidth}{0.5pt}
  \renewcommand{\footrulewidth}{0pt}
  \addtolength{\headheight}{0.5pt}
  \fancyhead[LE,RO]{\leftmark}
  \fancyhead[RE,LO]{WHAT I WANT TO SEE}}
}
\pagestyle{definemyself}
```

### 13. Figure place
There are two ways to put figures into pages.

**1. \begin{figure} method could put the figure into any place if the space is enough on the current page.**
```latex
\begin{figure}[htbp!]
  \centering
  \includegraphics[width=1\textwidth]{Figure 1.3}
  \caption[But figure 1.2 did not have the enough space to put on the current pages]{\textbf{the begin{figure} method could put into any place if the space is enough on the current page.}}
  \end{figure}
```
**However it will take a whole new page if there are no enough space on the current page.** <ins>As shown on Figure 1.2.</ins>

**2. the afterpage{} methods always put the figure at the top of new page, and could automatically divide captions between pages by adding `\captionsetup{parbox=none}`.**
```latex
\usepackage{afterpage}
\afterpage{
    \centering
    \includegraphics[width=1\textwidth]{Figure 1.1}
    \captionsetup{parbox=none} % don't put this caption into a \parbox
    \captionof{figure}[Examples of sth.]{\textbf{Examples of sth.} \textbf{(a)} A H{\&}E-stained whole-slide image}
    % \vspace{\intextsep} % optional
}
```
**The place of figure will be arbitrary but will not be out of the current section**
```latex
%如果希望避免浮动体跨过 \section，可以使用 placeins 宏包。
\usepackage[section]{placeins}
```

### 14. Take screenshot of tables as Table
For some complex table, I just take the screenshot of it as the representation of it. 
For example, Table 1 from picture as shown in Table 1.1
```latex
\begin{table}[htbp!]
  \caption[The name which will be shown on TOC]{The Figure names and figure legends. \textbf{(a)} ahahda dqwe ead asd. \textbf{(b-d)} ahahda dqwe ead asd.}
  \centering
  \includegraphics[width=1\textwidth]{Table 1.1} % sthe table figure name 
  % \label{tab1.1} not used here
\end{table}
```

### 15. Bibliography style
To use the conventional natbib style referencing
Bibliography style previews: https://www.overleaf.com/learn/latex/Bibtex_bibliography_styles
```latex
% \bibliographystyle{apalike} % used for duplicate check, sorted by author name
% \bibliographystyle{ieeetran} % IEEEtran
\bibliographystyle{unsrt} % sorted by order of appearance, [1] [2] [3]
% \bibliographystyle{plainnat} % use this to have URLs listed in References
```

### 16. Add spaces between paragraphs
```latex
\usepackage{parskip}
\setlength{\parskip}{1em} % 0.5em
% Ragged bottom avoids extra whitespaces between paragraphs
%\raggedbottom
% To remove the excess top spacing for enumeration, list and description
%\usepackage{enumitem}
%\setlist[enumerate,itemize,description]{topsep=0em}
```

### 17. Tools
- **Excel/CSV to LaTex format:** Easy generation of tables in Latex format manually or from Excel or CSV files.
  - https://tableconvert.com/csv-to-latex
  - https://www.tablesgenerator.com/

- **Formula to LaTex format:** online tools to easily generate LaTex formula. [One for example](https://www.hostmath.com/)
  
- **Bibliography tools**:
  - <ins>Doi to BibTeX</ins>: Easy generation of citations in BibTeX format from digital object identifiers (DOIs). [doi2bib](https://www.doi2bib.org/)
  
  - <ins>ISBN to BibTeX for book citation:</ins> the ISBN to bib for book citation. [Converter](https://www.bibtex.com/c/isbn-to-bibtex-converter/)
  
  - <ins>PMID to BibTeX for some special cases:</ins> [Converter](https://www.bibtex.com/c/pmid-to-bibtex-converter/)