%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                            %%
%% Class ``PhD Thesis PSnPDF''                                                %%
%%                                                                            %%
%% A PhD thesis LaTeX template for Cambridge University Engineering Department%%
%%                                                                            %%
%% Version: v2.3.1                                                            %%
%% Authors: Krishna Kumar                                                     %%
%% License: MIT License (c) 2016 Krishna Kumar                                %%
%% GitHub Repo: https://github.com/kks32/phd-thesis-template/                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ************************** Class Identification ******************************
\newcommand\fileversion{2.3.1}
\newcommand\filedate{2016/04/23}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{PhDThesisPSnPDF}[\filedate\space A PhD thesis class file
 by Krishna Kumar (v\fileversion)]
\typeout{https://github.com/kks32/phd-thesis-template/}


% ******************************************************************************
% **************************** Class Definition ********************************
% ******************************************************************************

% *********************** Define a Print/Online Version ************************
\newif\if@print\@printfalse
\DeclareOption{print}{\@printtrue}

% ****************************** Define index **********************************
\newif\ifPHD@index\PHD@indexfalse
\DeclareOption{index}{\PHD@indextrue}

% ******************************* Font Option **********************************
\newif\ifsetFont\setFontfalse                 % Font is not set

\newif\ifPHD@times\PHD@timesfalse             % Times with Math Support
\DeclareOption{times}{
  \ifsetFont
    \ClassWarning{PhDThesisPSnPDF}{Font selection conflict: A font package was
      already specified. Please check the document class options in case you
      have defined two fonts.}
  \else
    \PHD@timestrue
    \setFonttrue
  \fi
}

\newif\ifPHD@fourier\PHD@fourierfalse         % Fourier with Math Support
\DeclareOption{fourier}{
  \ifsetFont
    \ClassWarning{PhDThesisPSnPDF}{Font selection conflict: A font package was
      aleady specified. Please check the document class options in case you
      have defined two fonts.}
  \else
    \PHD@fouriertrue
    \setFonttrue
  \fi
}

\newif\ifsetCustomFont\setCustomFontfalse     % Custom Font with Math Support
\DeclareOption{customfont}{
  \ifsetFont
    \ClassWarning{PhDThesisPSnPDF}{Font selection conflict: A font package was
      aleady specified. Please check the document class options in case you
      have defined two fonts.}
  \else
    \setCustomFonttrue
    \setFonttrue
  \fi
}

% ******************************* Bibliography *********************************
\newif\ifsetBib\setBibfalse                   % Custom Bibliography = true/false
\newif\ifsetBiBLaTeX\setBiBLaTeXfalse         % BiBLaTeX = True / False

\newif\ifPHD@biblatex\PHD@biblatexfalse       % BiBLaTeX
\DeclareOption{biblatex}{
  \ifsetBib
    \ClassWarning{PhDThesisPSnPDF}{Bibliography selection conflict: A
      bibliography style aleady specified. Please check the document class
      options in case you have defined two bibliography styles.}
  \else
    \PHD@biblatextrue
  \fi
}

\newif\ifPHD@authoryear\PHD@authoryearfalse   % Author-Year citation
\DeclareOption{authoryear}{
  \ifsetBib
    \ClassWarning{PhDThesisPSnPDF}{Bibliography selection conflict: A
      bibliography style aleady specified. Please check the document class
      options in case you have defined two bibliography styles.}
  \else
    \PHD@authoryeartrue
    \setBibtrue
  \fi
}

\newif\ifPHD@numbered\PHD@numberedfalse       % Numbered citiation
\DeclareOption{numbered}{
  \ifsetBib
    \ClassWarning{PhDThesisPSnPDF}{Bibliography selection conflict: A
      bibliography style aleady specified. Please check the document class
      options in case you have defined two bibliography styles.}
  \else
    \PHD@numberedtrue
    \setBibtrue
  \fi
}

\newif\ifuseCustomBib\useCustomBibfalse     % Custom Bibliography
\DeclareOption{custombib}{
  \ifsetBib
    \ClassWarning{PhDThesisPSnPDF}{Bibliography selection conflict: A
      bibliography style aleady specified. Please check the document class
      options in case you have defined two bibliography styles.}
  \else
    \ifPHD@biblatex
        \ClassWarning{PhDThesisPSnPDF}{Bibliography selection conflict: A
          bibliography style aleady specified. Please check the document class
          options in case you have defined two bibliography styles.}
    \else
      \useCustomBibtrue
      \setBibtrue
    \fi
  \fi
}

% ************************* Header / Footer Styling ****************************
\newif\ifPHD@textJustify\PHD@textJustifytrue % Set Justification true
\DeclareOption{flushleft}{\PHD@textJustifyfalse}


% ************************* Header / Footer Styling ****************************
\newif\ifPHD@pageStyleI\PHD@pageStyleIfalse % Set Page StyleI
\DeclareOption{PageStyleI}{\PHD@pageStyleItrue}

\newif\ifPHD@pageStyleII\PHD@pageStyleIIfalse % Set Page StyleII
\DeclareOption{PageStyleII}{\PHD@pageStyleIItrue}

\newif\ifPHD@pageStyleIII\PHD@pageStyleIIIfalse % Set Page StyleIII
\DeclareOption{PageStyleIII}{\PHD@pageStyleIIItrue}


% ***************************** Custom Margins  ********************************
\newif\ifsetCustomMargin\setCustomMarginfalse % Set Custom Margin
\newif\ifsetMargin\setMarginfalse % Set Custom Margin
\DeclareOption{custommargin}{\setCustomMargintrue}

% *************************** Pre-defined Options ******************************
% Font Size
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{book}}%
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{book}}%
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{book}}%
% \DeclareOption{14pt}{\PassOptionsToClass{14pt}{extarticle}}% doesnot work
% Page Size
\newcommand\PHD@papersize{a4paper} % Set Default as a4paper

