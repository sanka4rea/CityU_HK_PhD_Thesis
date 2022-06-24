# PhD Thesis template of City University of Hong Kong

# Table of Contents
<font size=3>

1. [Preface](#Preface)
2. [Important Notes](#ImportantNotes)
3. [Declaration](#Declaration)
4. [Prerequisites and Recommendation](#PrereqPrerequisitesandRecommendationuisites)
5. [Usage](#Usage)
6. [FAQ](#FAQ)


## <u>Preface</u>

The basis of this Latex thesis template was forked from **[huwan/CityU_Thesis](https://github.com/huwan/CityU_Thesis)**, which built upon the [CUED PhD thesis template](https://github.com/kks32/phd-thesis-template) from Krishna Kumar. Credit goes to Krishna Kumar, author of the CUED PhD thesis template above.

On the basis of meeting the university's requirements, this template has been **considerably adapted** to match the style of Dr. WX laboratory in department of Biomedical Science with lots of **personal preferences**.

## <u>Important Notes</u>

As the format/requirements of the thesis may change, please check the latest [**Guidebook for Research Degree Studies**](https://www.sgs.cityu.edu.hk/student/rpg/studentGuideBook) first. 

## <u>Declaration</u>
Although the thesis which was created from this template meet the requirements and passed the examination, it is **not an official template**. Use this template at your own risk.

All the figures/table in this repository are collected from the Internet, only for display use, not for commercial use. If there is any infringement, please contact to delete.

## <u>Prerequisites and Recommendation</u>

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
  - <u>Doi to BibTeX</u>: Easy generation of citations in BibTeX format from digital object identifiers (DOIs). [doi2bib](https://www.doi2bib.org/)
  
  - <u>ISBN to BibTeX for book citation:</u> the ISBN to bib for book citation. [Converter](https://www.bibtex.com/c/isbn-to-bibtex-converter/)
  
  - <u>PMID to BibTeX for some special cases:</u> [Converter](https://www.bibtex.com/c/pmid-to-bibtex-converter/)

- **Ask google** for your questions and needs!

## <u>Usage</u>

Globally setting, such as definition of new environment , format or style, could be found in `PhDThesisPSnPDF.cls` and the layout of the title page, main matter, including of chapters were in the `Current_thesis.tex`. Take a look at the comments first before modification.

To compile, fast run through `Recipe: XeLaTex`. With bibliography, remember to use: `Recipe:xelatex->bibtex->xelatex*2` in Tex extension of VScode.

## <u>Modifications and Tips</u>

This part covers the changes from the [huwan/CityU_Thesis](https://github.com/huwan/CityU_Thesis) to match the style of our laboratory with lots of **personal preferences**

Basis of the framework could be learned from  [huwan/CityU_Thesis](https://github.com/huwan/CityU_Thesis)

Compared the `Current_thesis.pdf` and `huwan_thesis.pdf` for details.

package: `lipsum` and `math` were used for Placeholder Text.
```latex
\usepackage{lipsum}
\usepackage[math]{blindtext}
```

Coming Soon!


## <u>FAQ</u>

1. <u>**The font could not be found:**</u> <br>
   Even the PMingLiU.ttf was installed and could be found in C:/WINDOWS/fonts, error still raise like:

   > 1. Font TU/PMingLiU(0)/m/n/12.045=PMingLiU at 12.045pt not loadable.
   > 2. Metric (TFM) file or installed font not found.

   [Solution link](https://tex.stackexchange.com/questions/511897/my-system-cant-find-installed-otf-and-ttf-fonts): You can add the following line to file ***C:\texlive\2021\texmf-var\fonts\conf\fonts.conf***: (where your texlive is) <br>
   ```html
   <dir>C:/Users/<YourName>/AppData/Local/Microsoft/Windows/Fonts</dir>
   ```
   Then run <u>**fc-cache -vf**</u> on windows CMD console (calling by: win+R--CMD--enter)to update the font cache.

2. <u>To avoid ***Underfull \hbox (badness 10000)*** warning:</u>

    use package parskip, and instead of using \newline or \\ for line breaks, or just simply use double blank lines
    ```Latex
    \usepackage{parskip}
    \setlength{\parindent}{0pt}
    ```

3. <u>**How is 14pt giving font size smaller than 12pt**</u>
    
    **Solved:** Document class article only supports **10pt, 11pt, and 12pt**. The default is 10pt. Option 14pt is unknown, therefore you are getting 10pt.

    You can get larger sizes with extsizes:
    ```Latex
    \documentclass[a4paper,14pt]{extarticle}
    \usepackage{geometry}
    ```
    It supports 8pt, 9pt, 10pt, 11pt, 12pt, 14pt, 17pt and 20pt.
    Package geometry (or hyperref or some graphics drivers like pdftex.def or …) set the paper size to the output media.

4. <u>What are the various units (**ex, em, in, pt, bp, dd, pc**) expressed in mm?</u>
   <br>

    ![image](/Figures/uDZPg.png)<br>
    So we could take **1bp as 1pt** (Approximate)










## License

[CUED PhD thesis template](https://github.com/kks32/phd-thesis-template) by Krishna Kumar is licensed under the [MIT License](LICENSE).

## In the end: personal feelings


</font>