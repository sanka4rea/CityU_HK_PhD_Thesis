### Problem 1:

There is a error:*(even the PMingLiU.ttf was installed and could be found in C:/WINDOWS/fonts:)
Font TU/PMingLiU(0)/m/n/12.045=PMingLiU at 12.045pt **not loadable: Metric (TFM) file or installed font not found***.

**Solved**
reference: https://tex.stackexchange.com/questions/511897/my-system-cant-find-installed-otf-and-ttf-fonts

You can add the following line to file ***C:\texlive\2021\texmf-var\fonts\conf\fonts.conf***:

    <dir>C:/Users/<YourName>/AppData/Local/Microsoft/Windows/Fonts</dir>

Then run <u>**fc-cache -vf**</u> to update the font cache.

Seems like the font was only local installed. 

So when we install the PMingLiU.ttf file, I suppose we should install it by right-clik with 'install for all users'

### Problem 2:

to avoid ***Underfull \hbox (badness 10000)*** warning,

use package parskip, and instead of using \newline or \\ for line breaks, or just simply use double blank

    \usepackage{parskip}
    \setlength{\parindent}{0pt}

### Problem 3:

***? How is 14pt giving font size smaller than 12pt***
    
**Solved:** Document class article only supports **10pt, 11pt, and 12pt**. The default is 10pt. Option 14pt is unknown, therefore you are getting 10pt.

You can get larger sizes with extsizes:

    \documentclass[a4paper,14pt]{extarticle}
    \usepackage{geometry}
It supports 8pt, 9pt, 10pt, 11pt, 12pt, 14pt, 17pt and 20pt.
Package geometry (or hyperref or some graphics drivers like pdftex.def or …) set the paper size to the output media.

### Problem 4:

How does \fontsize{}{} work? [Ref 1](https://tex.stackexchange.com/questions/148508/how-does-fontsize-work) [Ref 2](https://tex.stackexchange.com/questions/48276/latex-specify-font-point-size)

    \fontsize{size}{skip}
    # Set font size. The first parameter is the font size to switch to; 
    # The second is the \baselineskip to use. 
    # The unit of both parameters defaults to pt.
    # A rule of thumb is that the baselineskip should be 1.2 times the font size.
you'll need to add **\selectfont** afterwards to make it kick in.

    \fontsize{size}{skip} \selectfont
    {\fontsize{1cm}{1cm}\selectfont First test : I need to put some text here.}
    {\fontsize{1cm}{1cm}\selectfont}{\expandafter\MakeUppercase\expandafter{\english\@university} \par}

### Problem 5:
What are the various units (**ex, em, in, pt, bp, dd, pc**) expressed in mm?

![image](https://i.stack.imgur.com/uDZPg.png)</br>
So we could take **1bp to 1pt**

### Problem 6:
and: {\\&} or \$\wedge$


### Problem 7:
How to allow caption break into two pages?

tried: 
1. https://tex.stackexchange.com/questions/399698/how-to-get-figure-caption-to-span-multiple-pages-without-having-to-switch-every
caption可以分段，但是图像会严格插入位置，文字不足时导致有空白
```
\usepackage[singlelinecheck=false]{caption} % font={small,sf}, 
\usepackage{lipsum}
\begin{centering}
\sffamily
    \rule{0.85\textwidth}{0.85\textheight}
\captionsetup{parbox=none}% don't put this caption into a \parbox
\captionof{figure}[short caption]{\lipsum[1-4]}
    \label{figure}
\end{centering} 
```
2. https://latex.org/forum/viewtopic.php?f=5&t=2068&p=8076&hilit=afterpage#p8076
可以浮动，使得文字无空白，但是caption不能分段
```
\usepackage{afterpage}
\usepackage{nonfloat}
\usepackage{lipsum}
\begin{document}
\lipsum[1]
\afterpage{
  \centering
  \rule{0.85\textwidth}{0.85\textheight}
  \figcaption[Short caption text for the list of figures]{\lipsum[2-3]}
  \label{fig:f1}
  \vspace{\intextsep}
}
\lipsum[4-8]
```
**Solved：but the place of usepackage may affect the create of list of figures**
```
\usepackage[singlelinecheck=false]{caption}
\usepackage{afterpage}
\afterpage{
  \centering
  \includegraphics[width=1\textwidth]{Figure 1}
  \captionsetup{parbox=none}% don't put this caption into a \parbox
  \captionof{figure}[short title]{Full description} % figure means \figure{}
  \label{fig:f1}
  % \vspace{\intextsep}
}
```
