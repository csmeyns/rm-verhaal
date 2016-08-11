%  An article class for a classically formatted humanities paper
%  humapap.cls
% Created by Maarten Steenhagen 
% Department of Philosophy
% University College London
% m.steenhagen.09@ucl.ac.uk
%  Drawing on, amongst others, Mark Sprevak's mds-article class
 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{humapap}[2013/03/31 Hello, this is the HumaPap article class. Currently this class is under development.]

\newcommand{\dropcap}[2]{\lettrine[lines=3, lhang=0.00, loversize=0.00]{{\pfancy #1}}{{\large #2}}}
\newcommand{\documenttitle}{\standardtitle}
\newcommand{\subtitle}{}
\newcommand{\ordinarytitle}{\MakeLowercase\title}
\newcommand{\firstpagefoot}{
         \let\thefootnote\relax\footnote[2]{
         ~\\\publication 
         \email
         {\tiny \gitfield}}
}
\newcommand{\thks}{}

\newcommand{\gitfield}{}
\newcommand{\gitspace}{}
\newcommand{\remoteurl}{\gitAbbrevHash}
\newcommand{\email}{}
\newcommand{\publication}{}
\renewcommand{\author}{}

\DeclareOption{sloppy}{\sloppy}
\DeclareOption{nofirstfoot}{\renewcommand{\firstpagefoot}{}}

% OPTION: DRAFT STAMP 
	\newcommand{\draft}{}
	\newcommand{\draftactive}{}
	\newcommand{\draftlow}{}
	\newcommand{\draftspace}{}
	\DeclareOption{dodraft}{
		\renewcommand{\draftactive}{\draft}
		\renewcommand{\draft}{\texttt{draft version - please do not cite}}
		\renewcommand{\draftspace}{\\}
		}
	%Override standard draft message
		\newcommand{\mydraft}[1]{
		\renewcommand{\draft}{\texttt{#1}}
		\renewcommand{\draftlow}{\footnotesize{\texttt{#1}}}
		}


\DeclareOption*{\PackageWarning{humapap}{Unknown option ‘\CurrentOption’}}
\DeclareOption{69}{\def\mypapersize{margin=0.8in, paperwidth=6in, paperheight=9in}}
\DeclareOption{a4}{\def\mypapersize{margin=1.2in, paperwidth=21cm, paperheight=29cm}}
\DeclareOption{journal}{\def\mypapersize{margin=0.65in, paperwidth=13.9cm, paperheight=21.61cm}}
\DeclareOption{US}{\def\mypapersize{margin=1.2in, paperwidth=21.6cm, paperheight=27.9cm}}
\DeclareOption{custom}{\def\mypapersize{margin=1in, paperwidth=17cm, paperheight=25cm}}

% Title options
\DeclareOption{high}{\renewcommand{\documenttitle}{\titletwo}}
\DeclareOption{bytitle}{\renewcommand{\documenttitle}{\titlethree}}
\DeclareOption{anonymise}{\renewcommand{\documenttitle}{\titleanon}}
\DeclareOption{presenter}{\renewcommand{\documenttitle}{\titlepres}
\renewcommand{\dropcap}[2]{\noindent #1#2}
}

\DeclareOption{git}{\renewcommand{\gitfield}{ \textsc{version:}~ \oldstylenums{\gitAuthorIsoDate}~(\remoteurl)}
\renewcommand{\gitspace}{\\}
}
% \DeclareOption{nosub}{\renewcommand{\printsubtitle}{~\\}}
\DeclareOption{thanks}{\renewcommand{\thks}{\vfil\noindent\footnotesize{\thethanks}}}
\DeclareOption{capstitle}{\renewcommand{\ordinarytitle}{\title}}
\ProcessOptions\relax

% \InputIfFileExists{myauthor.def}{\relax}{
%   \ClassWarningNoLine{mds-article}{myauthor.def not found, reverting to class default definitions}
% \def\theauthor{David Hume}
%   \def\myaffiliation{University of Edinburgh}
%   \def\theemail{david.hume@ed.ac.uk}
% 	\def\thetitle{the main title}
% 	\def\thesubtitle{a second title}
% 	\def\thehtitle{the header title}
% 	\def\thepublication{the publication} 
% 	\def\thejournal{the journal}
% 	\def\theyear{2013}
%   \def\mybibfile{/Users/msteenhagen/Dropbox/Own-Work/BIBLIOGRAPHY/BibDesk/books}
% }

\LoadClass[a5,12pt, twoside]{article}

% Packages (Imported from classicpaper69.sty: to be revised)
\RequirePackage{lettrine} % Drop-caps
\RequirePackage{graphics}  
\RequirePackage{color} 
%\usepackage{clock} 
\usepackage{epigraph}
\RequirePackage[colorlinks=true,linkcolor=black,urlcolor=black,citecolor=black]{hyperref}
\definecolor{grey}{cmyk}{0,0,0,0.8}
\usepackage{dialogue}
\usepackage{attrib}
\usepackage{lips}
\RequirePackage{setspace}
\RequirePackage[missing={.gin file unavailable}]{gitinfo}
%\usepackage[margin=0.8in, paperwidth=6in, paperheight=9in]{geometry}
\RequirePackage[\mypapersize]{geometry}
% Bibliography
\RequirePackage[style=authoryear-ibid, ibidtracker=constrict, autocite=inline]{biblatex}
\bibliography{/Users/msteenhagen/Dropbox/Own-Work/BIBLIOGRAPHY/BibDesk/books}



% Headers
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyfoot[LE,LO]{}
\fancyfoot[CE,CO]{\footnotesize{\draftactive}}
\fancyhead[RE,CE,LO,CO]{}
\fancyhead[LE]{\footnotesize{\oldstylenums{\thepage}~~~~~\textsc{\MakeLowercase\ordinarytitle}}}
\fancyhead[RO]{\footnotesize{\textsc{\ordinarytitle}~~~~~\oldstylenums{\thepage}}}
\renewcommand{\headrulewidth}{0.1pt}
\renewcommand{\footrulewidth}{0.0pt}

% Footnotes
\usepackage[marginal]{footmisc}
\setlength{\footnotemargin}{2mm}

% Spacing, paragraphs, indenting
\parindent 0.5cm \parskip 0.7mm \linespread{1.0}

% Typeface 
\RequirePackage{fontspec}
\RequirePackage{xltxtra}
\RequirePackage{xunicode}
\defaultfontfeatures{Scale=MatchLowercase,Mapping=tex-text}
\setmainfont{Hoefler Text}
\setmonofont[Scale=1,Ligatures=NoCommon]{Courier}
\newfontfamily\fancy [Contextuals={WordInitial,WordFinal}]{Hoefler Text}
\newfontfamily\fancyb [Contextuals={WordInitial,WordFinal}]{Cochin Bold}
\newfontfamily\fancyi [Contextuals={WordInitial,WordFinal}]{Cochin Italic}
\newfontfamily\pfancy [Contextuals={WordInitial,WordFinal}]{Hoefler Text}
\newfontfamily\notef [Contextuals={WordInitial,WordFinal}]{Arial}

% Author information

\newcommand{\theaffiliation}[1]{\newcommand{\affiliation}{#1}}
\newcommand{\thetitle}[1]{\renewcommand{\title}{#1}}
\newcommand{\thehtitle}[1]{\newcommand{\htitle}{#1}}
\newcommand{\myauthor}[1]{\renewcommand{\author}{#1}}
\newcommand{\mysubtitle}[1]{\renewcommand{\subtitle}{#1}}



\newcommand{\mydescription}[1]{\renewcommand{\publication}{#1}}
\newcommand{\myemail}[1]{\renewcommand{\email}{{\footnotesize \href{mailto:#1}{#1}}}}
\renewcommand{\thanks}[1]{\newcommand{\thethanks}{#1}}
\newcommand{\remote}[1]{\renewcommand{\remoteurl}{\href{#1\gitHash}{\gitAbbrevHash}}}

\newcommand{\thejournal}[1]{\newcommand{\journal}{#1}}
\newcommand{\theyear}[1]{\renewcommand{\year}{#1}}


%TITLES
	% Standard title
	\newcommand{\standardtitle}{
	\hypersetup{pdftitle = {\title}, pdfauthor= {\author}, pdfsubject={\publication}, pdfcreator={LaTeX; HumaPap Class}}
	\thispagestyle{empty}
	\begin{center}
	     \draftactive \draftspace
		\textsc{\MakeLowercase\publication}
		~ \\[2cm]
		\textsc{\Huge{\ordinarytitle}}
		\let\thefootnote\relax\footnote{~\\\textbf{\author}\\\email\\\textsc{\MakeLowercase\affiliation}\gitspace{\tiny \gitfield}}\\[0.1cm]
		{\fancyi \Large{\subtitle}}
	\end{center}
	}

\newcommand{\titletwo}{
\hypersetup{pdftitle = {\title}, pdfauthor= {\author}, pdfsubject={\publication}}
\thispagestyle{empty}
\begin{center}
\textsc{\publication}\\
~ \\[2cm]
\textsc{\Huge{\ordinarytitle}}\\[0.2cm]
\printsubtitle
\author\\
\textsc{\affiliation}
\end{center}
}

\newcommand{\titlethree}{
\hypersetup{pdftitle = {\title}, pdfauthor= {\author}, pdfsubject={\publication}}
\thispagestyle{empty}
\begin{center}
\draftactive
~ \\[2cm]
\textsc{\Huge{\ordinarytitle}}\\[0.2cm]
\subtitle
~\\
 by~\author
  \firstpagefoot
\end{center}
}

\newcommand{\titleanon}{
\hypersetup{pdftitle = {\title}, pdfauthor= {}, pdfsubject={}, pdfcreator={}, pdfproducer={}}
\thispagestyle{empty}
\begin{center}
{\textsc \publication}~\\
~ \\[2cm]
{\textsc {\Huge \ordinarytitle}}\\[0.2cm]
\subtitle
\end{center}
}

\newcommand{\titlepres}{
\hypersetup{pdftitle = {\title}, pdfauthor= {\author}, pdfsubject={\publication}}
\thispagestyle{empty}
\begin{center}
\textsc{\Huge{\ordinarytitle}}\\
\end{center}
\doublespacing
}

% New environment for abstract
\renewenvironment{abstract}{\vspace{1 mm}\begin{spacing}{0.9}\noindent\footnotesize \textsc{abstract}~~}{\end{spacing}\vspace{5 mm}}


%% Text can stretch a little into margins to avoid bad line-breaks
\setlength{\emergencystretch}{3em}


% Plain section command
\newcounter{pargr}
\newcommand{\sect}{\paragraph{\S~\arabic{pargr}.}\addtocounter{pargr}{1}}

\AtEndDocument{\thks
}
