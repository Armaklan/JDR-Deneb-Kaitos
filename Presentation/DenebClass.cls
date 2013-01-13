\NeedsTeXFormat{LaTeX2e}
 
\ProvidesClass{DenebClass}[2007/09/19 Classe personnelle, V1.0]
 
% *************************************************
%                    classe de base
% *************************************************
\LoadClass[a4paper, 10pt]{report}

% *************************************************
%                    extensions
% *************************************************
\RequirePackage[utf8]{inputenc}
\RequirePackage[normalem]{ulem}
\RequirePackage{graphics}
\RequirePackage{graphicx}
\RequirePackage[frenchb]{babel}
\RequirePackage{verbatim}
\RequirePackage{xcolor}
\RequirePackage{calc}
\RequirePackage{makeidx}
\RequirePackage{picins}
% ******* Définition des marges *********
\RequirePackage[margin=2.5cm]{geometry}
% ******* Entete et pied de pages *********
\RequirePackage{fancyhdr}
% ******* Bordure autour de la page *********
\RequirePackage[absolute]{textpos}
\RequirePackage{url}
\RequirePackage{avant}
\RequirePackage{multicol}
\RequirePackage{titletoc}
\RequirePackage[newparttoc]{titlesec}


%-------------PDF-------------------------------------------------------------
 
%Passage au PDF de qualité
\RequirePackage[pdftex, % Paramétrage de la navigation
    bookmarks = true, % Signets
    bookmarksnumbered = true, % Signets numérotés
    pdfpagemode = true, % Signets/vignettes fermé à l'ouverture
    pdfstartview = FitH, % La page prend toute la largeur
    pdfpagelayout = TwoColumn, % Vue par page
    colorlinks = true, % Liens en couleur
    urlcolor = rltblack, % Couleur des liens externes
    linkcolor = rltblack, % Couleur des liens externes
    pdfborder = {0 0 0} % Style de bordure : ici, rien
    ]{hyperref}% % Utilisation de HyperTeX

\definecolor{rltblack}{rgb}{0,0,0} 
 
\hypersetup{ % Information sur le document
    pdfauthor = {Lionel "Armaklan" Zuber}, % Auteurs
    pdftitle = {Deneb Kaitos}, % Titre du document
    pdfsubject = {Les Cendres de la Fédérations}, % Sujet
    pdfkeywords = {}, % Mots-clefs
    pdfcreator = {PdfLatex}, % Logiciel qui a crée le document
    pdfproducer = {} % Personne/Société qui a produit le pdf
    plainpages = true}

\renewcommand*\familydefault{\sfdefault} %% Only if the base font of the document is to be sans serif
\renewcommand{\FrenchLabelItem}{\textbullet}
\frenchbsetup{ReduceListSpacing=false,CompactItemize=false}

\setcounter{tocdepth}{0}     % Dans la table des matieres

% *************************************************
%                    Mise en forme
%                Du titre du Document
% *************************************************    
\renewcommand{\maketitle}{
  \null
  \vfill
  \begin{center}\leavevmode
    \normalfont
    {\LARGE Deneb Kaitos \par Les Cendres de la Fédérations \par}%
    \vskip 1cm
    {\Large \@author\par}%
    \vskip 1cm
    {Version du \@date\par}%
  \end{center}%
  \vfill
  \null
  \cleardoublepage
}

% *************************************************
%             Affichage des parts dans
%                    le sommaire
% *************************************************
\titlecontents{part}[0pc]
  {\addvspace{2em}\bfseries\Large}
  {\partname\ \thecontentslabel\ : }
  {}
  {\hfill\contentspage \vskip -4pt \hrule height 1pt \vskip 10 pt}


% *************************************************
%             Espacement des paragraphes
%                  et interlignes
% *************************************************
\setlength{\parskip}{2ex}
\renewcommand{\baselinestretch}{1.3}

% *************************************************
%             Entete de Chapitre
% *************************************************
\renewcommand{\chapter} {      	   % Starts new page.
   \thispagestyle{plain}           % Page style of chapter page is 'plain'
   \global\@topnum\z@              % Prevents figures from going at top of page.
   \@afterindentfalse               % Inserts indent in first paragraph.  Change
   \secdef\@chapter\@schapter}     % to \@afterindentfalse to remove indent.
   
