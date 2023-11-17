% INF-GF.cls
% Marzo 2015      Ezequiel O. Fogliatto <fogliatto (at) cab.cnea.gov.ar>
% Noviembre 2015  Modificado por Simón Claramonte <simon.claramonte (at) cab.cnea.gov.ar>
% Enero 2017      Modificado por Leonardo Salazar Alarcón <leonardo.salazar.alarcon (at) cab.cnea.gov.ar> (Informes técnicos MBE)
% Noviembre 2019  Modificado por Guillermo Rozas <grozas (at) cab.cnea.gov.ar> (Informes técnicos GF, control de versión)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License. To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/ or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%
%
%       CLASE PARA LA GENERACIÓN DE INFORMES DE LA GERENCIA DE FÍSICA (CAB) 
%
%
%
%
%
%
% --- Estructura de la clase: secci\'on de identificaci\'on
% ---
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{INF-GF}[2023/11/17 - Informes Tecnicos de la Gerencia de Fisica (CAB) - v0.3.1 (FO-INN_03-001.r0)]


% --- Estructura de la clase: declaraci\'on de opciones
% ---
% Esta clase extiende la clase article

% División que genera el informe
\DeclareOption{dys}{\newcommand*{\division}{DISPOSITIVOS Y SENSORES}
                    \newcommand*{\divcode}{03DYS}}
\DeclareOption{dys_mbe}{\newcommand*{\division}{DISPOSITIVOS Y SENSORES - MBE}
                    \newcommand*{\divcode}{03DYS\_MBE}}
\DeclareOption{lpo}{\newcommand*{\division}{FOTÓNICA Y OPTOELECTRÓNICA}
                    \newcommand*{\divcode}{03LFO}}
\DeclareOption{qcl}{\newcommand*{\division}{PROYECTO QCL}
                    \newcommand*{\divcode}{03/QCL}}
                    
% Tipo de informe
\DeclareOption{int}{\newcommand*{\tipoinforme}{Informe Técnico}
                    \newcommand*{\tipocode}{INT\kern-0.14em}
                    \newcommand*{\titlesecdos}{SOLICITANTE}
                    \newcommand*{\revisionIT}[1]{\gdef\@revisionIT{}}}