\DeclareOption{a4paper}{\renewcommand\PHD@papersize{a4paper}}
\DeclareOption{a5paper}{\renewcommand\PHD@papersize{a5paper}}
\DeclareOption{letterpaper}{\renewcommand\PHD@papersize{letterpaper}}

\PassOptionsToClass{\PHD@papersize}{book}%

% Column layout
\newif\if@oneside\@onesidefalse
\DeclareOption{oneside}{\PassOptionsToClass{\CurrentOption}{book}\@onesidetrue}%
\DeclareOption{twoside}{\PassOptionsToClass{\CurrentOption}{book}}%

% Generates Warning for unknown options
\DeclareOption*{
  \ClassWarning{PhDThesisPSnPDF}{Unknown or non-standard option
'\CurrentOption'. I'll see if I can load it from the book class. If you get a
warning unused global option(s): `\CurrentOption` then the option is not
supported!}
  \PassOptionsToClass{\CurrentOption}{book}
}

% Process options and load class
\ProcessOptions\relax%
\LoadClass{book}%

% ******************************************************************************
% ******************************** Packages ************************************
% ******************************************************************************
% ************************** Layout and Formatting *****************************

\RequirePackage{lscape}   % Supports Landscape Layout
\RequirePackage{setspace} % Define line spacing in paragraph
\RequirePackage{calc}     % calculate vertical spacing

% ************************* Conditional Statements *****************************
\RequirePackage{ifthen}   % Conditional statements
\RequirePackage{ifpdf}    % Check for pdfLaTeX
\RequirePackage{ifxetex}  % XeLaTeX

% ********* Information on Qualifying Panel and Examination Panel **************
\RequirePackage{pdfpages} % insert PDF document
\RequirePackage{etoolbox}

% *********************** Table of Contents & Appendices ***********************
% add Bibliography, List of figures and tables to contents
\RequirePackage[nottoc]{tocbibind}
% Add appendices
\RequirePackage[title,titletoc]{appendix}

% set name of section 
\renewcommand{\contentsname}{TABLE OF CONTENTS}
\renewcommand{\listfigurename}{LIST OF FIGURES}
\renewcommand{\listtablename}{LIST OF TABLES}

% Hides Contents appearing from TOC, but adds it to bookmarks
\let\temptableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
  \cleardoublepage
  \pdfbookmark[0]{\contentsname}{Contents}
  \temptableofcontents
}

% *************************** Graphics and Figures *****************************
%\RequirePackage[usenames, dvipsnames]{color}
\RequirePackage{graphicx}

% ******************************* Bibliography *********************************
\ifPHD@authoryear
  \ifPHD@biblatex
    \RequirePackage[backend=biber, style=authoryear, citestyle=alphabetic,
      sorting=nty, natbib=true]{biblatex}
    \setBiBLaTeXtrue
  \else
    \RequirePackage[round, sort, numbers, authoryear]{natbib} %author year
  \fi
