\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{myclass}

\ExecuteOptions{a4paper,12pt,twoside}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax
\LoadClass{memoir}

%
% Configure Hyperref
%

\RequirePackage{url}
\RequirePackage{nameref}
\RequirePackage{varioref}
\usepackage[pdftex,unicode,bookmarks]{hyperref}

\hypersetup{    
    pdffitwindow=true,
    bookmarksnumbered=true,
    bookmarksopen=false,
    colorlinks=true,
    pdfpagelayout=TwoPageRight,
    pdfpagemode=UseOutlines,
    pdfstartview=Fit,
    linkcolor=black,
    citecolor=black,
    anchorcolor=black,
    filecolor=black,
    menucolor=black,
    urlcolor=black,
    pdftitle={},
    pdfauthor={},
    pdfkeywords={}
}

%
% Customize title page
%
\aliaspagestyle{title}{empty}
\date{}
\newcommand{\mysupervisor}[1]{\def\@mysupervisor{#1}}
\newcommand{\myyear}[1]{\def\@myyear{#1}}

\setlength{\droptitle}{0cm}

\renewcommand{\maketitlehooka}{%
\begin{figure}[H]
\includegraphics[width=0.5\textwidth]{figures/BTULogo.jpg}
\end{figure}
}

\pretitle{\vspace{2cm}\begin{center}%
 Master's thesis\par\vspace{1cm}\Large\bfseries\MakeUppercase}
\posttitle{\end{center}}

\newcommand{\album}[1]{\unskip ,~#1}
\renewcommand{\and}{\\}

\renewcommand{\maketitlehookb}{\vspace{1cm}}

\renewcommand{\maketitlehookc}{\vfill\begin{center}
Supervisors\\\@mysupervisor
\end{center}
\vspace{3cm}\begin{center}Cottbus, \@myyear.\end{center}
}


%
% Customize running titles and page style.
%

\makepagestyle{ppfcmthesis}
\makeatletter
\newcommand{\@ppfcmthesismarks}{%
  \let\@mkboth\markboth
  \def\chaptermark##1{\markboth{##1}{##1}}    % left mark & right marks
  \def\sectionmark##1{\markright{%
    \ifnum \c@secnumdepth>\z@
      \thesection. \ %
    \fi
    ##1}}
  \def\tocmark{\markboth{\contentsname}{}}
  \def\lofmark{\markboth{\listfigurename}{}}
  \def\lotmark{\markboth{\listtablename}{}}
  \def\bibmark{\markboth{\bibname}{}}
  \def\indexmark{\markboth{\indexname}{}}
}
\makepsmarks{ppfcmthesis}{\@ppfcmthesismarks}
\makeatother
\makeevenhead{ppfcmthesis}{\normalfont\small\textbf\rightmark}{}{}
\makeoddhead{ppfcmthesis}{}{}{\normalfont\small\textbf\rightmark}

\makeheadrule{ppfcmthesis}{\textwidth}{0.4pt}

\makeevenfoot{ppfcmthesis}{}{\thepage}{\normalfont\small\itshape}
\makeoddfoot{ppfcmthesis}{\normalfont\small\itshape}{\thepage}{}
%
% Customize Table of Contents
%
\setcounter{tocdepth}{2} %bookmarks counter = toc counter +1
%\maxtocdepth{subsection}
\maxsecnumdepth{subsection}

%
% Customize book style
%
% \tightlists
\pagestyle{ppfcmthesis}
\setstocksize{297mm}{210mm}
\settrimmedsize{297mm}{210mm}{*}
\settrims{0pt}{0cm}
\setlrmarginsandblock{3.5cm}{2.5cm}{*}
\setulmarginsandblock{2.5cm}{2.5cm}{*}
\setmarginnotes{6pt}{50pt}{\onelineskip}
\setheadfoot{\onelineskip}{2\onelineskip}
\setheaderspaces{*}{2\onelineskip}{*}
\OnehalfSpacing

\changecaptionwidth
\captionwidth{.9\linewidth}
\captionnamefont{\footnotesize\scshape}
\captiontitlefont{\footnotesize}

\newcommand{\fcmfcaption}[2][\@empty]{
\captionnamefont{\footnotesize\bfseries}%
\captiondelim{.~}
\captionstyle{}
\captiontitlefont{\footnotesize}
\ifx #1\@empty \caption{#2}\else \caption[#1]{#2}}

\newcommand{\fcmtcaption}[2][\@empty]{
\captionnamefont{\footnotesize\bfseries\hfill}%
\captiondelim{}
\captionstyle{\raggedleft\\}
\captiontitlefont{\footnotesize\normalfont}
\ifx #1\@empty \caption{#2}\else \caption[#1]{#2}}

\def\thesubsubsection {\thesubsection .\arabic{subsubsection}}

\checkandfixthelayout


