%% Modified 8/1/07 by Ryan Hickox -- include AASTeX plotone and
%% plottwo commands 
%% Modifield 12/2/07 by Ryan Hickox -- set figures to include chapter number,
%% and changed Fig. to Figure
%% i.e. changed Fig. 4 to Figure 1.4, etc.  
%% see http://www.tex.ac.uk/cgi-bin/texfaq2html for tips
%% Modified 5/21/07 by Mike Westover -- microfilm copy 
%% should have binding margin
%%
%% This class file was originally created by Matthew Condell to 
%% simplify formatting of Harvard Astronomy Department theses, 
%% with refinements later added by Hannah Jang-Condell.  
%% 
%% Use at your own risk.  Keep in mind that this class file is largely 
%% a big hack.  Feel free to improve upom it if you know more about LaTeX
%% prpgramming.
%%
%% That being said, here are some useful features of this class:
%%
%% Format options ( \documentclass[<option>]{hvdthesis} )
%%	bound -- double-spaced, single-sided, with binding margin
%%		to conform to ``The Form of the Doctoral Thesis'' 
%%		for GSAS
%%	microfilm -- double-spaced, single-sided, centered margins, 
%%		and black-and-white optional figures, also 
%%		conforming to ``The Form of the Doctoral Thesis'' 
%%	keepsake -- single-spaced, double-sided, with binding margin.
%% 		Basically a dense version that you can print and bind 
%% 		to give to your advisor or keep for yourself.
%% 	plain -- single-spaced, double-sided, with centered margins.
%% 		Good for generating copies to submit to your committee 
%% 		prior to your defense.
%%
%% If you want other formats (i.e. double-spaced & double-sided or 
%% single-spaced and single-sided), it should be pretty straightforward
%% to set it up using the commands below.
%%
%% You need to also have the style files aas_stuff.sty and aasmod.sty, 
%% although I expect you could just copy over all the relevant formatting 
%% things into this class file instead to streamline things.
%%
%% A new command called \altfig is introduced in this class.  The purpose 
%% of this command is to specify alternate grayscale or black-and-white 
%% images in place of color figures for the microfilm version.  That way 
%% the bound and keepsake versions of the thesis can include full color 
%% figures, and the microfilm version will automatically include a 
%% black-and-white version.  Usage:
%% 	\altfig{fig_bw.eps}{fig_color.eps}
%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{hvdthesis}[2004/04/23 v1.0 (H. Jang-Condell)]

\newif\if@figcolor
\newif\if@thdblspace
\newif\if@bindmargin

%
% Formatting
%
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{book}}

% 2 space, color, binding margins
\DeclareOption{bound}{\@thdblspacetrue \@figcolortrue \@bindmargintrue
                      % make one sided
                      \@twosidefalse \@mparswitchfalse}
% 2 space, b&w, normal margins
\DeclareOption{microfilm}{\@thdblspacetrue \@figcolorfalse \@bindmargintrue
                      % make one sided
                      \@twosidefalse \@mparswitchfalse}
% 1 space, color, binding margins
\DeclareOption{keepsake}{\@thdblspacefalse \@figcolortrue \@bindmargintrue
                      % make two sided
                      \@twosidetrue \@mparswitchtrue}
% 2 space, color, binding margins
\DeclareOption{ryansake}{\@thdblspacetrue \@figcolortrue \@bindmargintrue
                      % make two sided
                      \@twosidetrue \@mparswitchtrue}
% 1 space, color, normal margins
\DeclareOption{plain}{\@thdblspacefalse \@figcolortrue \@bindmarginfalse
                      % make two sided
                      \@twosidetrue \@mparswitchtrue}

\ProcessOptions
\if@twoside
  \LoadClass[11pt,a4paper,twoside]{book}
\else
  \LoadClass[11pt,a4paper,oneside]{book}
\fi

\RequirePackage{aas_stuff}
\RequirePackage{aasmod}
\RequirePackage{afterpage}
\RequirePackage{natbib}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage{latexsym}

%
\if@figcolor
   \newcommand{\altfig}[2]{#2}
\else
   \newcommand{\altfig}[2]{#1}
\fi
%
\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}
  \singlespace}
\renewcommand\mainmatter{%
   \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}
  \if@thdblspace
     \doublespace
  \else
     \singlespace
  \fi
}

\if@bindmargin
%   \setlength\textwidth{6.0in}
   \setlength\textwidth{6.3in}
   \setlength\topmargin{-0.2in}
   \setlength\textheight{8.7in}
%   \setlength\oddsidemargin{0.5in}
   \setlength\oddsidemargin{0.1in}
   \setlength\evensidemargin{0.1in}
   \setlength\footnotesep{4ex}
\else
   \setlength\textwidth{6.0in}
   \setlength\topmargin{-0.2in}
   \setlength\textheight{8.7in}
   \setlength\oddsidemargin{0.25in}
   \setlength\evensidemargin{0.25in}
   \setlength\footnotesep{4ex}
\fi