\DeclareOption{po}{\newcommand*{\tipoinforme}{Procedimiento Operativo}
                   \newcommand*{\tipocode}{PO}
                   \newcommand*{\titlesecdos}{ALCANCE}
                   \newcommand*{\revisionIT}[1]{\gdef\@revisionIT{\,Rev.~#1}}}

% Generacion de pdf sin las marcas de cambios
\DeclareOption{vfinal}{\PassOptionsToPackage{final}{changes}}

% Lee todas las opciones no declaradas previamente de documentclass, y las pasa a article
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% --- Estructura de la clase: ejecuci\'on de opciones
% ---
\ProcessOptions\relax

% Carga de clase base
\LoadClass{article}




% Carga de paquetes adicionales
\RequirePackage[T1]{fontenc}          % Usar T1 enconding
\RequirePackage[utf8]{inputenc}       % Uso adecuado de las tildes
\RequirePackage{fancyhdr}             % Encabezados y pies de p\'agina
\RequirePackage{cals}                 % Generaci\'on de tablas con tama\~nos absolutos
\RequirePackage{lastpage}             % Determina la cantidad total de p\'aginas
\RequirePackage{graphicx}             % Manejo de gr\'aficos
\RequirePackage{setspace}             % Interlineado en partes espec\'ificas
\RequirePackage{indentfirst}          % Genera sangr\'ia para el primer p\'arrafo despu\'es del t\'itulo de secci\'on
\RequirePackage{amsmath,amsfonts}     % S\'imbolos matem\'aticos
% \RequirePackage{fixltx2e}             % Multicolumn
\RequirePackage{placeins}             % Fuerza el salto de p\'agina despu\'es de figuras con \FloatBarrier
\RequirePackage[intoc]{nomencl}       % Tabla de abreviaturas
\RequirePackage[format=hang]{caption} % Formato de captions
\RequirePackage{xpatch}               % Espacio en tabla de abreviaturas
\RequirePackage{multirow}             % Unir filas en tablas
\RequirePackage{booktabs}             % Formato de tablas
\RequirePackage[a4paper]{geometry}             % Formato de margenes (distinto para la primera pagina)
\RequirePackage[english,spanish]{babel}
\RequirePackage{blindtext}               % Opcional. Solo para insertar texto "dummy"
\RequirePackage[nottoc,notlof,notlot,numbib]{tocbibind}    % Manejo de bibliograf\'ia en TOC
%\RequirePackage[authormarkup=footnote,authormarkuptext=name]{changes}              % Edici\'on - correcci\'on del documento
\RequirePackage[width=0.95\textwidth]{subcaption}


% Margenes
\geometry{inner=2.4cm,width=17cm,height=24cm,head=2cm,headsep=10pt,top=3.36cm}


% Sangria e interlineado
\setlength{\parindent}{0.75cm}          % Sangria
\renewcommand{\baselinestretch}{1.1}   % Factor de espacio entre lineas
\setlength{\parskip}{2mm}               % Espacio extra entre p\'arrafos
%%\setlength{\textfloatsep}{12pt}
%%\setlength{\abovedisplayskip}{6pt}
%%\setlength{\belowdisplayskip}{6pt}
%%\setlength{\abovecaptionskip}{6pt}
%%\setlength{\belowcaptionskip}{6pt}


% Uso de Helvetica (parecida a Arial) como fuente
\renewcommand{\rmdefault}{phv}
\renewcommand{\sfdefault}{phv}


% Definicion de las macros objetivo, alcance, revisores, etc
\newcommand*{\numeroIT}[1]{\gdef\@numeroIT{#1}}
\newcommand{\codigoinf}{\tipocode-INN\_\divcode-\@numeroIT \@revisionIT}
\newcommand*{\objetivo}[1]{\gdef\@objetivo{#1}}
\newcommand*{\solicitante}[1]{\gdef\@solicitante{#1}}
\newcommand*{\autores}[3]{{\gdef\@fautor{#1}} {\gdef\@sautor{#2}} {\gdef\@tautor{#3}}} 
\newcommand*{\revisores}[3]{{\gdef\@frev{#1}} {\gdef\@srev{#2}} {\gdef\@trev{#3}}}
\newcommand*{\calidad}[1]{\gdef\@calidad{#1}}
\newcommand*{\aprobacion}[1]{\gdef\@aprobacion{#1}}
\newcommand*{\titulo}[1]{\gdef\@titulo{#1}}
\newcommand*{\fecha}[1]{\gdef\@fecha{#1}}

% Captions
\captionsetup{width=0.85\textwidth,textfont=footnotesize,labelfont={bf,small},format=hang}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         Abreviaturas                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makenomenclature

% Quita el nombre de la seccion abreviaturas
\renewcommand{\nomname}{Definiciones, acr\'onimos y s\'imbolos}

% Coloca las abreviaturas en negrita
%\renewcommand{\nomlabel}[1]{\bf #1}

% Inserta espacio antes de cada item
\patchcmd{\thenomenclature}
  {\leftmargin\labelwidth}
  {\leftmargin\labelwidth\itemindent 0.75cm }
  {}{}

% Creacion de grupos: Acronimos (A) y nomenclaturas (N)
\RequirePackage{ifthen}
\renewcommand{\nomgroup}[1]{%
    \ifthenelse{\equal{#1}{A}}{\item[\textbf{Acr\'onimos}]}{%
        \ifthenelse{\equal{#1}{N}}{\item[\textbf{S\'imbolos}]}{}}}





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                Caratula                                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand*{\pnormal}[1]{\fontsize{11pt}{13pt}\selectfont #1}
\newcommand*{\psmall}[1]{\fontsize{10pt}{11pt}\selectfont #1}
\newcommand*{\plarge}[1]{\fontsize{12pt}{14pt}\selectfont #1}


\newcommand{\portada}{

    % Fija el ajuste de la primera pagina. Se pueden cambiar los margenes globales del documento sin afectar la forma de esta pagina
    \newgeometry{inner=2cm,width=17cm,height=24cm,head=2cm,headsep=10pt,top=3.36cm}
    

        \newpage     
        \vspace*{-0.8in}    

        \def\cals@framecs@width{2pt}
        \def\cals@framers@width{2pt}
        \def\cals@rs@width{2pt}
        \def\cals@cs@width{2pt}

        \begin{calstable}
            \colwidths{{2.8cm}{10.26cm}{4.3cm}}
            \brow 
                \alignC \nullcell{ltr} \alignC 
		\cell{{\vfil \plarge{ \bf GERENCIA DE F{\'I}SICA-GAIDI}} \\[4pt] \pnormal{\division}}
                \cell{\vfil \pnormal{\codigoinf}}  
                \ht\cals@current@row=2cm 
            \erow
            \brow 
                \nullcell{lrb}\spancontent{\vfil \includegraphics[width=0.9\linewidth]{Logo_CNEA}} 
                \cell{\vfil \plarge{ \bf \tipoinforme}}\cell{\vfil \pnormal{P\'agina: \thepage \hspace{1pt} de \pageref{LastPage}}} 
                \ht\cals@current@row=0.85cm
            \erow
        \end{calstable}     
        
        \begin{calstable}
            \colwidths{{2.25cm}{15.11cm}}
            \brow 
                \alignC \cell{\vfil \plarge{ \bf T\'ITULO:}} \def\cals@borderL{0pt} \cell{\vfil \bf \pnormal{\@titulo}}  
                \ht\cals@current@row=1.35cm 
            \erow
        \end{calstable}  
 %%%%%%%%%%%%%%%% editado por Leonardo%%%%%%%%%%%%%%       
%        \begin{calstable}
%            \colwidths{{17.36cm}}
%            \brow 
%                \cell{
%                    \vspace{10pt}            
%                    {\plarge{\bf Objetivo:}} \par
%                    {\parindent=0.75cm \pnormal{\@objetivo}} \\ 
%                     
%                    {\plarge{\bf Solicitante:}} \par
%                    {\parindent=0.75cm \pnormal{\@solicitante}}
%                 } 
%                \ht\cals@current@row=11cm 
%            \erow
%        \end{calstable}            
%
%        \begin{calstable}
%            \colwidths{{2.48cm}{14.88cm}}
%            \brow 
%                \alignC \nullcell{ltb} \nullcell{rtb}\spancontent{\vfil \bf \pnormal{Prepar\'o} } 
%               \ht\cals@current@row=1.15cm 
%            \erow
%        \end{calstable} 
%        
%        \begin{calstable}
%            \colwidths{{8.68cm}}
%            \brow 
%            \alignR \spancontent{\pnormal{Firma}} 
%                \cell{\vfill \pnormal{\@fautor}} 
%             \spancontent{\pnormal{Firma}}
%                \cell{\vfill \pnormal{\@sautor}}             % Autores
%                \ht\cals@current@row=2.5cm 
%            \erow
%        \end{calstable} 
%        
%        \begin{calstable}
%        	\colwidths{{0.5cm}{8.18cm}}
%        	\brow 
%          	\alignC \nullcell{ltb} \nullcell{rtb}\spancontent{\vfil \bf \pnormal{Aprob\'o}} 
%          	\alignC \nullcell{ltb} \nullcell{rtb}\spancontent{\vfil \bf \pnormal{Calidad}} 
%        	\ht\cals@current@row=1.15cm 
%        	\erow
%        \end{calstable} 
%        
%        \begin{calstable}
%        	\colwidths{{8.68cm}}
%        	\brow 
%        	\spancontent{\pnormal{Firma}}
%        \alignL \cell{\vfill \pnormal{\@aprobacion}\hspace{1cm}\pnormal{Fecha}} 
%        \spancontent{\pnormal{Firma}}
%        \cell{\vfill \pnormal{\@calidad} \hspace{1cm}\pnormal{Fecha}}                  % Aprobacion
%        	\ht\cals@current@row=2.5cm 
%        	\erow
%        \end{calstable} 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%Tomado del de Simon
\begin{calstable}
	\colwidths{{17.36cm}}
	\brow 
	\cell{
		\vspace{10pt}            
		{\section{\bf OBJETIVO}} \par
		{\parindent=0.75cm \pnormal{\@objetivo}} \\ 
		
		{\section{\bf \titlesecdos}} \par
		{\parindent=0.75cm \pnormal{\@solicitante}}
		\vspace{10pt}
	} 
	\ht\cals@current@row=10cm 
	\erow
\end{calstable}

%%%%%%%%%

\begin{calstable}
	\colwidths{{17.36cm}}
	\brow
	\alignC 
	\cell{
		\vspace{3pt}            
		{\vfill \bf \pnormal{Preparó}} \par
		\vspace{3pt}   
	} 
	\ht\cals@current@row=0.8cm 
	\erow
\end{calstable}  

%%%%%%%%%

\begin{calstable}
	\colwidths{{2.48cm}}
	\brow 
	\alignC \nullcell{ltb} \nullcell{rtb}\nullcell{rtb}\nullcell{rtb}\nullcell{rtb}\spancontent{\vfil \bf \pnormal{Nombre y Apellido (Filiación)} } 
	%                \nullcell{ltb} \nullcell{tb} \nullcell{rtb} \spancontent{\vfil \bf \pnormal{Revis\'o} } 
	%               \cell{\vfil \bf \begin{spacing}{1}\pnormal{Intervino calidad}\end{spacing}} 
	\nullcell{ltb} \nullcell{rtb}\spancontent{\vfil \bf \pnormal{Firma} } 
	\ht\cals@current@row=1.15cm 
	\erow
\end{calstable} 

\begin{calstable}
	\colwidths{{2.48cm}}
	\brow 
	\nullcell{ltb} \nullcell{rtb}\nullcell{rtb}\nullcell{rtb}\nullcell{rtb}\spancontent{\vfil {\psmall{\@fautor}} \\ \\ {\psmall{\@sautor}} \\ {\psmall{\@tautor}}}              % Autores
	\nullcell{ltb}\cell{\vfill \pnormal{}}            % Firma
	\ht\cals@current@row=2.5cm 
	\erow
\end{calstable}

%%%%%%%%%

\begin{calstable}
	\colwidths{{17.36cm}}
	\brow
	\alignC 
	\cell{
		\vspace{3pt}            
		{\vfill \bf \pnormal{Aprobó}} \par
		\vspace{3pt}   
	} 
	\ht\cals@current@row=0.8cm 
	\erow
\end{calstable}

\begin{calstable}
	\colwidths{{2.48cm}}
	\brow 
	\alignC \nullcell{ltb} \nullcell{rtb}\nullcell{rtb}\spancontent{\vfil \bf \pnormal{Nombre y Apellido} } 
	\nullcell{ltb} \nullcell{rtb}\spancontent{\vfil \bf \pnormal{Fecha} }
	\nullcell{ltb} \nullcell{rtb}\spancontent{\vfil \bf \pnormal{Firma} } 
	\ht\cals@current@row=1cm 
	\erow
\end{calstable}

\begin{calstable}
	\colwidths{{2.48cm}}
	\brow 
	\alignC\nullcell{ltb} \nullcell{rtb}\nullcell{rtb}\spancontent{\vfil \psmall{\@aprobacion} } 
	\nullcell{ltb} \nullcell{rtb}\spancontent{\vfil \pnormal{\@fecha} }
	\nullcell{ltb} \nullcell{rtb}\spancontent{\vfil \pnormal{} } 
	\ht\cals@current@row=1.5cm 
	\erow
\end{calstable}
        
        \begin{calstable}
            \colwidths{{1.15cm}{16.22cm}}
            \brow 
                \cell{\psmall{ \bf \vspace{1pt} NOTA:}} \def\cals@borderL{0pt} 
                \cell{ \begin{spacing}{1.2} \psmall{ Este documento es propiedad de CNEA y se reserva todos los derechos legales sobre \'el. No est\'a permitida la explotaci\'on, transferencia o liberaci\'on de ninguna informaci\'on en el contenido, ni hacer reproducciones y entregarlas a terceros sin un acuerdo previo y escrito de CNEA.}\end{spacing}} 
                \ht\cals@current@row=1.6cm 
            \erow
        \end{calstable}     

    \restoregeometry

  } 





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                Cabeceras                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Primera p\'agina
\fancypagestyle{firstpage}{%
    \fancyhf{}                            % Borra todos los campos
    \renewcommand{\headrulewidth}{0pt}    % Elimina la l\'inea del encabezado
    \renewcommand{\footrulewidth}{0pt}    % Elimina la l\'inea del pie de p\'agina
}

% Resto de las p\'aginas
\fancypagestyle{followingpage}{
    \fancyhf{}                            % Borra todos los campos
    \renewcommand{\headrulewidth}{0pt}    % Elimina la l\'inea del encabezado
    \renewcommand{\footrulewidth}{0pt}    % Elimina la l\'inea del pie de p\'agina
    \fancyhead[C]{
        \begin{minipage}{17.5cm}
        \makeatletter
            \begin{calstable}
                \def\cals@framecs@width{1.5pt}
                \def\cals@framers@width{1.5pt}
                \def\cals@rs@width{1.5pt}
                \def\cals@cs@width{1.5pt}    
                \colwidths{{2.8cm}{9.9cm}{4.3cm}}
                \brow 
                    \alignC \cell{\vfil \huge \bf CNEA} 
                    \cell{\vfil \bf \@titulo}              
                    \cell{\vfil \codigoinf \\[2pt] P\'agina: \thepage \hspace{1pt} de \pageref{LastPage} }
                    \ht\cals@current@row=1.9cm 
                \erow
            \end{calstable}
        \makeatother
        \end{minipage}
    }
}

\pagestyle{followingpage}
\AtBeginDocument{\thispagestyle{firstpage}}










%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                Titulos de secciones y subsecciones                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Agrega al punto despues del numero de (sub/subsub)seccion
%\renewcommand{\thesection}      {\textup{\arabic{section}.}}
%\renewcommand{\thesubsection}   {\textup{\thesection\arabic{subsection}.}}
%\renewcommand{\thesubsubsection}{\textup{\thesubsection \arabic{subsubsection}.}}


% Formato del titulo de la (sub/subsub)seccion
\renewcommand{\section}{\@startsection{section}{1}{0mm}%
                                     {-12pt}%
                                     {11pt}%                Espacio despues del t\'itulo
                                     {\bfseries\Large}}%
\renewcommand{\subsection}{\@startsection{subsection}{2}{0mm}%
                                     {-12pt}%
                                     {11pt}%
                                     {\bfseries\large}}%
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{0mm}%
                                     {-12pt}%
                                     {11pt}%
                                     {\bfseries\normalsize}}%                                     









%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           Tabla de contenidos                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Cambio del nombre
\AtBeginDocument{\renewcommand{\contentsname}{{\'INDICE}}}

% Centrado del nombre, comienza nueva p\'agina al final
\makeatletter       
\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
            \newpage
            \begin{center}      %%%   
            \Large              %%%   
            \bfseries           %%%   
            \contentsname       %%%  
            \end{center}        %%%
%            \addvspace{1cm}     %%%   Añade o quita espacio vertical 

    \@mkboth{%
       \MakeUppercase\contentsname}{\MakeUppercase\contentsname} 
    {\large \@starttoc{toc} }
    \if@restonecol\twocolumn\fi
    \newpage
    }
\makeatother







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      Figuras, tablas y referencias                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Colocar al principio del documento, para evitar la sobreescritura realizada por el paquete babel
\AtBeginDocument{%
    \renewcommand{\tablename}{Tabla}
%    \renewcommand{\refname}{\vspace{-1.5cm}}
    \renewcommand{\tocbibname}{REFERENCIAS}
}
\renewcommand{\figurename}{Figura}

% Definiciones especiales. Estandariza la referencia a figuras
\newcommand{\fig}[1]{Fig.~\ref{#1}}
\newcommand{\figs}[2]{Figs.~\ref{#1} y \ref{#2}}
\newcommand{\tb}[1]{Tabla~\ref{#1}}

% pdf links
%\ifnum \mecomuselinks = 1
% Use color links
\RequirePackage{color}
\definecolor{url}{rgb}{0.8,0.,0.}
\RequirePackage[colorlinks,linkcolor=black,%
                urlcolor=url,citecolor=black,%
                plainpages=false,pdfpagelabels]{hyperref}
\RequirePackage{nameref,url}
\def\UrlFont{\mdseries}
%\fi


% Separaci\'on entre filas y columnas
\renewcommand{\arraystretch}{1.3}
\setlength{\tabcolsep}{5mm}

% Espesor de l\'ineas (del paquete booktabs)
\setlength{\heavyrulewidth}{1.5pt}


   

\endinput
