%%
%% Customizações do abnTeX2 (http://abnTeX2.googlecode.com) para a Logatti feitas pelo aluno Guilherme Diego Albino Francisco
%%
%% 
%%
%% Further information about abnTeX2 are available on http://abntex2.googlecode.com/
%%
\newcommand{\MONTH}{%
  \ifcase\the\month
  \or Janeiro% 1
  \or Fevereiro% 2
  \or Março% 3
  \or Abril% 4
  \or Maio% 5
  \or Junho% 6
  \or Julho% 7
  \or Agosto% 8
  \or Setembro% 9
  \or Outubro% 10
  \or Novembro% 11
  \or Dezembro% 12
  \fi}

\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{abntex2-logatti}[2018/20/05 v1.0 abnTeX2-logatti]

\LoadClassWithOptions{abntex2}

% -----------------------------------------------------------------------------
% PACOTES UTILIZADOS
% -----------------------------------------------------------------------------

\usepackage{cmap}	% Mapear caracteres especiais no PDF
%\usepackage{lmodern}	% Usa a fonte Latin Modern
\usepackage[T1]{fontenc}% Selecao de codigos de fonte.
\usepackage[utf8]{inputenc}% Codificacao do documento (conversão automática  dos acentos)

%\usepackage{fontspec}   % para o xelatex
%%\defaultfontfeatures{Ligatures={TeX}} % para o xelatex
%%\setsansfont{Gill Sans} % para o xelatex
%\setmainfont[Mapping=tex-text]{Times New Roman} % para o xelatex

\usepackage{lastpage}	% Usado pela Ficha catalográfica
\usepackage{indentfirst}% Indenta o primeiro parágrafo de cada seção.
\usepackage{xcolor}
\usepackage[normalem]{ulem} 
\usepackage{graphicx}			% Inclusão de gráficos
\usepackage{microtype} 			% para melhorias de justificação
\usepackage{amsmath}
\usepackage[brazilian,hyperpageref]{backref}	 % Paginas com as citações na bibl
\usepackage[alf,abnt-emphasize=bf,abnt-etal-list=5]{abntex2cite} % Padrao de citacao alfabetico e com destaque em negrito
\usepackage[printonlyused]{acronym} % lista de simbolos
\usepackage{epstopdf}
\usepackage{mathptmx}


% Configurações do pacote backref
% Usado sem a opção hyperpageref de backref
\renewcommand{\backrefpagesname}{}
% Texto padrão antes do número das páginas
\renewcommand{\backref}{}
% Define os textos da citação
\renewcommand*{\backrefalt}[4]{%

}%
% ---

\definecolor{black}{RGB}{0,0,0}

% informações do PDF

\hypersetup{
     	%pagebackref=true,
		pdftitle={\@title}, 
		pdfauthor={\@author},
    	pdfsubject={\imprimirpreambulo},
	    pdfcreator={LaTeX with abnTeX2},
		pdfkeywords={TCC}, 
		colorlinks=true,       		% false: boxed links; true: colored links
    	linkcolor=black,          	% color of internal links
    	citecolor=black,        		% color of links to bibliography
    	filecolor=black,      		% color of file links
		urlcolor=black,
		bookmarksdepth=4
}



% Cria um novo cabeçalho, pois o da Abnetx2 tem underline e nome da seção na parte superior
\makepagestyle{meuestilo}
\makeevenhead{meuestilo}{\ABNTEXfontereduzida\thepage}{}{}
\makeoddhead{meuestilo}{}{}{\ABNTEXfontereduzida\thepage}
%\makeheadrule{abntheadings}{\textwidth}{\normalrulethickness}

\renewcommand{\textual}{%
\pagestyle{meuestilo}
\aliaspagestyle{chapter}{abntchapfirst}% customizing chapter pagestyle
\nouppercaseheads
}
\let\elementostextuais\textual
\let\textuais\textual
% ---


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LISTAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% cria a lista de quadros
\newcommand{\listofquadrosname}{Lista de Quadros}
\newcommand{\quadroname}{Quadro}
\newfloat[chapter]{quadro}{loq}{\quadroname}
\newlistof{listofquadros}{loq}{\listofquadrosname}
\newlistentry{quadro}{loq}{0}

\counterwithout{quadro}{chapter}
\renewcommand{\cftquadroname}{\quadroname\space}
\renewcommand*{\cftquadroaftersnum}{\hfill--\hfill}




% -----------------------------------------------------------------------------
% CONFIGURACAO DO SUMARIO
% -----------------------------------------------------------------------------
% Modifica o espaçamento no sumário
% Nao ha espacos, exceto para as entradas de capitulos
%\setlength{\cftbeforeparagraphskip}{0pt}
%\setlength{\cftbeforesubsectionskip}{0pt}
%\setlength{\cftbeforesectionskip}{0pt}
%\setlength{\cftbeforesubsubsectionskip}{0pt}
%\setlength{\cftbeforechapterskip}{\onelineskip}

% Modifica a formatacao dos textos

% Secao Primaria (Chapter): Caixa alta, Negrito, tamanho 12 

\settocpreprocessor{chapter}{%
  \let\tempf@rtoc\f@rtoc%
  \def\f@rtoc{%
  \texorpdfstring{\bfseries\MakeTextUppercase{\tempf@rtoc}}{\tempf@rtoc}}%
}



% Secao secundaria (Section) Normal
\renewcommand*{\cftsectionfont}{\normalfont}
% Secao terciaria (Subsection) Negrito
%\renewcommand*{\cftsubsectionfont}{\bfseries}
\renewcommand*{\cftsubsectionfont}{\normalfont}

% Secao quaternaria (Subsubsection) Itálico
\renewcommand*{\cftsubsubsectionfont}{\normalfont\itshape}
\renewcommand*{\cftsubsubsectionfont}{\normalfont}

% Seção quinaria (subsubsubsection) Caixa baixa, sem negrito, tamanho 12
\renewcommand*{\cftsubsubsubsectionfont}{\normalfont}
\renewcommand*{\cftparagraphfont}{\normalfont}


% Fontes de títulos no documento
% Capitulo  Negrito + MakeUpperCase (via chapter=TITLE)
\renewcommand{\ABNTEXchapterfont}{\bfseries}
%\renewcommand{\ABNTEXchapterfont}{\rmfamily}
\renewcommand{\ABNTEXchapterfontsize}{\normalsize}
\setboolean{ABNTEXupperchapter}{true}

\renewcommand{\ABNTEXpartfont}{\ABNTEXchapterfont}

\renewcommand{\ABNTEXpartfontsize}{\normalfont} % altera tamanho da fonte de anexos, partes e apêndices
\renewcommand{\cftpartfont}{\bfseries} % altera tipo da fonte da fonte de anexos, partes e apêndices
\renewcommand{\cftpartpagefont}{\normalsize\cftchapterfont} % altera fonte dos números no sumário de anexos, partes e apêndices

% Section Normal
\renewcommand{\ABNTEXsectionfont}{\normalfont}
\renewcommand{\ABNTEXsectionfontsize}{\normalsize}

% Subsecao Negrito

%\renewcommand{\ABNTEXsubsectionfont}{\bfseries}
\renewcommand{\ABNTEXsubsectionfontsize}{\normalsize}

% SubSubSecao Itálico
%\renewcommand{\ABNTEXsubsubsectionfont}{\itshape}
\renewcommand{\ABNTEXsubsubsectionfontsize}{\normalsize}


% SubSubSubSecao Itálico e negrito
%\setparaheadstyle{\itshape\bfseries\rmfamily} % Altera o estilo do quinto nível (subsubsubsection)
%\renewcommand{\ABNTEXsubsubsubsectionfont}{\itshape\bfseries}
\renewcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize}
%\renewcommand{\cftparagraphfont}{\itshape\bfseries}
\renewcommand{\cftparagraphpagefont}{\cftparagraphfont}






