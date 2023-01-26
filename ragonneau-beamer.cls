%% ragonneau-beamer.tex
%% Copyright 2023 Tom M. Ragonneau
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is Tom M. Ragonneau.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ragonneau-beamer}[2023/01/26 Beamer document class of Tom M. Ragonneau]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass[10pt]{beamer}

% Manage frame numbering in appendices
\RequirePackage{appendixnumberbeamer}

% Extra tools for LaTeX
\RequirePackage{etoolbox}

% Load theme
\usetheme{metropolis}
\metroset{
    titleformat=smallcaps,
    numbering=fraction,
    progressbar=frametitle,
    block=fill,
}

% Patch `Overfull \vbox (13.79993pt too high)' in title page
\def\titlepage{\usebeamertemplate{title page}}

% Patch `Token not allowed in a PDF string (Unicode)' in appendix
\pdfstringdefDisableCommands{\def\translate#1{#1}}

% Change theme colors
\definecolor{VeniceBlue}{HTML}{2F5675}
\definecolor{RobRoy}{HTML}{DAAD49}
\definecolor{Ziggurat}{HTML}{84B2B0}
\setbeamercolor{normal text}{fg=VeniceBlue!70!black,bg=black!2}
\setbeamercolor{alerted text}{fg=RobRoy!95!black}
\setbeamercolor{example text}{fg=Ziggurat!75!black}

% Change theme templates
\setbeamertemplate{section in toc}[sections numbered]

% Font for mathematics
\usefonttheme{professionalfonts}

% Font for standout frames
\setbeamerfont{standout}{size=\normalsize}

% Support for license
\RequirePackage[
    type={CC},
    modifier={by-sa},
    version={4.0},
]{doclicense}
\apptocmd{\doclicenseLongName}{license}{}{}

% Support for mathematics
\RequirePackage{ragonneau-maths}

% The following sets
%  - \giturl to the complete url of the git repository
%  - \giturlshort to the short url of the git repository
% It assumes that
%  - the current project is a (well-formed) git repository, and
%  - the command `git' is installed and accessible.
\RequirePackage{trimspaces}
\newread\giturlstream
\openin\giturlstream=|"./build_tools/giturl.sh"
\read\giturlstream to \giturl
\closein\giturlstream
\trim@spaces@in\giturl
\def\setgiturlshort#1://#2/\relax{\def\giturlshort{#2}}
\expandafter\setgiturlshort\giturl\relax

% Add a license frame after the title page
\renewcommand{\maketitle}{
    \begin{frame}[plain,noframenumbering]
        \titlepage
    \end{frame}

    \begin{frame}[standout]
    
        This work is licensed under a \doclicenseLongNameRef.
        \begin{center}
            \doclicenseImage[imagewidth=0.3\textwidth]
        \end{center}
    
        \bigskip
    
        The source code of this presentation is available at
        \begin{center}
            \normalfont\href{\giturl}{\texttt{\giturlshort}}.
        \end{center}
    
        It is based on the metropolis Beamer theme, available at
        \begin{center}
            \normalfont\href{https://github.com/matze/mtheme/}{\texttt{github.com/matze/mtheme}}.
        \end{center}
    \end{frame}
}