\@addtoreset{chapter}{part}
 
\renewcommand{\@makechapterhead}[1] {    
	% Heading for \chapter command
  	{ 	
  		\parindent 0pt \centering   
    	\ifnum \c@secnumdepth >\m@ne         		% IF secnumdepth > -1 THEN
      	\colorbox{black}{
      		\makebox[450pt]{
      			\textcolor{white}{
      				\large\bf Chapitre \thechapter:             % Print chapter number.
  					\hspace{0.0ex plus .2ex minus .2ex}  \fi    % Space between number and title.
    				\large \bf
    				#1									% Title.
	    		}
	    	}
	    	\nobreak 								% TeX penalty to prevent page break.
    	}                            					
    	\par	
    	\vskip 5pt                          		% Space between title and text.
  	} 
}

\renewcommand{\@makeschapterhead}[1] {    
	% Heading for \chapter* command
  	{ 	
  		\vskip 30pt  
  		\parindent 0pt \centering   
 	    \huge \bf #1
	    \par	
	    \nobreak 								% TeX penalty to prevent page break.
    	\vskip 30pt                          		% Space between title and text.
  	} 
}


% *************************************************
%             Entete de Section
% *************************************************
\renewcommand{\section}{\@startsection {section}{1}{\z@}%
             {-1.5ex}%
             {1ex}%
             {\bf\large}}

% *************************************************
%            Défintion des zones exemples
% *************************************************
\definecolor{gris25}{rgb}{0.85,0.85,0.85}
\definecolor{vert25}{rgb}{0.85,0.94,0.85}
\definecolor{rouge25}{rgb}{0.94,0.85,0.85}
\definecolor{jaune25}{rgb}{0.94,0.94,0.64}
\definecolor{bleu25}{rgb}{0.74,0.84,0.94}

\newcommand{\minititre}[1] {
    \parbox{400pt}{
        \vskip -25pt
        \begin{center}
            \textbf {
                #1
            }
        \end{center}    
        \par
    }
}
             
\newcommand{\regle}[2] {
      	\colorbox{vert25}{
            \parbox{400pt}{
                \parindent 10pt 
                \parskip 1.5ex
                \vskip -15pt
                \makebox[410pt][r]{
                    \includegraphics[scale=0.3]{../MEP/s_planete.png} 
                }
    	    % On remonte le titre de l'encadré
                \vskip -30pt 
                \minititre {
                    #1
                }
	   % Et on remonte un peu le contenu, mais pas trop
                \vskip -5pt                       
                \itshape        
                #2
                \upshape
                \vskip 20pt                      
    	    }		
	    	\par	
	    	\nobreak 								% TeX penalty to prevent page break.
    	}
}

\newcommand{\option}[2] {
      	\colorbox{vert25}{
            \parbox{400pt}{
                \parindent 10pt 
                \parskip 1.5ex
                \vskip -15pt
                \makebox[410pt][r]{
                    \includegraphics[scale=0.3]{../MEP/s_planete.png} 
                }
    	    % On remonte le titre de l'encadré
                \vskip -30pt 
                \minititre {
                    #1
                }
	   % Et on remonte un peu le contenu, mais pas trop
                \vskip -5pt                       
                \itshape        
                #2
                \upshape
                \vskip 20pt                      
    	    }		
	    	\par	
	    	\nobreak 								% TeX penalty to prevent page break.
    	}
}

\newcommand{\exemple}[2] {
      	\colorbox{vert25}{
            \parbox{400pt}{
                \parindent 10pt 
                \parskip 1.5ex
                \vskip -15pt
                \makebox[410pt][r]{
                    \includegraphics[scale=0.3]{../MEP/s_planete.png} 
                }
    	    % On remonte le titre de l'encadré
                \vskip -30pt 
                \minititre {
                    #1
                }
	   % Et on remonte un peu le contenu, mais pas trop
                \vskip -5pt                       
                \itshape        
                #2
                \upshape
                \vskip 20pt                      
    	    }		
	    	\par	
	    	\nobreak 								% TeX penalty to prevent page break.
    	}
}