\addto\captionsbrazil{
\renewcommand{\anexosname}{\textbf{ANEXOS}}
\renewcommand{\apendicesname}{\textbf{APÊNDICES}}
\renewcommand{\bibname}{REFER\^ENCIAS BIBLIOGRÁFICAS}
}

% -----------------------------------------------------------------------------
% FORMATACAO DAS PAGINAS
% -----------------------------------------------------------------------------
% Definicao das margens e espaçamentos
\setlrmarginsandblock{3cm}{2cm}{*} % externa / interna
\setulmarginsandblock{3cm}{2cm}{*} % superior / inferior
\checkandfixthelayout

% Recuo do paragrafo
\setlength{\parindent}{1.25cm} % normativo citatanto o valor de 1,25 qto 1,5cm
% espaco entre os paragrafos
\setlength{\parskip}{0.2cm} % tente também \onelineskip 

% Espacamentos nos titulos:
% chapter
\setlength{\beforechapskip}{-\onelineskip} %com 0 nao funcionou
\setlength{\afterchapskip}{\onelineskip} % antes do titulo de capitulo
%\setlength\beforechapskip{-18pt} 

% section
\setbeforesecskip{\onelineskip}
\setaftersecskip{\onelineskip}

% subsection
\setbeforesubsecskip{\onelineskip}
\setaftersubsecskip{\onelineskip}

