# PhD Thesis template of City University of Hong Kong

## Table of Contents
<font size=3>

- [PhD Thesis template of City University of Hong Kong](#phd-thesis-template-of-city-university-of-hong-kong)
  - [Table of Contents](#table-of-contents)
  - [Preface](#preface)
  - [Important Notes](#important-notes)
  - [Declaration](#declaration)
  - [Prerequisites and Recommendation](#prerequisites-and-recommendation)
  - [Usage](#usage)
  - [Changes and Tips](#changes-and-tips)
  - [FAQ](#faq)
  - [License](#license)
  - [Some words](#some-words)


## Preface

The basis of this Latex thesis template was forked from **[huwan/CityU_Thesis](https://github.com/huwan/CityU_Thesis)**, which built upon the [CUED PhD thesis template](https://github.com/kks32/phd-thesis-template) from Krishna Kumar. Credit goes to Krishna Kumar, author of the CUED PhD thesis template above.

On the basis of meeting the university's requirements, this template has been **considerably adapted** to match the style of Dr. WX laboratory in department of Biomedical Science with lots of **personal preferences**.

## Important Notes

As the format/requirements of the thesis may change, please check the latest [**Guidebook for Research Degree Studies**](https://www.sgs.cityu.edu.hk/student/rpg/studentGuideBook) first. 

## Declaration
Although the thesis which was created from this template meet the requirements and passed the examination, it is **not an official template**. Use this template at your own risk.

All the figures/table in this repository are collected from the Internet, only for display use, not for commercial use. If there is any infringement, please contact to delete.

## Prerequisites and Recommendation

- **Fonts**: MingLiU/細明體 (or PMingLiU/新細明體), the .ttf file could be found in the [./Prerequisites folder/PMingLiU.ttf](./Prerequisites/). Make sure the font been installed system-wide: 1. Run the file under administrator permission or install for all users. 2. Or load the file from seting--fonts.  Details could be found in [FAQ](#FAQ))

- **Office Word** for manuscript editing. (I prefer .docx for manuscript editing with citation comments, then copy the words to .tex) 
  
- **LaTeX distribution + Editors**: Recommend **texlive + VScode**, extension of VScode: **LaTex Workshop**. 

- **PDF Reader**: **SumatraPDF** for Two-way search (external and internal view) on PDF and Tex. <br>
  
The installation and setting of VScode and SumatrPDF could refer to: [Workflow1](https://zhuanlan.zhihu.com/p/166523064), [Workflow2](https://blog.csdn.net/weixin_43356770/article/details/104035291), [SumatraPDF setting](https://zhuanlan.zhihu.com/p/95330916).

The setting file of my VScode could be found in [./Prerequisites folder/settings.json](./Prerequisites/). (Remember to change the SumatraPDF.exe path.)

Notice: the command line which works for me in SumatrPDF is: setting--items--Set up a reverse search command line.
```html
"C:\Program Files\Microsoft VS Code\Code.exe" "C:\Program Files\Microsoft VS Code\resources\app\out\cli.js" --ms-enable-electron-run-as-node -r -g "%f:%l"
```
- **Basic learning for Latex.** Some references: [一份其实很短的 LaTeX 入门文档](https://liam.page/2014/09/08/latex-introduction/), [简单粗暴LaTeX](https://github.com/wklchris/Note-by-LaTeX)
  
- **Excel/CSV to LaTex format:** Easy generation of tables in Latex format manually or from Excel or CSV files.
  - https://tableconvert.com/csv-to-latex
  - https://www.tablesgenerator.com/

- **Formula to LaTex format:** online tools to easily generate LaTex formula. [One for example](https://www.hostmath.com/)
  
- **Bibliography tools**:
  - <ins>Doi to BibTeX</ins>: Easy generation of citations in BibTeX format from digital object identifiers (DOIs). [doi2bib](https://www.doi2bib.org/)
  
  - <ins>ISBN to BibTeX for book citation:</ins> the ISBN to bib for book citation. [Converter](https://www.bibtex.com/c/isbn-to-bibtex-converter/)
  
  - <ins>PMID to BibTeX for some special cases:</ins> [Converter](https://www.bibtex.com/c/pmid-to-bibtex-converter/)

- **Ask google** for your questions and needs!

## Usage

Globally setting, such as definition of new environment , format or style, could be found in `PhDThesisPSnPDF.cls` and the layout of the title page, main matter, including of chapters were in the `Current_thesis.tex`. Take a look at the comments first before modification.

To compile, fast run through `Recipe: XeLaTex`. With bibliography, remember to use: `Recipe:xelatex->bibtex->xelatex*2` in Tex extension of VScode.

## Changes and Tips

This part covers the changes from the [huwan/CityU_Thesis](https://github.com/huwan/CityU_Thesis) to match the style of our laboratory with lots of **personal preferences**

Basis of the framework could be learned from  [huwan/CityU_Thesis](https://github.com/huwan/CityU_Thesis)

Compared the `Current_thesis.pdf` and `huwan_thesis.pdf` for details.

package: `lipsum` and `math` were used for Placeholder Text.
```latex
\usepackage{lipsum}
\usepackage[math]{blindtext}
```

Details of changes could be found in [/Changes](/Changes/)


## FAQ

1. <ins>**The font could not be found:**</ins> <br>
   Even the PMingLiU.ttf was installed and could be found in C:/WINDOWS/fonts, error still raise like:

   > 1. Font TU/PMingLiU(0)/m/n/12.045=PMingLiU at 12.045pt not loadable.
   > 2. Metric (TFM) file or installed font not found.

   [Solution link](https://tex.stackexchange.com/questions/511897/my-system-cant-find-installed-otf-and-ttf-fonts): You can add the following line to file ***C:\texlive\2021\texmf-var\fonts\conf\fonts.conf***: (where your texlive is) <br>
   ```html
   <dir>C:/Users/<YourName>/AppData/Local/Microsoft/Windows/Fonts</dir>
   ```
   Then run **`fc-cache -vf`** on windows CMD console (calling by: win+R--CMD--enter)to update the font cache.

2. <ins>To avoid ***Underfull \hbox (badness 10000)*** warning:</ins>

    use package parskip, and instead of using \newline or \\ for line breaks, or just simply use double blank lines
    ```Latex
    \usepackage{parskip}
    \setlength{\parindent}{0pt}
    ```

3. <ins>Set spacing as 1.5/2 line spacing</ins>
   discussion: https://latex.org/forum/viewtopic.php?t=28685
   Reason: the standard line skip means a factor of 1.2 (such as font height 10pt, base line skip 12pt). Multiply with \linespread, so you get `1.25*1.2 = 1.5`, so one-half.
   so, double spacing means `1.667*1.2=2`
   ```latex
   \renewcommand\baselinestretch{1.667}
   ```
4. <ins>**How is 14pt giving font size smaller than 12pt**</ins>
    
    **Solved:** Document class article only supports **10pt, 11pt, and 12pt**. The default is 10pt. Option 14pt is unknown, therefore you are getting 10pt.

    You can get larger sizes with extsizes:
    ```Latex
    \documentclass[a4paper,14pt]{extarticle}
    \usepackage{geometry}
    ```
    It supports 8pt, 9pt, 10pt, 11pt, 12pt, 14pt, 17pt and 20pt.
    Package geometry (or hyperref or some graphics drivers like pdftex.def or …) set the paper size to the output media.

5. <ins>What are the various units (**ex, em, in, pt, bp, dd, pc**) expressed in mm?</ins>
   <br>

    ![image](/Figures/uDZPg.png)<br>
    So we could take **1bp as 1pt** (Approximate)

6. <ins>How does \fontsize{}{} work?</ins> [Ref 1](https://tex.stackexchange.com/questions/148508/how-does-fontsize-work) [Ref 2](https://tex.stackexchange.com/questions/48276/latex-specify-font-point-size)
```latex
    \fontsize{size}{skip}
    # Set font size. The first parameter is the font size to switch to; 
    # The second is the \baselineskip to use. 
    # The unit of both parameters defaults to pt.
    # A rule of thumb is that the baselineskip should be 1.2 times the font size.

    # you'll need to add **\selectfont** afterwards to make it kick in.

    \fontsize{size}{skip} \selectfont
    {\fontsize{1cm}{1cm}\selectfont First test : I need to put some text here.}
    {\fontsize{1cm}{1cm}\selectfont}{\expandafter\MakeUppercase\expandafter{\english\@university} \par}
```

7. <ins>How to allow figure caption break into two pages?</ins>
tried: 
- https://tex.stackexchange.com/questions/399698/how-to-get-figure-caption-to-span-multiple-pages-without-having-to-switch-every
caption可以分段，但是图像会严格插入位置，文字不足时导致有空白
```latex
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
- https://latex.org/forum/viewtopic.php?f=5&t=2068&p=8076&hilit=afterpage#p8076
可以浮动，使得文字无空白，但是caption不能分段
```latex
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
```latex
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

## License

[CUED PhD thesis template](https://github.com/kks32/phd-thesis-template) by Krishna Kumar is licensed under the [MIT License](LICENSE).

## Some words
It's my first try to LaTex. I have heared the advantages of LaTex for a long time but was hesitate to have a try because of the fear of the grammar learning. But when I took 2-3 days for the basic learning of the LaTex and keep google searching to got the format/layout which I want during the thesis writing, the joy came with it and I grew to enjoy the process. On the day of thesis completion, I was very happy as the layout/details/content of the thesis is just what I want and that was my own unique thesis. It is hard to cover the four PhD years into a single thesis, no matter the researches, the behind failure/duty/nervousness/success, as well as the people who I spent a lot of time with. Future is unknown, but the passed four-years did change me alot.

© 2022 · Copyright© 2022 Lin QI. All rights reserved.
</font>