\newcommand{\remarque}[2] {
      	\colorbox{rouge25}{
      		\parbox{400pt}{
                    \parindent 10pt 
                    \parskip 1.5ex
                    \vskip -15pt
                    \makebox[410pt][r]{
                        \includegraphics[scale=0.3]{../MEP/etoile1.png} 
                    }
    	    % On remonte le titre de l'encadré
                \vskip -30pt 
                    \minititre {
                        #1
                    } 
	   % Et on remonte un peu le contenu, mais pas trop
                \vskip -5pt     
                    \itshape        
                    #2
                    \upshape
                    \vskip 20pt                      
	    	}
	    	\par	
	    	\nobreak 								% TeX penalty to prevent page break.
    	}
}


% *************************************************
%            D�fintion des zones id�e sc�nario
% *************************************************

\newcommand{\scenario}[2] {
      	\colorbox{jaune25}{
      		\parbox{400pt}{
                    \parindent 10pt 
                    \parskip 1.5ex
                    \vskip -15pt
                    \makebox[410pt][r]{
                        \includegraphics[scale=0.3]{../MEP/vso.png} 
                    } 
    	    % On remonte le titre de l'encadré
                \vskip -30pt 
                    \minititre {
                        #1
                    }
	      % Et on remonte un peu le contenu, mais pas trop
                  \vskip -5pt    
                    \itshape        
                    #2
                    \upshape
                    \vskip 20pt                      
	    	}
	    	\par	
	    	\nobreak 								% TeX penalty to prevent page break.
    	}
}

% *************************************************
%            D�fintion des zones notes de conceptions
% *************************************************
             
\newcommand{\note}[2] {
      	\colorbox{rouge25}{
      		\parbox{400pt}{
                    \parindent 10pt 
                    \parskip 1.5ex
                    \vskip -15pt
                    \makebox[410pt][r]{
                        \includegraphics[scale=0.3]{../MEP/etoile1.png} 
                    }
    	    % On remonte le titre de l'encadré
                \vskip -30pt 
                    \minititre {
                        #1
                    } 
	   % Et on remonte un peu le contenu, mais pas trop
                \vskip -5pt     
                    \itshape        
                    #2
                    \upshape
                    \vskip 20pt                      
	    	}
	    	\par	
	    	\nobreak 								% TeX penalty to prevent page break.
    	}
}

% *************************************************
%            D�fintion des zones notes de conceptions
% *************************************************
             
\newcommand{\example}[2] {
      	\colorbox{rouge25}{
      		\parbox{400pt}{
                    \parindent 10pt 
                    \parskip 1.5ex
                    \vskip -15pt
                    \makebox[410pt][r]{
                        \includegraphics[scale=0.3]{../MEP/etoile1.png} 
                    }
    	    % On remonte le titre de l'encadré
                \vskip -30pt 
                    \minititre {
                        #1
                    } 
	   % Et on remonte un peu le contenu, mais pas trop
                \vskip -5pt     
                    \itshape        
                    #2
                    \upshape
                    \vskip 20pt                      
	    	}
	    	\par	
	    	\nobreak 								% TeX penalty to prevent page break.
    	}
}

% *************************************************
%            D�fintion des
%       Ent�te et pied de page
% *************************************************
\fancypagestyle{plain}{%
	\fancyhf{}
    \lhead{
        \begin{textblock*}{3cm}(6mm,8mm) 
        \includegraphics[scale=0.3]{../MEP/bord-h-g}
        \end{textblock*} 
    }
    \rhead{
        \begin{textblock*}{3cm}(16.7cm,8mm) 
        \includegraphics[scale=0.3]{../MEP/bord-h-d} 
        \end{textblock*} 
    }
    \chead{
        \begin{textblock*}{3cm}(8.1cm,8mm) 
        \includegraphics[scale=0.4]{../MEP/bord-h-c} 
        \end{textblock*}
    }
    
    
    \cfoot{\bfseries\thepage}     
    \lfoot{
        \begin{textblock*}{3cm}(6mm,25.2cm) 
        \includegraphics[scale=0.3]{../MEP/bord-b-g} 
        \end{textblock*} 
    }
    \rfoot{
        \begin{textblock*}{3cm}(16.7cm,25.2cm) 
        \includegraphics[scale=0.3]{../MEP/bord-b-d} 
        \end{textblock*} 
    }
	\renewcommand{\headrulewidth}{0pt}  
	\renewcommand{\footrulewidth}{0pt}}  
    
\pagestyle{plain}