\else
  \ifPHD@numbered
    \ifPHD@biblatex
      \RequirePackage[backend=biber, style=numeric-comp,
        citestyle=numeric, sorting=none, natbib=true]{biblatex}
      \setBiBLaTeXtrue
    \else
      \RequirePackage[numbers,compress]{natbib} % numbered citation
    \fi
  \else
    \ifuseCustomBib
       \AtBeginDocument{
          \@ifpackageloaded{natbib}{}{
            \@ifpackageloaded{biblatex}{}{
              \ClassWarning{PhDThesisPSnPDF}{%
                You chose custom bibliography, but no corresponding package
                (biblatex/natbib) has been loaded. Please load the
                appropriate bibliography package in the preamble.}
            }
          }
        }
    \else                                            % set default to numbered
      \ifPHD@biblatex
        \RequirePackage[backend=biber, style=numeric-comp,
          citestyle=numeric, sorting=none, natbib=true]{biblatex}
        \setBiBLaTeXfalse
      \else
        \RequirePackage[numbers,compress]{natbib}
      \fi % default
      \setBibfalse
    \fi % custombib
  \fi % numbered
\fi % author year

\ifsetBib
\else
\ClassWarning{PhDThesisPSnPDF}{No bibliography style was specified.
  Default numbered style is used. If you would like to use a
  different style, use `authoryear' or `numbered' in the options in
  documentclass or use `custombib` and define the natbib package or
  biblatex package with required style in the Preamble.tex file}
\fi

