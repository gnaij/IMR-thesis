%%  \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{IMRthesis}
  [2009/09/15 v0.1j IMRthesis
   document class]
\newif\ifIMR@typeinfo \IMR@typeinfotrue
\DeclareOption{notypeinfo}{\IMR@typeinfofalse}
\newif\ifIMR@dvips \IMR@dvipsfalse
\DeclareOption{dvips}{\IMR@dvipstrue}
\DeclareOption{dvipdfm}{\IMR@dvipsfalse}
\DeclareOption{pdftex}{\IMR@dvipsfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
\LoadClass[cs4size,a4paper,fancyhdr,fntef]{ctexbook}[2005/11/25]
%% check pdfTeX mode
\RequirePackage{ifpdf}
%% math packages
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm}
%% graphics packages
\RequirePackage{graphicx}
\RequirePackage{times}
%% sort and compress citations
%\RequirePackage[super,numbers,sort&compress]{natbib}
%% packages and settings depend on PDF mode
\ifpdf   % We're running pdfTeX in PDF mode
  \RequirePackage[pdftex]{hyperref}
  \DeclareGraphicsExtensions{.pdf}
\else    % We're not running pdfTeX, or running pdfTeX in DVI mode
  \ifIMR@dvips
    \RequirePackage[dvips]{hyperref}
    \RequirePackage{psfrag}
    \AtBeginDvi{\special{pdf:tounicode GBK-EUC-UCS2}} % GBK -> Unicode
  \else
    \RequirePackage[dvipdfm]{hyperref}
  \fi
  \DeclareGraphicsExtensions{.eps,.ps}
\fi
\hypersetup{CJKbookmarks,%
       bookmarksnumbered,%
              colorlinks,%
               linkcolor=black,%
               citecolor=black,%
              plainpages=false,%
            pdfstartview=FitH}
\AtEndOfPackage{\makeatletter\input{IMRthesis.cfg}\makeatother}
\oddsidemargin 1.5 true cm
\if@twoside
  \evensidemargin 0 true cm
\else
  \evensidemargin 1.5 true cm
\fi
%\textheight 21 true cm
%\textwidth 14.5 true cm
%\headheight 15pt
%\parskip 0.5ex plus 0.25ex minus 0.25ex
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \thispagestyle{empty}%
  \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\renewcommand{\floatpagefraction}{0.80}
\CTEXsetup[format+={\flushleft}]{section} % 小节标题靠左对齐
\CTEXsetup[format+={\flushleft}]{subsection}
\renewcommand{\baselinestretch}{1.5} %默认的行距是1.3倍, 改成1.5倍行距

