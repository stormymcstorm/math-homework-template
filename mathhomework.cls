\ProvidesClass{mathhomework}
\NeedsTeXFormat{LaTeX2e}[1999/09/01]

\LoadClass{article}

% Load packages
\RequirePackage{ifthen}
\RequirePackage{fancyhdr}
\RequirePackage{extramarks}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{amsmath}

% Assignment Info Variables
\newcommand{\@coursetitle}{{\em No course title specified}}
\newcommand{\@courseinstructor}{{\em No instructor specified}}

\newcommand{\@student}{{\em No student specified}}

\newcommand{\@assignmenttitle}{{\em No assignment title specified}}
\newcommand{\@assignmentduedate}{{\em No due date specified}}

% Assignment Info Settters
\newcommand{\coursetitle}[1]{\renewcommand{\@coursetitle}{{#1}}}
\newcommand{\courseinstructor}[1]{\renewcommand{\@courseinstructor}{{#1}}}

\newcommand{\student}[1]{\renewcommand{\@student}{{#1}}}

\newcommand{\assignmenttitle}[1]{\renewcommand{\@assignmenttitle}{{#1}}}
\newcommand{\assignmentduedate}[1]{\renewcommand{\@assignmentduedate}{{#1}}}

% Document Settings
\topmargin=-0.45in
\evensidemargin=0in
\oddsidemargin=0in
\textwidth=6.5in
\textheight=9.0in
\headsep=0.25in

\linespread{1.1}

\pagestyle{fancy}

\lhead{\@student}
\chead{\@coursetitle\ (\@courseinstructor): \@assignmenttitle}
\cfoot{\thepage}

\renewcommand\headrulewidth{0.4pt}
\renewcommand\footrulewidth{0.4pt}

\setlength\parindent{0pt}

% Title Page
\title{
    \vspace{2in}
    \textmd{\textbf{\@coursetitle:\ \@assignmenttitle}}\\
    \normalsize\vspace{0.1in}\small{Due\ on\ \@assignmentduedate}\\
    \vspace{0.1in}\large{\textit{\@courseinstructor}}
    \vspace{3in}
}

\author{\@student}
\date{}

% Section configuration
\setcounter{secnumdepth}{0}

% Problem Sections
\newcommand{\@enterProblemHeader}[1]{
    % \nobreak\extramarks{}{Problem \arabic{#1} continued on next page\ldots}\nobreak{}
    \nobreak\extramarks{Problem \arabic{#1} (continued)}{Problem \arabic{#1} continued on next page\ldots}\nobreak{}
}

\newcommand{\@exitProblemHeader}[1]{
    \nobreak\extramarks{Problem \arabic{#1} (continued)}{Problem \arabic{#1} continued on next page\ldots}\nobreak{}
    \stepcounter{#1}
    \nobreak\extramarks{Problem \arabic{#1}}{}\nobreak{}
}

\newcounter{@problemCounter}
\setcounter{@problemCounter}{1}
\nobreak\extramarks{Problem \arabic{@problemCounter}}{}\nobreak{}

\newenvironment{problem}[1][]{
    \section*{Problem \arabic{@problemCounter} (\large{#1})}
    \@enterProblemHeader{@problemCounter}

    \newenvironment{solution}[1][Solution:]{
        \subsubsection*{##1}
        \noindent\ignorespaces
    }{}

    \newcommand{\labeleq}[1]{\label{eq:\thesubsection##1}}
    \newcommand{\refeq}[1]{\ref{eq:\thesubsection##1}}
}{
    \@exitProblemHeader{@problemCounter}
    \setcounter{equation}{0}
    \par\noindent%
    \ignorespacesafterend
}