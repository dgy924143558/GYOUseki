\ProvidesClass{knkgaiyou}[2008/12/05 Tsuchiya] 
\LoadClass[8.5pt,twocolumn,a4j,dvips]{jsarticle} 
%
% 精密工学会誌用 LaTeX2e クラスファイル
% manuscript-1.93 を勝手に使わせてもらって作成
% 
%
%  double space setting
%
%\def\baselinestretch{1.5}
%
%
%  title page setting
%
  \if@titlepage
  \renewcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \bf \@title \par}%
    \vskip 3em%
    {\Large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@eauthor
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
%  \global\let\affiliation\relax
  \global\let\keywords\relax
%  \global\let\correspondence\relax
 \global\let\etitle\relax 
 \global\let\eauthor\relax 
}
\else
\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{empty}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
%  \global\let\affiliation\relax
  \global\let\keywords\relax
%  \global\let\correspondence\relax
 \global\let\etitle\relax 
 \global\let\eauthor\relax 
}
\def\@maketitle{
\newpage

\begin{flushleft}
\vskip -2mm
神戸大学大学院　海事科学研究科　董 貴義　研究概要
\@tyukan\ (\@year) 
\end{flushleft}
 \begin{center}
 {\LARGE \bf \@title \par} \vskip 9pt %\lineskip .5em
{
%\hspace{16.2zw}
\begin{flushright}%右寄せに変更 2008/12/15
\begin{tabular}{rl}
\@gakuseki & \@author\\
%%（指導教官 & 金子　透　教授）%旧
%%（指導教員 & \@shidou　\@stitle）%texソース側で指導教官を変更 2008/12/05・指導教官→指導教員に変更 2008/12/10
\end{tabular}
\end{flushright}
}

% \vskip 1em {\large \lineskip .5em 
%\begin{tabular}[t]{l}\@affiliation \end{tabular} \par}
\end{center}
  
} 
%\long\def\affiliation#1{\long\gdef\@affiliation{#1}}
\long\def\keywords#1{\long\gdef\@keywords{#1}}
\long\def\correspondence#1{\long\gdef\@correspondence{#1}}
\long\def\etitle#1{\long\gdef\@etitle{#1}} 
\long\def\eauthor#1{\long\gdef\@eauthor{#1}}
\long\def\tyukan#1{\long\gdef\@tyukan{#1}}
\long\def\year#1{\long\gdef\@year{#1}}
\long\def\gakuseki#1{\long\gdef\@gakuseki{#1}}
\long\def\shidou#1{\long\gdef\@shidou{#1}}
\long\def\stitle#1{\long\gdef\@stitle{#1}}  
\fi 

\renewcommand{\abstractname}{}
%\renewcommand{\refname}{本研究に関する論文業績}
\renewcommand{\figurename}{{図}}
\renewcommand{\tablename}{{表}}
\renewcommand{\thefigure}{{\@arabic\c@figure}}
\renewcommand{\thetable}{{\@arabic\c@table}}

\renewcommand{\footnoterule}{%本文と脚注間の線を伸ばす
  \kern-3\p@
  \hrule width 35mm
  \kern 2.6\p@}