%
% Setting up the boiler plate
%
\renewcommand*{\title}[1]{\def\thtitle{#1}}
\renewcommand*{\author}[1]{\def\thauthor{#1}}
\newcommand*{\subject}[1]{\def\thsub{#1}}
\newcommand*{\department}[1]{\def\thdept{#1}}
\renewcommand*{\month}[1]{\def\thmonth{#1}}
\renewcommand*{\year}[1]{\def\thyear{#1}}
\newcommand*{\advisor}[1]{\def\thadvisor{#1}}

\graphicspath{{./}{Figures/}}

%
% Writing the boiler plate
%
\newcommand{\makecover}{
   \@makecover
}
\def\@makecover{%
  \doublespace
  \thispagestyle{empty}
  \hbox{ }
  \vspace{-2.5cm}
  \begin{center}
  %%%%%%%%%%%%%%
  \includegraphics[width=0.2\textwidth]{IUCAA-logo.png}
  \vskip 0.4cm minus 0.2cm
  %%%%%%%%%%%%%%
  The Inter-University Center for Astronomy and Astrophysics \par
  Post Bag 4, Ganeshkhind, Pune, 411007, India
  \vskip 0.4cm minus 0.2cm
  {\Large \textbf \thtitle \setlength{\baselineskip}{30pt plus 3pt minus 6pt}\par}
  \vskip 0.3cm minus 0.2cm
  \normalsize
  A dissertation presented \par
  \vskip 0.1cm minus 0.2cm
  by 
  \vskip 0.1cm minus 0.2cm
  {\Large \thauthor \par}
  {\Large Supervisor: \thadvisor \par}
  \normalsize
  \vskip 0.2cm minus 0.2cm
  to \par
  %%%%%%%%%%%%%%
  \includegraphics[trim={1cm 0.5cm 1cm 0.5cm}, clip, width=0.25\textwidth]{Figures/JNU_new_logo.pdf}
  \vskip 0.2cm minus 0.4cm
  %%%%%%%%%%%%%%
  %\vskip 0.4cm minus 0.2cm
  \thdept \par
  \setlength{\baselineskip}{24pt minus 6pt}
  in partial fulfilment of the requirements \par
  for the degree of \par
  Doctor of Philosophy \par
  %in the subject of \par
  %\thsub
  %\vskip 0.4cm minus 0.2cm
  November \thyear
  \end{center}
  \singlespace
  \newpage
}

\renewcommand{\copyright}{
   \@copyright
}
\def\@copyright{%
   \thispagestyle{empty} 
   \hbox{ }
   \vspace{3.8in}
   \begin{center}
     \ooalign{
        \mathhexbox20D
        \crcr
        \hfil
        \raise .07ex
        \hbox{c}
        \hfil}~\thyear{}
        --- \thauthor
         \par
   All rights reserved.
   \end{center}
   \newpage
}

\newcommand{\abstract}[1]{
   \addcontentsline{toc}{chapter}{Abstract}
   \doublespace
   \noindent Dissertation Supervisor: 
      \thadvisor 
      \hfill
      \thauthor 
      \par
   \begin{center} 
      {\large \textbf \thtitle}
   \end{center}
   \vskip 0.4cm
   {\centerline {\bf Abstract}}
   \if@thdblspace
      \doublespace
   \else
      \singlespace
   \fi
   #1
   \clearpage 
}

\def\thefigure{\thechapter.\@arabic\c@figure}%
\def\thetable{\thechapter.\@arabic\c@table}%
\def\theplate{\thechapter.\@arabic\c@plate}%
%\def\fnum@figure{{\rmfamily Figure\space\thefigure.---}}%
\def\fnum@figure{{\bf {\rmfamily Figure\space\thefigure}}}% modifed by Zachory K. Berta on 15 March 2013, out of personal aesthetic preference
\def\fnum@table{{\rmfamily Table \thetable:}}%
\def\fnum@plate{{\bfseries Plate \theplate.}}%
\def\fps@figure{bp}%
\def\fps@table{bp}%
\def\fps@plate{bp}%
\def\eps@scaling{1.0}%
\newcommand\epsscale[1]{\gdef\eps@scaling{#1}}%
\newcommand\plotone[1]{%
 \typeout{Plotone included the file #1}
 \centering
 \leavevmode
 \includegraphics[width={\eps@scaling\columnwidth}]{#1}%
}%
\newcommand\plottwo[2]{{%
 \typeout{Plottwo included the files #1 #2}
 \centering
 \leavevmode
 \columnwidth=.45\columnwidth
 \includegraphics[width={\eps@scaling\columnwidth}]{#1}%
 \hfil
 \includegraphics[width={\eps@scaling\columnwidth}]{#2}%
}}%


% This bit moved from aasmod.sty (HJC):
% code below stolen from book.doc
% changed to make the heading References instead of
% Bibliography, and generate a ToC Entry - PMB
% could modify to match AAS Ref style more closely,
% but the current style seems fine to me

\renewenvironment{thebibliography}[1]{\chapter*{References\@mkboth
  {REFERENCES}{REFERENCES}}\addcontentsline{toc}{chapter}{References}\list
  {[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \usecounter{enumi}}
    \def\newblock{\hskip .11em plus .33em minus -.07em}
    \sloppy
    \sfcode`\.=1000\relax}