% subsubsection
\setbeforesubsubsecskip{\onelineskip}
\setaftersubsubsecskip{\onelineskip}

% subsubsubsection
\setbeforeparaskip{\onelineskip}
\setafterparaskip{\onelineskip}



% -----------------------------------------------------------------------------
%  NOVOS COMANDOS PARA FACILITAR ALGUMAS COISAS
% -----------------------------------------------------------------------------

%% Cria o comando \curso. Utilizado na capa / folha de {rosto, aprovacao}
\providecommand{\imprimircurso}{}
\newcommand{\curso}[1]{\renewcommand{\imprimircurso}{#1}}



% Cria o comando \subtitulo. A norma define que o TITULO deve ser em caixa alta
% negrito, mas o subtitulo deve ser em caixa baixa.
\providecommand{\imprimirsubtitulo}{}
\newcommand{\subtitulo}[1]{\renewcommand{\imprimirsubtitulo}{#1}}

\providecommand{\ABNTRGdata}{}
\newcommand{\RG}[1]{\renewcommand{\ABNTRGdata}{#1}}


% Data da defesa deve ser por extenso na folha de aprovacao
\newcommand{\defesa}{}

% -----------------------------------------------------------------------------
% CAPA
% -----------------------------------------------------------------------------

\renewcommand{\imprimircapa}{%
  \begin{capa}%
    \center%
    {\Large\bfseries\MakeUppercase FACULDADES INTEGRADAS DE ARARAQUARA  }\\%
    {\Large\bfseries\MakeUppercase\imprimircurso}%
    \vspace*{4cm}%
    \par
    {\Large\bfseries\MakeUppercase\imprimirautor}%
    \vspace*{4cm}%
    \par%
    {\Large\bfseries\MakeUppercase\imprimirtitulo}\abntex@ifnotempty{\imprimirsubtitulo}{{\bfseries:%
      \par%
      \imprimirsubtitulo}%
    }%
    \par%
    \vspace*{\fill}%
    \par%
    {\Large\bfseries\imprimirlocal}%
    \par%
    {\Large\bfseries\imprimirdata}%
%    \vspace*{1cm}%
  \end{capa}%
}


% -----------------------------------------------------------------------------
% FOLHA DE ROSTO
% -----------------------------------------------------------------------------

\renewcommand{\folhaderosto}{
  \begin{center}%
    {\Large\bfseries\MakeUppercase\imprimirautor}%
    \vspace*{4cm}%
    \par%
    
    {\bfseries\Large\MakeUppercase\imprimirtitulo}\abntex@ifnotempty{\imprimirsubtitulo}{{\bfseries:%
      \par%
      \imprimirsubtitulo}%
    }%
    \vspace*{4cm}%
    \par%
    \abntex@ifnotempty{\imprimirpreambulo\imprimircurso}{%
      \hspace*{7cm}%
      \begin{minipage}{.5\textwidth}%
        \SingleSpacing%
        \imprimirpreambulo\imprimircurso%
      \end{minipage}%
%      \vspace*{\fill}%
    }%
%    \vspace*{0.2cm}%
    \par%
    \vspace*{3cm}%
    {\Large\bfseries\imprimirorientadorRotulo~\imprimirorientador}%}
    \abntex@ifnotempty{\imprimircoorientador}{%
      {\hspace*{7cm}\begin{minipage}{.5\textwidth}%
      \SingleSpacing%
      \imprimircoorientadorRotulo~\imprimircoorientador%
      \end{minipage}%
      }%
    }%
    \vspace*{\fill}%
    \par%
    {\large\imprimirlocal}%
    \par%
    {\large\imprimirdata}%
  \end{center}%
}%

% -----------------------------------------------------------------------------
% DEDICATÓRIA E EPÍGRAFE
% -----------------------------------------------------------------------------

\renewenvironment{dedicatoria}{
  \par
  \vspace*{\fill}
  \begin{flushright}
  \begin{minipage}{0.6\textwidth}
}{
  \vspace{2cm}
  \end{minipage}
  \end{flushright}
  \newpage
}

\renewenvironment{epigrafe}{
  \par
  \vspace*{\fill}
  \begin{flushright}
  \begin{minipage}{0.6\textwidth}
}{
  \vspace{2cm}
  \end{minipage}
  \end{flushright}
  \newpage
}



% -----------------------------------------------------------------------------
% AJUSTES
% -----------------------------------------------------------------------------


\renewcommand{\ABNTEXsubsubsubsectionfont}{\normalfont}
\renewcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize}

% Coloca a citação de equação, \autoref{label}, no formato Equação (2.1)
\def\equationautorefname~#1\null{Equa\c c\~ao~(#1)\null}
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% Altera o tamanho da fonte para \footnotesize 
\captionnamefont{\ABNTEXfontereduzida}
\captiontitlefont{\ABNTEXfontereduzida}
% % % % % % % % % % % % % % % % % % % % % %

\renewenvironment{resumo}[1][\resumoname]{%
   \PRIVATEbookmarkthis{#1}
   \renewcommand{\abstractnamefont}{\chaptitlefont}
   \renewcommand{\abstractname}{\ABNTEXchapterupperifneeded{#1}}
   \begin{abstract}
   \SingleSpace
  }{\end{abstract}\PRIVATEclearpageifneeded}


% -----------------------------------------------------------------------
% Fonte Times New Roman
% ----------------------------------------------------------------------

% \newboolean{ABNTtimesfont}
% \setboolean{ABNTtimesfont}{true}




% \ifthenelse{\boolean{ABNTtimesfont}}% if `times'option enabled...
% {\IfFileExists{mathptmx.sty}%  try `mathptmx' first
%     {\RequirePackage{mathptmx}}% 
%     {\IfFileExists{mathptm.sty}% if not installed, try `mathptm'
%       {\RequirePackage{mathptm}}%
%       {\IfFileExists{times.sty} % 
%         {\RequirePackage{times}}%
%         {\renewcommand{\rmdefault}{ptm}}%
%       }%
%     }%
%  \IfFileExists{helvet.sty}% including also Helvetica as sans serif.
%     {\RequirePackage{helvet}}%
%     {\IfFileExists{helvetic.sty}%
%       {\RequirePackage{helvetic}}%
%       {\renewcommand{\rmdefault}{phv}}%
%     }%
% }%
% {}