% figure で番号の後にコロンをつけない
\long\def\@makecaption#1#2{% \@makecaption を再定義します
  \normalsize
  \vskip\abovecaptionskip
  \iftdir\sbox\@tempboxa{#1\hskip1zw#2}%
    \else\sbox\@tempboxa{#1~ #2}% ここの : を ~ に変更する
  \fi
  \ifdim \wd\@tempboxa >\hsize% 
    \iftdir #1\hskip1zw#2\relax\par
      \else #1~ #2\relax\par\fi% ここの : を ~ に変更する
  \else
    \global \@minipagefalse
    \hbox to\hsize{\hfil\box\@tempboxa\hfil}% センタリング
%   \hbox to\hsize{\box\@tempboxa\hfil}%      左詰め
%   \hbox to\hsize{\hfil\box\@tempboxa}%      右詰め
  \fi
  \vskip\belowcaptionskip}

\setlength{\abovecaptionskip}{-1mm}
\setlength{\belowcaptionskip}{0mm}

% abstract
\newbox\@abstractbox
\renewenvironment{abstract}{%
  \global\setbox\@abstractbox\hbox\bgroup
  \begin{minipage}[b]{154mm}\par
    \normalsize\parindent1zw
    \setlength{\baselineskip}{12pt}
  }%
  {\end{minipage}\egroup}

% section をセンタリングする
\renewcommand{\section}{%
  \@startsection{section}% #1 見出し
   {1}% #2 見出しのレベル
   {-1.25zw}% #3 横組みの場合，見出し左の空き(インデント量)
   {.3\Cvs \@plus.2\Cdp \@minus.2\Cdp}% #4 見出し上の空き
   {.3\Cvs \@plus.2\Cdp \@minus.2\Cdp}% #5 見出し下の空き (負の値なら見出し後の空き) 
%  {\reset@font\Large\bfseries}% #6 見出しの属性
%   {\centering\reset@font\normalsize\bfseries}% 中央揃え
  {\raggedright　\reset@font\normalsize\bfseries}% 右揃え
}%

\renewcommand{\subsection}{\@startsection{subsection}{2}{-1.25zw}%
   {.00001\Cvs \@minus.1\Cdp}%
   {.00001\Cvs \@minus.1\Cdp}%
   {\raggedright　\reset@font\normalsize\bfseries}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{-1.25zw}%
   {.00001\Cvs \@minus.1\Cdp}%
   {.00001\Cvs \@minus.1\Cdp}%
   {\raggedright　\reset@font\normalsize}}


\renewcommand{\thesection}{\@arabic\c@section.} % section の数字の後にピリオドをつける
\renewcommand{\thesubsection}{\thesection\ \@arabic\c@subsection}
\renewcommand{\thesubsubsection}{\bfseries\thesubsection.\ \@arabic\c@subsection}

%%itemizaの間隔を狭く
\renewenvironment{itemize}%% itemize 環境を再定義
  {\ifnum \@itemdepth >\thr@@\@toodeep\else 
   \advance\@itemdepth\@ne
   \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
   \expandafter
   \list{\csname \@itemitem\endcsname}{%
      \iftdir
         \ifnum \@listdepth=\@ne \topsep.0 \normalbaselineskip
           \else\topsep\z@\fi
         % 元々ここにあった定義を...
         \labelwidth1zw \labelsep.5zw
         \ifnum \@itemdepth =\@ne \leftmargin1zw\relax
           \else\leftmargin\leftskip\fi
         \advance\leftmargin 1zw
      \fi
         \parskip\z@ \topsep0pt \itemsep\z@ \parsep\z@% こちらに移動
         \def\makelabel##1{\hss\llap{##1}}}%
   \fi}{\endlist}

%%descriptionの間隔を狭く
\renewenvironment{description}%% description 環境を再定義
  {\list{}{\labelwidth\z@ \itemindent-\leftmargin
   \iftdir
     \leftmargin\leftskip \advance\leftmargin3\Cwd
     \rightmargin\rightskip
     \labelsep=1zw% 元々ここにあった定義を...
   \fi
     \itemsep\z@% こちらに移動
     \listparindent\z@ \leftmargin2.8zw \topsep0pt \topskip\z@ \parskip\z@ \partopsep\z@% こちらに移動
           \let\makelabel\descriptionlabel}}{\endlist}



%%enumerateの間隔を狭く
\renewenvironment{enumerate}%% enumerate 環境を再定義
  {\ifnum \@enumdepth >\thr@@\@toodeep\else% 
   \advance\@enumdepth\@ne
   \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
   \list{\csname label\@enumctr\endcsname}{%
      \iftdir
         \ifnum \@listdepth=\@ne \topsep.5\normalbaselineskip
           \else\topsep\z@\fi
         % 元々ここにあった定義を...
         \labelwidth1zw \labelsep.3zw
         \ifnum \@enumdepth=\@ne \leftmargin1zw\relax
           \else\leftmargin\leftskip\fi
         \advance\leftmargin 1zw
      \fi
         \parskip\z@ \topsep0pt \itemsep\z@ \parsep\z@% こちらに移動
         \usecounter{\@enumctr}%
         \def\makelabel##1{\hss\llap{##1}}}%
   \fi}{\endlist}

%\renewcommand{\thefootnote}{\fnsymbol{footnote}}

% 最終ページの段の高さを揃えるためのマクロ
\newcommand{\dummyspace}[1]{
  \renewcommand{\footnoterule}{\relax}
  \begingroup  \makeatletter
  \def\thefootnote{\ifnum\c@footnote>\z@\@arabic\c@footnote\fi}
      \footnotetext{%
  	\vspace{#1}
      }%
  \endgroup
}

% 参考文献の項目間スペースを詰める
\renewenvironment{thebibliography}[1]
{\section*{\refname\@mkboth{\refname}{\refname}}%
   \small
   \list{\@biblabel{\@arabic\c@enumiv}}%
        {\settowidth\labelwidth{\@biblabel{#1}}%
         \itemsep\z@% この行を追加
         \parsep\z@%  この行も追加
         \leftmargin\labelwidth
         \advance\leftmargin\labelsep
         \@openbib@code
         \usecounter{enumiv}%
         \let\p@enumiv\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
   \sloppy
   \clubpenalty4000
   \@clubpenalty\clubpenalty
   \widowpenalty4000%
   \sfcode`\.\@m}
  {\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
   \endlist}

% 文字サイズの設定
{\catcode`\/=12
\global\expandafter\let\csname JY1/mc/m/n/10\endcsname=\relax}
\DeclareFontShape{JY1}{mc}{m}{n}{<-> s * [0.9815306] jis}{}
\DeclareFontShape{JY1}{gt}{m}{n}{<-> s * [0.9815306] jisg}{}
%
\newdimen\@Q\@Q=0.25mm
\renewcommand{\normalsize}{
\@setfontsize\normalsize{\@ixpt}{13.0pt}
\abovedisplayskip 9.25\@Q \@plus3\@Q \@minus3\@Q
\abovedisplayshortskip \z@ \@plus2\@Q
\belowdisplayshortskip 3\@Q \@plus2\@Q \@minus2\@Q
\belowdisplayskip \abovedisplayskip
\let\@listi\@listI}
\normalsize
\renewcommand{\small}{%
\@setfontsize\small{\@viiipt}{9.0pt}
\abovedisplayskip 8\@Q \@plus2\@Q \@minus2\@Q
\abovedisplayshortskip \z@ \@plus2\@Q
\belowdisplayshortskip 3\@Q \@plus2\@Q \@minus2\@Q
\belowdisplayskip \abovedisplayskip}
\renewcommand{\footnotesize}{\@setfontsize\footnotesize{\@viiipt}{9.0pt}}
\renewcommand{\scriptsize}{\@setfontsize\scriptsize{\@vipt}{9\@Q}}
\renewcommand{\tiny}{\@setfontsize\tiny{\@vpt}{7\@Q}}
\renewcommand{\large}{\@setfontsize\large{\@ixpt}{14.0pt}}
\renewcommand{\Large}{\@setfontsize\Large{\@xpt}{16.0pt}}
\renewcommand{\LARGE}{\@setfontsize\LARGE{\@xivpt}{21.0pt}}
\renewcommand{\huge}{\@setfontsize\huge{\@xviipt}{32\@Q}}
\renewcommand{\Huge}{\@setfontsize\Huge{\@xxpt}{36\@Q}}

% 余白関係の設定
\setlength{\textwidth}{174.9truemm}       % テキストの幅59.zw
\setlength{\oddsidemargin}{20truemm}    % 偶数ページの左マージン
\setlength{\evensidemargin}{20truemm}   % 奇数ページの左マージン
\addtolength{\oddsidemargin}{-1truein}  % 元の 1in の空白を削除
\addtolength{\evensidemargin}{-1truein} % 元の 1in の空白を削除

\setlength{\textheight}{256.7truemm}      % テキストの高さ
\setlength{\headheight}{0truemm}        % ヘッダの高さ
\setlength{\headsep}{0truemm}           % テキストの最上部とヘッダの最下部との間隔
\setlength{\footskip}{10truemm}         % テキストの最下部とフッタの最下部との間隔
\setlength{\topmargin}{20truemm}        % 上のマージン
\addtolength{\topmargin}{-1truein}      % 元の 1in の空白を削除

\setlength{\columnsep}{10truemm}        % コラム間の幅
%\setlength{\textwidth}{56zw}          % 一行の文字数

%
%  pagestyle setting
%
\pagestyle{empty} 
% 
%  omit_number = 0 
% 
%  citation_form = 2 
%
%  citation form setting
%
\def\@cite#1#2{[{#1\if@tempswa , #2\fi}]}
%\def\@cite#1#2{$^{\hbox{\scriptsize{#1\if@tempswa , #2\fi})}}$} 
% 
%  biblio_heading = 2 
%
%  bibliography heading setting
%
\renewcommand*{\@biblabel}[1]{#1)\hfill} 
% end of jjspe.cls ----------------------------------------------- 

% \refのハイパーリンクを解除する
\def\@setref#1#2#3{ 
  \ifx#1\relax
   \protect\G@refundefinedtrue
   \nfss@text{\reset@font\bfseries ??}%
   \@latex@warning{Reference `#3' on page \thepage \space
             undefined}%
  \else
   \expandafter#2#1\null
  \fi}
% 丸数字のマクロ
\def\MARU#1{\leavevmode\setbox0\hbox{$\bigcirc$}%
\copy0\kern-\wd0 \hbox to\wd0{\hfil{\scriptsize#1}\hfil}}
% 参考文献の引用方法
\makeatletter      
\renewcommand{\@biblabel}[1]{[#1]}
\makeatother
%------------------ 箇条書き --------------------

\newenvironment{itemize2}%  
{%
   \begin{list}{$\bullet$\ \ }% 見出し記号／直後の空白を調節
   {%
      \setlength{\itemindent}{0pt}
      \setlength{\topsep}{0pt}
      \setlength{\leftmargin}{3zw}%  左のインデント
      \setlength{\rightmargin}{0zw}% 右のインデント
      \setlength{\labelsep}{0zw}%    黒丸と説明文の間
      \setlength{\labelwidth}{3zw}%  ラベルの幅
      \setlength{\itemsep}{0em}%     項目ごとの改行幅
      \setlength{\parsep}{0em}%      段落での改行幅
      \setlength{\listparindent}{0zw}% 段落での一字下り
   }
}{%
   \end{list}%
}

%---------- 番号つき箇条書き -----------

\newcounter{enum2}
\newenvironment{enumerate2}{%
   \begin{list}%
   {%
      \arabic{enum2}.\ \,%  見出し記号／直後の空白を調節
   }%
   {%
      \usecounter{enum2}
      \setlength{\itemindent}{0zw}%  ここは 0 に固定
      \setlength{\leftmargin}{3zw}%  左のインデント
      \setlength{\rightmargin}{0zw}% 右のインデント
      \setlength{\labelsep}{0zw}%    黒丸と説明文の間
      \setlength{\labelwidth}{3zw}%  ラベルの幅
      \setlength{\itemsep}{0em}%     項目ごとの改行幅
      \setlength{\parsep}{0em}%      段落での改行幅
      \setlength{\listparindent}{0zw}% 段落での一字下り
   }
}{%
   \end{list}%
}

\kanjiskip=.08zw plus.3pt minus.3pt


%%2008/12/05追加
%%図と表のタイトル前後の空白を調整
\makeatletter
\def\caption{%
   \ifx\@captype\@undefined
      \@latex@error{\noexpand\caption outside float}\@ehd
      \expandafter\@gobble
   \else
      \abovecaptionskip=\@nameuse{@abovecaptionskip@for@\@captype}\relax
      \belowcaptionskip=\@nameuse{@belowcaptionskip@for@\@captype}\relax
      \refstepcounter\@captype
      \expandafter\@firstofone
   \fi
   {\@dblarg{\@caption\@captype}}}
\def\@abovecaptionskip@for@figure{0.8em}
\def\@belowcaptionskip@for@figure{-0.8em}
\def\@abovecaptionskip@for@table{-0.2em}
\def\@belowcaptionskip@for@table{-0.2em}

%%2008/12/05追加
%%電子情報通信学会の参考文献引用フォーマットをパクる
%%## citesort.sty ##%%
%% from "citesort.sty", a little customized
\newcount\@minsofar
\newcount\@min
\newcount\@cite@temp
\def\@citex[#1]#2{%
\if@filesw \immediate \write \@auxout {\string \citation {#2}}\fi
\@tempcntb\m@ne \let\@h@ld\relax \def\@citea{}%
\@min\m@ne%
\@cite{%
  \@for \@citeb:=#2\do {\@ifundefined {b@\@citeb}%
    {\@h@ld\@citea\@tempcntb\m@ne{\bfseries ?}%
    \@warning {Citation `\@citeb ' on page \thepage \space undefined}}%
{\@minsofar\z@ \@for \@scan@cites:=#2\do {%
  \@ifundefined{b@\@scan@cites}%
    {\@cite@temp\m@ne}
    {\@cite@temp\number\csname b@\@scan@cites \endcsname \relax}%
\ifnum\@cite@temp > \@min% select the next one to list
    \ifnum\@minsofar = \z@
      \@minsofar\number\@cite@temp
      \edef\@scan@copy{\@scan@cites}\else
    \ifnum\@cite@temp < \@minsofar
      \@minsofar\number\@cite@temp
      \edef\@scan@copy{\@scan@cites}\fi\fi\fi}\@tempcnta\@min
  \ifnum\@minsofar > \z@ % some more
    \advance\@tempcnta\@ne
    \@min\@minsofar
    \ifnum\@tempcnta=\@minsofar %   Number follows previous--hold on to it
      \ifx\@h@ld\relax
        \edef \@h@ld{\@citea\csname b@\@scan@copy\endcsname}%
      \else \edef\@h@ld{\ifmmode{]～[}\else]～[\fi
       \csname b@\@scan@copy\endcsname}%
      \fi
    \else \@h@ld\@citea\csname b@\@scan@copy\endcsname
          \let\@h@ld\relax
  \fi % no more
\fi}%
\def\@citea{],\penalty\@highpenalty\,[}}\@h@ld}{#1}}
%% end of citesort.sty
\makeatother