% ********************************** Fonts **********************************
\RequirePackage{amsmath}
\RequirePackage{fontspec}
\RequirePackage[]{unicode-math}
% Chinese support
% \RequirePackage{xeCJK}
% \setCJKmainfont{PMingLiU} %MingLiU
\newfontfamily\mingliu{PMingLiU}
\newcommand\chinese[1]{{\mingliu #1}}

\newfontfamily\timesnewroman{Times New Roman} % Front cover/Title page
\newcommand\english[1]{{\timesnewroman #1}}

\setmainfont{Times New Roman}

\RequirePackage{textcomp}
% Font Selection
\ifPHD@times
  \setFonttrue
  \message{PhDThesisPSnPDF: Using Times Roman font}
\else
  \ifPHD@fourier
    \RequirePackage{fourier} % Fourier
    \setFonttrue
    \message{PhDThesisPSnPDF: Using Fourier font}
  \else
    \ifsetCustomFont
      \setFonttrue
      \message{PhDThesisPSnPDF: Using custom font}
    \else
      \setFontfalse
      \message{PhDThesisPSnPDF: No font is set}
    \fi % custom font
  \fi % Fourier font
\fi % Times font

% If Font is not set throw a warning.
\ifsetFont
\else
  \ClassWarning{PhDThesisPSnPDF}{Using default font Latin Modern. If you
    would like to use other pre-defined fonts use `times' (The Cambridge
    University PhD thesis guidelines recommend using Times font)  or `fourier'
    or load a custom font in the preamble.tex file by specifying `customfont'
    in the class options}
  \RequirePackage{lmodern}
\fi

% Don't break enumeration (etc.) across pages in an ugly manner
\clubpenalty=10000
\widowpenalty=10000

%******************************* Print / Online ********************************
% Defines a print / online version to define page-layout and hyperrefering

% Moved below other usepackage definitions to fix PDFLaTeX footnote warning
% Based on the suggestion by John Plaice

\RequirePackage[unicode=true]{hyperref}
\hypersetup{
  final=true,
  plainpages=false,
  pdfstartview=FitV,
  pdftoolbar=true,
  pdfmenubar=true,
  bookmarksopen=true,
  bookmarksnumbered=true,
  breaklinks=true,
  linktocpage,
  colorlinks=true,
  linkcolor=black,
  urlcolor=black,
  citecolor=black,
  anchorcolor=black
}

  % For Print version
  \ifsetCustomMargin
  % Margin to be define in preamble using geometry package
  \else
  \if@print
      \RequirePackage[paper=\PHD@papersize,nomarginpar,bindingoffset=14.6mm,
        tmargin=38mm,bmargin=38mm,lmargin=25.4mm,rmargin=25.4mm]{geometry}
  \else
      % No Margin staggering on Odd and Even side
      % \RequirePackage[showframe,paper=\PHD@papersize,nomarginpar,
      \RequirePackage[paper=\PHD@papersize,nomarginpar,
        tmargin=38mm,bmargin=38mm,lmargin=32.7mm,rmargin=32.7mm]{geometry}
    \fi
\fi

% ************************ URL Package and Definition **************************
\RequirePackage{url}
% Redefining urlstyle to use smaller fontsize in References with URLs
\newcommand{\url@leostyle}{%
 \@ifundefined{selectfont}{\renewcommand{\UrlFont}{\sffamily}}
 {\renewcommand{\UrlFont}{\normalsize}}}
\urlstyle{leo}

% ******************************************************************************
% **************************** Pre-defined Settings ****************************
% ******************************************************************************

% *************************** Setting PDF Meta-Data ****************************
% \ifpdf
\AtBeginDocument{
  \hypersetup{
    pdftitle = {\@title},
    pdfauthor = {\@author},
    pdfsubject={\@subject},
    pdfkeywords={\@keywords}
  }
}
% \fi

% ******************************** Line Spacing ********************************
% Set spacing as 1.5 line spacing for the PhD Thesis
% In practice, fortunately, nobody knows really what “one-and-a-half spaced
% type” means exactly (in terms of millimetres baseline distance). The following
% LaTeX setting has routinely been considered perfectly acceptable:

% add by Lin: reference: https://latex.org/forum/viewtopic.php?t=28685
% Reason: the standard line skip means a factor of 1.2 (such as font height 10pt, base line skip 12pt). Multiply with \linespread, so you get 1.25*1.2 = 1.5, so one-half.
% so, double spacing means 1.667*1.2=2

\renewcommand\baselinestretch{1.667}

% ******************************** Justification *******************************
% Left aligned as per University identity guidelines
\ifPHD@textJustify
\message{PhDThesisPSnPDF: The University identity guidelines recommend using
left aligned text. Please use `flushleft' in the documentclass option, if you
wish to left align your text}
\else
\AtBeginDocument{
\raggedright
}
\fi


% ************************** TOC and Hide Sections *****************************
\newcommand{\nocontentsline}[3]{}
\newcommand{\tochide}[2]{
	\bgroup\let
	\addcontentsline=\nocontentsline#1{#2}
	\egroup}
% Removes pagenumber appearing from TOC
% \addtocontents{toc}{\protect\thispagestyle{empty}}


% ***************************** Header Formatting ******************************
% Custom Header with Chapter Number, Page Number and Section Numbering

\RequirePackage{fancyhdr} % Define custom header

% All styles sets Page Number at the Bottom Center
% Style 1:  Chapter/Section Name on LO/RE with head rule
\fancypagestyle{PageStyleI}{
  \renewcommand{\chaptermark}[1]{\markboth{\@chapapp\ \thechapter\ ##1}{}} % \chaptermark in each chapter.tex to set the short title
  \renewcommand{\sectionmark}[1]{\markright{\thesection\ ##1}}
  \fancyhf{}
  \if@twoside
  	\fancyhead[RO]{\small \nouppercase \rightmark} %\bfseries  chapter name was long.
  	\fancyhead[LE]{\small \nouppercase \leftmark} %\bfseries
  \else
  	% \fancyhead[L]{\ifthenelse{\isodd{\value{page}}}{}{\bfseries \nouppercase \leftmark}} %\bfseries
    \fancyhead[L]{\ifthenelse{\isodd{\value{page}}}{}{\small \MakeUppercase \leftmark}}
  	\fancyhead[R]{\ifthenelse{\isodd{\value{page}}}{\small \MakeUppercase \rightmark}{}} %\bfseries
  \fi
  \fancyfoot[C]{\thepage}
}

% Style 2: Chapter/Section Name at the Top Center,   with head rule
\fancypagestyle{PageStyleII}{
  \renewcommand{\chaptermark}[1]{\markboth{\@chapapp\ \thechapter\ ##1}{}}
  \renewcommand{\sectionmark}[1]{\markright{\thesection\ ##1}}
  \fancyhf{}
  \if@twoside
  	\fancyhead[CO]{\bfseries \nouppercase \rightmark}
  	\fancyhead[CE]{\bfseries \nouppercase \leftmark}
  \else
    \fancyhead[C]{\ifthenelse{\isodd{\value{page}}}{\nouppercase \rightmark}{\nouppercase \leftmark}}
  \fi
  \fancyfoot[C]{\thepage}
}

% Style 3: Chapter/Section Name on LO/RE without head rule, no lines
\fancypagestyle{PageStyleIII}{

  \renewcommand{\chaptermark}[1]{\markboth{\@chapapp\ \thechapter.\ ##1}{}}
  \renewcommand{\sectionmark}[1]{\markright{\thesection\ ##1}}
  \fancyhf{}
  \fancyhead[L]{\ifthenelse{\isodd{\value{page}}}{}{\nouppercase \leftmark}}
  \fancyhead[R]{\ifthenelse{\isodd{\value{page}}}{\nouppercase \rightmark}{}}
  \renewcommand{\headrulewidth}{0pt}
  \fancyfoot[C]{\thepage}
}

% Set Fancy Header Command is defined to Load FancyHdr after Geometry is defined
\newcommand{\setFancyHdr}{

\pagestyle{fancy}

\ifPHD@pageStyleI
  \pagestyle{PageStyleI}

\else
  \ifPHD@pageStyleII

  \pagestyle{PageStyleII}

\else
    \ifPHD@pageStyleIII

    \pagestyle{PageStyleIII}

    \else
    % Default Style: Sets Page Number at the Bottom
      \renewcommand{\chaptermark}[1]{\markboth {##1}{}}
      \renewcommand{\sectionmark}[1]{\markright{\thesection\ ##1}}
      \fancyhf{}
  	  \fancyfoot[C]{\thepage}
 	  \renewcommand{\headrulewidth}{0pt}
    \fi
  \fi
\fi
}

\setlength{\headheight}{14.5pt}
%\renewcommand{\headrulewidth}{0.5pt}
%\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{plain}{
  \fancyhead{}
  \renewcommand{\headrulewidth}{0.0pt}
}


% If Margin has been set (default margin print/online version)
\ifsetCustomMargin
\AtBeginDocument{
\@ifpackageloaded{geometry}{}{\ClassWarning{PhDThesisPSnPDF}{%
  Custom margin is chosen, but geometry package is not loaded. Please load the
  `geometry' package in the preamble.}}}
\else
\setFancyHdr % Apply fancy header settings otherwise apply it in preamble
\fi

% **************** Clear Header Style on the Last Empty Odd pages **************
\renewcommand{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else%
	\hbox{}%
	\thispagestyle{empty}  % Empty header styles
	\newpage%
	\if@twocolumn\hbox{}\newpage\fi\fi\fi}


% ******************************************************************************
% **************************** Macro Definitions *******************************
% ******************************************************************************
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% Author name in Chinese
\newcommand{\@authorzh}{}
\newcommand{\authorzh}[1]{\renewcommand{\@authorzh}{#1}}

% Title in Chinese
\newcommand{\@titlezh}{}
\newcommand{\titlezh}[1]{\renewcommand{\@titlezh}{#1}}

% Shorttitle (optional, an abbreviated title for spine)
\newcommand{\@shorttitle}{}
\newcommand{\shorttitle}[1]{\renewcommand{\@shorttitle}{#1}}

% The year and term the degree will be officially conferred
\newcommand{\@degreedate}{\monthname[\the\month]\space\the\year}
\newcommand{\degreedate}[1]{\renewcommand{\@degreedate}{#1}}
\newcommand{\@degreedatezh}{}
\newcommand{\degreedatezh}[1]{\renewcommand{\@degreedatezh}{#1}}

% The full and abbreviated name of the degree
\newcommand{\@degreetitle}{}
\newcommand{\degreetitle}[1]{\renewcommand{\@degreetitle}{#1}}
\newcommand{\@degreetitlezh}{}
\newcommand{\degreetitlezh}[1]{\renewcommand{\@degreetitlezh}{#1}}
\newcommand{\@degreetitleabbr}{}
\newcommand{\degreetitleabbr}[1]{\renewcommand{\@degreetitleabbr}{#1}}

% The name of your department(eg. Engineering, Maths, Physics)
\newcommand{\@dept}{}
\newcommand{\dept}[1]{\renewcommand{\@dept}{#1}}
\newcommand{\@deptzh}{}
\newcommand{\deptzh}[1]{\renewcommand{\@deptzh}{#1}}

% The name of your University
\newcommand{\@university}{}
\newcommand{\university}[1]{\renewcommand{\@university}{#1}}
\newcommand{\@universityzh}{}
\newcommand{\universityzh}[1]{\renewcommand{\@universityzh}{#1}}
\newcommand{\@universityabbr}{}
\newcommand{\universityabbr}[1]{\renewcommand{\@universityabbr}{#1}}
\newcommand{\@partneruniversity}{}
\newcommand{\partneruniversity}[1]{\renewcommand{\@partneruniversity}{#1}}

% Submission Text
\newcommand{\submissiontexta}{Submitted to}
\newcommand{\submissiontextb}{in Partial Fulfillment of the Requirements\par for the Degree of\space}
\newcommand{\submissiontextc}{awarded by City University of Hong Kong\par for successful completion of the joint programme with\par\space}


% keywords (These keywords will appear in the PDF meta-information
% called `pdfkeywords`.)
\newcommand{\@keywords}{}
\newcommand{\keywords}[1]{\renewcommand{\@keywords}{#1}}

% subjectline (This subject will appear in the PDF meta-information
% called `pdfsubject`.)
\newcommand{\@subject}{}
\newcommand{\subject}[1]{\renewcommand{\@subject}{#1}}

% Declaration title text
\newcommand{\@declarationtitle}{DECLARATION}

% Rights title text
\newcommand{\@rightstitle}{COPY RIGHT}

% Acknowledgment title text
\newcommand{\@acknowledgementstitle}{ACKNOWLEDGEMENTS}

% Abstract title text
\newcommand{\@abstracttitle}{ABSTRACT}

% Panel title text
\newcommand{\@panelname}{Qualifying Panel and Examination Panel}

% Publication title text
\newcommand{\pubname}{LIST OF PUBLICATIONS}

% Abbreviations title text
\newcommand{\@abbreviationsstitle}{LIST OF ABBREVIATIONS}

% These macros define an environment for front matter that is always
% single column even in a double-column document.
\newenvironment{alwayssingle}{%
       \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
       \else\newpage\fi}
       {\if@restonecol\twocolumn\else\newpage\fi}

% Set single column even under two column layout
\newcommand{\setsinglecolumn}{
\if@twocolumn
   \onecolumn
\else
\fi
}


% ******************************************************************************
% *************************** Front Matter Layout ******************************
% ******************************************************************************

% ******************************** Title Page **********************************

% Use fixed font sizes in Front Cover/Spine/Title Page
\newcommand{\smallfontsize}   {\fontsize{12bp}{10bp} \selectfont}
\newcommand{\normalfontsize}  {\fontsize{14bp}{16bp} \selectfont}
\newcommand{\largefontsize}   {\fontsize{16bp}{18bp} \selectfont}
\newcommand{\Largefontsize}   {\fontsize{18bp}{20bp} \selectfont}
\newcommand{\LARGEfontsize}   {\fontsize{20bp}{22bp} \selectfont}

\renewcommand{\maketitle}{
\newgeometry{left=45mm,right=45mm,top=50mm,bottom=50mm,noheadfoot,nomarginpar}

\thispagestyle{empty}

\setlength{\parskip}{0.5em}
% \begin{singlespace}
\begin{spacing}{1}
\begin{center}

% University
{\Largefontsize
  {\expandafter\MakeUppercase\expandafter{\english\@university} \par}
  {\chinese \@universityzh \par}

  \vspace{36bp} % 54bp

  % Title
  {\english \@title \par}
  {\chinese \@titlezh \par}
}

\vspace{36bp} % 36
% \vfill

% % Submission Text
{\smallfontsize
  {\english \submissiontexta \par}
  {\english \@dept \par}
  {\chinese \@deptzh \par}
  {\english \submissiontextb \english \@degreetitle \par}
  {\chinese \@degreetitlezh \par}
    \ifthenelse{\equal{\@partneruniversity}{}}{
      % partneruniversity is not defined
    }{
      {\english \submissiontextc \english \@partneruniversity\par}
    } % partneruniversity is defined
% \vfill

\vspace{25bp}
  {\english {by}}
\vspace{25bp}

  % Author
  {\english \@author \par}
  {\chinese \@authorzh \par}

\vspace{25bp}

  %Degree date
  {\english \@degreedate \par}
  {\chinese \@degreedatezh \par}
}

\end{center}
\end{spacing}
% \end{singlespace}
\restoregeometry
}


% ********************************* Dedication *********************************
% The dedication environment makes sure the dedication gets its
% own page, centered

\newenvironment{dedication}
{
\cleardoublepage
\vspace*{0.2\textheight}
\thispagestyle{empty}
\centering
}

% ****************************** Abstract ********************************

\newenvironment{abstract} {
% Normal abstract in the thesis
\cleardoublepage
\phantomsection
\addcontentsline{toc}{chapter}{\@abstracttitle}
\setlength{\mystoreparindent}{\the\parindent}
\setlength{\parindent}{0pt}
\chapter*{\centering \Large \@abstracttitle}
% \thispagestyle{plain}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\ifthenelse{\isodd{\value{page}}}{}{\@abstracttitle}}
\fancyhead[R]{\ifthenelse{\isodd{\value{page}}}{\@abstracttitle}{}} 
\fancyfoot[C]{\thepage}

% if you want manually set the size of title
%\begin{center}
%\textbf{ABSTRACT} \\
%\end{center}
}

% *********** Information on Qualifying Panel and Examination Panel ************
\newcommand{\tinyfontsize}   {\fontsize{11.3bp}{12bp} \selectfont}
\newlength\mystoreparindent
\newenvironment{panel}
{
\cleardoublepage
\phantomsection
\addcontentsline{toc}{chapter}{\@panelname}
\setlength{\mystoreparindent}{\the\parindent}
\setlength{\parindent}{0pt}

\begin{center}
\textbf{CITY UNIVERSITY OF HONG KONG} \\
\textbf{Qualifying Panel and Examination Panel}
\end{center}

\begin{spacing}{1.5}
\tinyfontsize
\setlength{\tabcolsep}{0pt}
}{%
\end{spacing}
\setlength{\parindent}{\mystoreparindent}
}
\BeforeBeginEnvironment{panel}{\newgeometry{left=45mm,right=45mm,top=25mm,noheadfoot,nomarginpar}
\fancyfootoffset[L]{0mm}
\thispagestyle{plain}
}
\AfterEndEnvironment{panel}{\restoregeometry}

% ***************************** Rights *****************************
% 
\newenvironment{rights}{
\cleardoublepage
\phantomsection
\addcontentsline{toc}{chapter}{\@rightstitle}
% \chapter*{\centering \Large \@rightstitle}
\thispagestyle{plain}
}

% ***************************** Acknowledgements *****************************
% The acknowledgements environment puts a large, bold, centered
% "Acknowledgements" label at the top of the page.

\newenvironment{acknowledgements}{
\cleardoublepage
\phantomsection
\addcontentsline{toc}{chapter}{\@acknowledgementstitle}
\setlength{\mystoreparindent}{\the\parindent}
\setlength{\parindent}{0pt}
\chapter*{\centering \Large \@acknowledgementstitle}
% \thispagestyle{plain} % previous version
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\ifthenelse{\isodd{\value{page}}}{}{\@acknowledgementstitle}}
\fancyhead[R]{\ifthenelse{\isodd{\value{page}}}{\@acknowledgementstitle}{}} 
\fancyfoot[C]{\thepage}
}

% ***************************** abbreviations *****************************
% The abbreviations environment puts a large, bold, centered
% "abbreviations" label at the top of the page.

\newenvironment{abbreviations}{
\cleardoublepage
\phantomsection
\addcontentsline{toc}{chapter}{\@abbreviationsstitle}
\chapter*{\centering \Large \@abbreviationsstitle}

\setlength{\mystoreparindent}{\the\parindent}
\setlength{\parindent}{0pt}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\ifthenelse{\isodd{\value{page}}}{}{LIST OF ABBREVIATIONS}}
\fancyhead[R]{\ifthenelse{\isodd{\value{page}}}{LIST OF ABBREVIATIONS}{}} 
\fancyfoot[C]{\thepage}
% [LE,RO] the E,O not work for alpha


}

% ****************************** Publications ********************************
% 在toc后面，使用\thispagestyle{plain} 页眉自动生成为`table of content'
\newenvironment{publications}{
\cleardoublepage
\phantomsection
\setlength{\mystoreparindent}{\the\parindent}
\setlength{\parindent}{0pt}
\addcontentsline{toc}{chapter}{\pubname}
\chapter*{\centering \Large \pubname}
% \thispagestyle{plain}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\ifthenelse{\isodd{\value{page}}}{}{LIST OF PUBLICATIONS}}
\fancyhead[R]{\ifthenelse{\isodd{\value{page}}}{LIST OF PUBLICATIONS}{}} 
\fancyfoot[C]{\thepage}
}

% \fancyhead[LE,RO]{List of Publication}
% E for even page
%O for odd page
%L for left side
%C for centered
%R for right side


%% EOF