\newcommand\IMRspace{\protect\CTEX@spaceChar\protect\CTEX@spaceChar}
\def\IMR@getfileinfo#1 #2 #3\relax#4\relax{%
  \def\IMRfiledate{#1}%
  \def\IMRfileversion{#2}%
  \def\IMRfileinfo{#3}}%
\expandafter\ifx\csname ver@IMRthesis.cls\endcsname\relax
  \edef\reserved@a{\csname ver@ctextemp_IMRthesis.cls\endcsname}
\else
  \edef\reserved@a{\csname ver@IMRthesis.cls\endcsname}
\fi
\expandafter\IMR@getfileinfo\reserved@a\relax? ? \relax\relax
\def\IMR@underline[#1]#2{%
  \CTEXunderline{\hbox to #1{\hfill#2\hfill}}}
\def\IMRunderline{\@ifnextchar[\IMR@underline\CTEXunderline}
\newcommand\classification[1]{\def\IMR@value@classification{#1}}
\newcommand\confidential[1]{\def\IMR@value@confidential{#1}}
\newcommand\UDC[1]{\def\IMR@value@UDC{#1}}
\newcommand\serialnumber[1]{\def\IMR@value@serialnumber{#1}}
\newcommand\school[1]{\def\IMR@value@school{#1}}
\newcommand\degree[1]{\def\IMR@value@degree{#1}}
\renewcommand\title[2][\IMR@value@title]{%
  \def\IMR@value@title{#2}
  \def\IMR@value@titlemark{\MakeUppercase{#1}}}
\renewcommand\author[1]{\def\IMR@value@author{#1}}
\newcommand\advisor[1]{\def\IMR@value@advisor{#1}}
\newcommand\advisorinstitute[1]{\def\IMR@value@advisorinstitute{#1}}
\newcommand\advisorinstitutet[1]{\def\IMR@value@advisorinstitutet{#1}}
\newcommand\major[1]{\def\IMR@value@major{#1}}
\newcommand\submitdate[1]{\def\IMR@value@submitdate{#1}}
\newcommand\defenddate[1]{\def\IMR@value@defenddate{#1}}
\newcommand\institute[1]{\def\IMR@value@institute{#1}}
\newcommand\chairman[1]{\def\IMR@value@chairman{#1}}
\renewcommand\maketitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \bf\songti\zihao{-4}
      \IMR@label@classification~
      \IMRunderline[100pt]{\IMR@value@classification}
        \hfill
      \IMR@label@confidential~
      \IMRunderline[100pt]{\IMR@value@confidential}
    \vskip 10pt
      \IMR@label@UDC~
      \IMRunderline[108pt]{\IMR@value@UDC}
        \hfill
      \IMR@label@serialnumber~
      \IMRunderline[100pt]{\IMR@value@serialnumber}
    \vskip \stretch{2}
      \bf\songti\zihao{-1} \IMR@value@school \\
      \IMR@value@degree\IMR@label@thesis
    \vskip \stretch{2}
      \bf\heiti\zihao{3} \IMRunderline{~\IMR@value@title~}
    \vskip \stretch{1}
      \bf\kaishu\zihao{3} \IMRunderline{~\IMR@value@author~}
    \vskip \stretch{2}
    \bf\fangsong\zihao{3}
    \def\tabcolsep{1pt}
    \def\arraystretch{1.5}
    \begin{tabular}{llcrl}
      \IMR@label@advisor &
      \multicolumn{4}{l}{\IMRunderline[299pt]{\IMR@value@advisor}}
    \\
      & \multicolumn{4}{l}{\IMRunderline[299pt]{\IMR@value@advisorinstitutet}}
      \\
      & \multicolumn{4}{l}{\IMRunderline[299pt]{\IMR@value@advisorinstitute}}
    \\
      \IMR@label@degree &
      \IMRunderline[80pt]{\IMR@value@degree} & \hspace{5pt} &
      \IMR@label@major &
      \IMRunderline[120pt]{\IMR@value@major}
    \\
      \IMR@label@submitdate &
      \IMRunderline[80pt]{\IMR@value@submitdate} & &
      \IMR@label@defenddate &
      \IMRunderline[120pt]{\IMR@value@defenddate}
    \\
      \IMR@label@institute &
      \multicolumn{4}{l}{\IMRunderline[299pt]{\IMR@value@institute}}
    \\
      \IMR@label@school &
      \multicolumn{4}{l}{\IMRunderline[299pt]{\IMR@value@school}}
    \\[15pt]
      \multicolumn{4}{r}{\IMR@label@chairman} &
      \IMRunderline[100pt]{\IMR@value@chairman}
    \end{tabular}
  \end{center}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \ifIMR@typeinfo
      \vspace*{\stretch{1}}
      \begin{footnotesize}
        \noindent
        Typeset by \LaTeXe{} at \CTEX@todayold \\
        With package \texttt{IMRthesis} \IMRfileversion{} of C\TeX{}.ORG
      \end{footnotesize}
    \fi
    \cleardoublepage
  \fi
}
\newcommand\englishdissertation[1]{\def\IMR@value@englishdissertation{#1}}
\newcommand\englishtitle[1]{\def\IMR@value@englishtitle{#1}}
\newcommand\englishcandidate[1]{\def\IMR@value@englishcandidate{#1}}
\newcommand\englishspecialty[1]{\def\IMR@value@englishspecialty{#1}}
\newcommand\englishadvisor[1]{\def\IMR@value@englishadvisor{#1}}
\newcommand\englishadvisorinstitute[1]{\def\IMR@value@englishadvisorinstitute{#1}}
\newcommand\englishadvisortwo[1]{\def\IMR@value@englishadvisortwo{#1}}
\newcommand\englishadvisorinstitutetwo[1]{\def\IMR@value@englishadvisorinstitutetwo{#1}}
\newcommand\englishadvisorthree[1]{\def\IMR@value@englishadvisorthree{#1}}
\newcommand\englishadvisorinstitutethree[1]{\def\IMR@value@englishadvisorinstitutethree{#1}}
\newcommand\englishinstitute[1]{\def\IMR@value@englishinstitute{#1}}
%\newcommand\englishdate[1]{\def\IMR@value@englishdate{#1}}
\newcommand\englishdegree[1]{\def\IMR@value@englishdegree{#1}}
\newcommand\englishstatement[1]{\def\IMR@value@englishstatement{#1}}
  \newcommand\announcement[1]{\def\IMR@value@announcement{#1}}
\newcommand\annoucecontent[1]{\def\IMR@value@annoucecontent{#1}}
\newcommand\authorsignature[1]{\def\IMR@value@authorsignature{#1}}
\newcommand\authordate[1]{\def\IMR@value@authordate{#1}}
\newcommand\makeenglishtitle{%
  \cleardoublepage
  \thispagestyle{empty}

   \begin{flushleft}
  \rm\bf\Large\IMR@value@englishdissertation
   \end{flushleft}

  \begin{center}
  
 % \vspace*{100pt}
    \vskip \stretch{1}
      \rm\bf\LARGE\IMR@value@englishtitle
    \vspace*{10pt}
      \rm\bf\Large\IMR@label@englishcandidate\\
      \vspace*{10pt}
       \rm\bf\Large\IMR@value@englishcandidate\\
       \vspace*{20pt}
     \rm\large\IMR@label@englishstatement\\
      \bf\heiti\zihao{3}
       \begin{tabular}{lcr}
      % \\
     % \IMR@label@englishdegree &
      % \IMR@value@englishdegree
    %\\
      %\IMR@label@englishspecialty &
      %\IMR@value@englishspecialty
     \\
      \rm\large\IMR@label@englishadvisor &
      \IMR@value@englishadvisor
    \\
        &
      \rm\large\IMR@value@englishadvisorinstitute
    \\
           &
     \IMR@value@englishadvisortwo
    \\
        &
      \rm\large\IMR@value@englishadvisorinstitutetwo
     \\
               &
     \IMR@value@englishadvisorthree
    \\
            &
      \rm\large\IMR@value@englishadvisorinstitutethree
    \end{tabular}
\vskip 50pt
     \IMR@value@englishinstitute
    %\vskip 30pt
     % \bf\zihao{4} \IMR@value@englishdate
    %\vskip 20pt
      %\it\normalsize \IMR@label@englishstatement
  \end{center}
 \cleardoublepage
  \thispagestyle{empty}
  
  %\newenvironment{announcement}
 % {\Nchapter{\IMR@label@announcement}}
  %{}

 \begin{center}
    {\bf\songti\Large \IMR@value@announcement }  
 \end{center}
  \IMR@value@annoucecontent
   \vspace*{50pt}
  \begin{tabular}{p{4cm}p{3cm}r}
           %\hspace*{7.04cm}
       &&{\bf\songti\large\IMR@value@authorsignature}    \\
      %\vspace*{80pt}\hspace*{7cm}
       &&\\
       &&{\bf\songti\large\IMR@value@authordate } 
     \end{tabular}
 \cleardoublepage
   \thispagestyle{empty}
}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[CE]{\heiti\small \IMR@value@author~~\IMR@value@titlemark}
\fancyhead[CO]{\small \leftmark}
\fancyfoot[C]{\small ~\thepage~}
%\fancyfoot[C]{\if@frontmatter\small ~\thepage~\fi}
%\renewcommand{\headrule}
\renewcommand{\headrulewidth}{1pt}
\fancypagestyle{plain}{%
\pagestyle{fancy}
}

\newenvironment{abstract}
  {\Nchapter{\IMR@label@abstract}}
  {}
\newcommand\keywords[1]{%
  \vspace{2ex}\noindent{\heiti \IMR@label@keywords} #1}
\newenvironment{englishabstract}
  {\Nchapter{\IMR@label@englishabstract}}
  {}
\newcommand\englishkeywords[1]{%
  \vspace{2ex}\noindent{\bf \IMR@label@englishkeywords} #1}
\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \Nchapter{\contentsname}%
    \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }
\addtocontents{toc}{\let\string\CTEX@spaceChar\relax}
\newcommand\Nchapter[1]{%
  \if@mainmatter%
    \@mainmatterfalse%
    \chapter{#1}%
    \@mainmattertrue%
  \else
    \chapter{#1}%
  \fi}
\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaders\hbox{$\m@th\mkern 1.5mu\cdot\mkern 1.5mu$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
     \par}%
  \fi}
\renewcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1
       \leaders\hbox{$\m@th\mkern 1.5mu\cdot\mkern 1.5mu$}
       \hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak
      \leaders\hbox{$\m@th\mkern 1.5mu\cdot\mkern 1.5mu$}
      \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\renewenvironment{thebibliography}[1]
     {\Nchapter{\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newenvironment{publications}[1]
     {\Nchapter{\IMR@label@publications}%
      \@mkboth{\MakeUppercase\IMR@label@publications}
              {\MakeUppercase\IMR@label@publications}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `publications' environment}}%
      \endlist}
\newenvironment{resume}
  {\Nchapter{\IMR@label@resume}}
  {}
\newenvironment{resumesection}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 2\ccwd}
   \item\relax}
  {\endlist}
\newenvironment{resumelist}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 4\ccwd
           \itemindent -2\ccwd
           \listparindent\itemindent}
   \item\relax}
  {\endlist}
\renewenvironment{thanks}
  {\Nchapter{\IMR@label@thanks}}
  {}
\setcounter{secnumdepth}{4}
\newtheoremstyle{break}% name
  {}%      Space above, empty = `usual value'
  {}%      Space below
  {\itshape}% Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {.}%        Punctuation after thm head
  {\newline}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\endinput
%%
%% End of file `IMRthesis.cls'.
