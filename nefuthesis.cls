% !Mode:: "TeX:UTF-8"
% !TEX root = main.tex
\NeedsTeXFormat{LaTeX2e}
% 标题开头
\ProvidesClass{nefuthesis}[2019/08/01 nefuthesis document class.]

% Options
% 专硕、学硕可选参数，用于区别格式
\newif\if@AcaMaster\@AcaMastertrue
\newif\if@ProMaster
\newif\if@cpsupervisor

\DeclareOption{AcaMaster}{\@AcaMastertrue}
\DeclareOption{ProMaster}{\@AcaMasterfalse}
\DeclareOption{cpsupervisor}{\@cpsupervisortrue}
\DeclareOption{nocpsupervisor}{\@cpsupervisorfalse}
% TODO what does this line mean?
% 声明宏包或类的选项
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
% 让全部或者部分宏包生效 \ProcessOptions \ExecuteOptions{OptionsList}
\ProcessOptions\relax
\LoadClass[zihao=-4, openright, scheme=chinese]{ctexbook}


% 宏包
% 数学公式
\RequirePackage{amsmath, amssymb}


% 使得公式编号向左缩进 两个空格
\def\tagform@#1{\maketag@@@{(#1)\unskip\@@italiccorr}\hspace{2em}}


\RequirePackage{fancyhdr}
% 公式中的粗体
\RequirePackage{bm}
% 公式中的括号
\RequirePackage{cases}
% pifont 宏包提供带圈的数字符号，用作脚注的标号，根据特殊的要求
\RequirePackage{pifont}
% 插图
\RequirePackage{graphicx}
% 设置图片，表格头字体选项
\RequirePackage{caption}
% 并排图形，subfigure subfig 不再推荐，并与subcaption 不兼容
\RequirePackage{subcaption}
% 中英文 caption

% 三线表
\RequirePackage{booktabs}
% 长表格宏包，tabu宏包longtabu环境需要
\RequirePackage{longtable}
% 制表宏包

\RequirePackage{multirow}
\RequirePackage{amsfonts}
\RequirePackage{tabu}
% 下划线
\RequirePackage{ulem}
% 表格处理必备
\RequirePackage{array}
% hyperref 可以根据交叉引用生成超链接，同时生成pdf文档的书签
\RequirePackage{hyperref}

%\RequirePackage{ccaption}
% 自定义标题格式的宏包，标题编号Arial 标题内容黑体
\RequirePackage{titlesec}

\renewcommand\figureautorefname{图}
\renewcommand\tableautorefname{表}
\renewcommand\equationautorefname{公式}

% 在文档类的末尾插入代码
\AtEndOfClass{
	\hypersetup{
		unicode,
		% hyperfootnotes=false,
		pdfstartview=FitH,
		CJKbookmarks=true,
		bookmarksnumbered=true,
		bookmarksopen=true,
		% colorlinks=true,       % 链接颜色
		% citecolor=blue,
		% linkcolor=blue,
		% anchorcolor=blue,
		% urlcolor=blue,
		hidelinks,               % 隐藏超链接的颜色和边框
		% draft                  % 草稿模式，提高编译速度，需要的时候注释掉
	}
}
% 在document最开始
\AtBeginDocument{
	\hypersetup{%
		pdftitle={\NEFU@title}, %
		pdfauthor={\NEFU@author}, %
		pdfkeywords={}, %
		pdfcreator={LaTeX with hyperref package, using NEFU LaTeX Thesis Template for AcaMaster and ProMaster}	
	}
}
\urlstyle{same}
% 参考文献正文上标样式设置
\RequirePackage[sort&compress, numbers]{natbib}
% caption中用\cite, 导致参考文献引用顺序混乱的问题， 参考自BibTeX Tips and FAQ Question 18
\usepackage{notoccite}
% hypernat 可以让 hyperref 和 natbib 混合使用，但它需要放在这两者之后
\RequirePackage{hypernat}
% 修复图标超链接不准的问题
\RequirePackage[all]{hypcap}
% footmisc 宏包提供了对脚注央视的控制功能
% stable 参数主要使脚注\footnote 可以用在章节命令中
% perpage
\RequirePackage[stable, perpage, symbol*]{footmisc}




% 全局命令定义
\@namedef{NEFU@spaceChar}{\hspace{1em}}
% 用于生成两个字符空格
\newcommand\NEFUspace{\protect\NEFU@spaceChar\protect\NEFU@spaceChar}

% 用于表格内部换行，封面导师姓名
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}

% 封面
% global define
\renewcommand\title[1]{\gdef\NEFU@title{#1}}                  % 论文中文标题
\newcommand\englishtitle[1]{\long\gdef\NEFU@englishtitle{#1}} %% 论文英文标题
\renewcommand\author[1]{\gdef\NEFU@author{#1}}                % 作者姓名
\newcommand\authorenglishname[1]{\gdef\NEFU@authorenglishname{#1}} %作者英文名字
%\newcommand\classification[1]{\gdef\NEFU@classification{#1}}  %% 分类号
\newcommand\serialnumber[1]{\gdef\NEFU@serialnumber{#1}}      % 单位代码， 学校代码
%\newcommand\secretlevel[1]{\gdef\NEFU@secretlevel{#1}}        % 密级
\newcommand\studentnumber[1]{\gdef\NEFU@studentnumber{#1}}    % 学号
\newcommand\supervisor[1]{\gdef\NEFU@supervisor{#1}}          % 指导教师
\newcommand\supervisorenglish[1]{\gdef\NEFU@supervisorenglish{#1}} % 指导教师英文名字
\newcommand\cpsupervisor[1]{\gdef\NEFU@cpsupervisor{#1}}      % 合作导师
\newcommand\cpsupervisorenglish[1]{\gdef\NEFU@cpsupervisorenglish{#1}} % 合作导师英文名字
\newcommand\degreelevel[1]{\gdef\NEFU@degreelevel{#1}}        % 申请学位级别
\newcommand\degreelevelenglish[1]{\gdef\NEFU@degreelevelenglish{#1}} % 申请学位级别英文
\newcommand\major[1]{\gdef\NEFU@major{#1}}                    % 学科专业
\newcommand\majorenglish[1]{\gdef\NEFU@majorenglish{#1}}      % 学科专业英文
%\newcommand\research[1]{\gdef\NEFU@research{#1}}              % 研究方向
\newcommand\submitdate[1]{\gdef\NEFU@submitdate{#1}}	       % 提交日期
\newcommand\replydate[1]{\gdef\NEFU@replydate{#1}}            % 答辩日期
\newcommand\replydateenglish[1]{\gdef\NEFU@replydateenglish{#1}} % 答辩日期英文
\newcommand\awardingunit[1]{\gdef\NEFU@awardingunit{#1}}      % 授予单位
\newcommand\awardingunitenglish[1]{\gdef\NEFU@awardingunitenglish{#1}} % 授予单位英文
\newcommand\awardingdate[1]{\gdef\NEFU@awardingdate{#1}}      % 授予日期


%\makeatletter
%\def\tagform@#1{\maketag@@@{(#1)\unskip\@@italiccorr}\hspace{2em}}
%\makeatother

% 中文题名页

% 英文题名页



% 正文部分文字的行距设置
% 1.56
\renewcommand\baselinestretch{1.0}

% 页面设置
% \RequirePackage[
%	% left=2.4cm,
%	% right=2.2cm,
%	% top = 2.8cm,
%	% bottom=2.2cm.
%	xetex,
%	showframe,
%	]{geometry}
% 纸张大小a4paper
\setlength\paperheight{297mm}
\setlength\paperwidth{210mm} % \paperwidth = h + \oddsidemargin+\textwidth+\evensidemargin + h
% 页面布局 根据NEFU论文规范1.0
% TODO 页脚高度没有设置  这里面实在不知道怎么弄，只好目力调整
\setlength\headheight{14mm}    % 页眉高度 12\p@
%\setlength\headheight{15\p@}    % 页眉高度为14mm
\setlength\headsep{4mm}       % 页眉与正文间距  12\p@
\setlength\topskip{16\p@}       % 每页第一行的行间距
\setlength\footskip{30\p@}      % 页脚基线与每一页最后一行文本基线的距离
\setlength\maxdepth{.5\topskip}	% \maxdepth + \topskip = typesize x 1.5
% 含页眉页码 16.2x26.7 不含页眉页码 16.2x24.9
\setlength\textwidth{16.2cm}	% 
\setlength\textheight{24.9cm}	%  下面设置margin尺寸的时候一步一步进行上移，所以此处不包括页眉的高度
\setlength\marginparsep{10\p@}	% 边注与正文区域的间距
%\setlength\marginparpush{7\p@}

% 单双页面边栏设置
% 此处设置单双面打印相同
\if@twoside
	%\setlength\oddsidemargin{2.6cm}
	\setlength\oddsidemargin{2.4cm}
	\addtolength\oddsidemargin{-1in}
	%\setlength\evensidemargin{2cm}
	\setlength\evensidemargin{2.4cm}
	\addtolength\evensidemargin{-1in}
	%\setlength\marginparwidth{45\p@}
	\setlength\marginparwidth{50\p@}
\else
	\setlength\oddsidemargin{2.4cm}                    % 根据要求，默认单面打印左边距2.4cm
	\addtolength\oddsidemargin{-1in} 				   % latex2e 默认在页面四周留出1in的空白，所以要减去1in，onesiede下奇偶页侧边空白相同	 
	\setlength\evensidemargin{2.4cm}
	\addtolength\evensidemargin{-1in}
	\setlength\marginparwidth{50\p@}
\fi

% 设置topmargin 尺寸
% 默认在四周留出1in的空白 所以先整体向上提 2in
\setlength\topmargin{\paperheight}
\addtolength\topmargin{-1in} % 上提2in使得
\addtolength\topmargin{-\headheight} 
\addtolength\topmargin{-\headsep}
\addtolength\topmargin{-\textheight}
\addtolength\topmargin{-\footskip}
\addtolength\topmargin{-.5in}
%\addtolength\topmargin{-.5\topmargin}

% 双面打印时空白页中间显示文本
\newcommand*{\NEFU@blankpage}{%
	\par\vspace*{\fill}%
	\centerline{This page is intentionally left blank}. \par
	\vspace{\fill}
}

% 重新定义cleardouble 其原始定义在
% TODO 是否需要添加空白页仍需待定 

% 啊 正常封面打印的时候是需要空白页的，脑残了 所以再加上
\def\cleardoublepage{%
	\clearpage
	\if@twoside
		\ifodd
			\c@page
		\else
		% 下面这个命令，如果不需要强调这是空白页，或者学校不允许，可以将其注释
		\NEFU@blankpage
		\thispagestyle{NEFU@empty}%
		\hbox{}\newpage
		\if@twocolumn
			\hbox{}\newpage
		\fi
		\fi
	\fi
}

%---------- 页眉页脚 ----------
% 采用latex2e的底层代码，不用fancyhdr宏包。
% 页眉标记
\if@AcaMaster
\def\NEFU@M@thesis{东北林业大学硕士学位论文}
\else
\def\NEFU@M@thesis{东北林业大学硕士学位论文}
\fi

% 空白页：没有页眉页脚和页码 空白页的奇偶页眉页脚
\def\ps@NEFU@empty{%
	\let\@oddhead\@empty%
	\let\@evenhead\@empty%
	\let\@oddfoot\@empty%
	\let\@evenfoot\@empty}

% plain样式：只有页脚居中页码  这个plain样式暂时没有用到
\def\ps@NEFU@plain{%
	\let\@oddhead\@empty%
	\let\@evenhead\@empty%
	\if@twoside
	\def\@oddfoot{\hfil\zihao{-5}\thepage\hfil}%
	\def\@evenfoot{\hfil\zihao{-5}\thepage\hfil}%
	\else
	\def\@oddfoot{\hfil\zihao{-5}\thepage\hfil}
	\let\@evenfoot=\@oddfoot
	\fi
}
% chapter页的样式，与封面页不同，与正文页相同,chapter页修改 --> 页眉同样存在 每个chapter以及封面页所使用的样式
% 此处 \, 代表小空格 
\def\ps@NEFU@chapterplain{%
	%\let\@oddhead\@empty%
	%\let\@evenhead\@empty%
	\if@twoside
	\def\@oddfoot{\hfil\zihao{-5}{-\,\thepage\,-}\hfil}%
	\def\@evenfoot{\hfil\zihao{-5}{-\,\thepage\,-}\hfil}%
	\else
	\def\@oddfoot{\hfil\zihao{-5}{-\,\thepage\,-}\hfil}
	\let\@evenfoot=\@oddfoot
	\fi
}
% 文章主样式， 分单双面打印样式 
% 将页眉页尾由两侧切换至居中显示
% 该部分为 主内容的样式
% 根据NEFU论文规范1.0 页眉处在版芯上边线隔一行加粗 粗线宽度 0.8mm
\if@twoside
\def\ps@NEFU@headings{%
	\def\@oddhead{\vbox to\headheight{%\NEFU@M@thesis\hfill 此处添加两个
			\vskip8.5mm\hb@xt@\textwidth{\zihao{-5}\songti\hfil\leftmark\hfil}%
			\vskip2pt\hbox{\vrule width\textwidth height0.5mm depth0pt}\vskip1pt \hbox{\vrule width\textwidth height0.4pt depth0pt}}}
	\def\@evenhead{\vbox to\headheight{%\leftmark\hfill
			\vskip8.5mm\hb@xt@\textwidth{\zihao{-5}\songti\hfil\NEFU@M@thesis\hfil}%
			\vskip2pt\hbox{\vrule width\textwidth height0.5mm depth0pt}\vskip1pt \hbox{\vrule width\textwidth height0.4pt depth0pt}}}
	\def\@oddfoot{\hfil\zihao{-5}{-\,\thepage\,-}\hfil}
	\def\@evenfoot{\hfil\zihao{-5}{-\,\thepage\,-}\hfil}
	% \let\@evenfoot=\@oddfoot
	\let\@mkboth\markboth}
\else
\def\ps@NEFU@headings{%
	\def\@oddhead{\vbox to\headheight{%
			\vskip8.5mm\hb@xt@\textwidth{\zihao{-5}\songti\NEFU@M@thesis\hfill\leftmark}%
			\vskip2pt\hbox{\vrule width\textwidth height0.5mm depth0pt}\vskip1pt \hbox{\vrule width\textwidth height0.4pt depth0pt}}}
	\let\@evenhead=\@oddhead
	\def\@oddfoot{\hfil\zihao{-5}{-\,\thepage\,-}\hfil}
	\let\@evenfoot=\@oddfoot
	\let\@mkboth\markboth}
\fi

% 重新定义\chaptermark，使其为\leftmark引用
\renewcommand\chaptermark[1]{ %\MakeUppercase 原来的abstract页眉都转换成大写，现在切换至正常
\markboth{{%
\ifnum \c@secnumdepth > \m@ne
	\if@mainmatter
		\@chapapp \hskip1em%
	\fi
\fi
#1}}{}}

%---------- 本机字体设置 ----------
\RequirePackage{fontspec}
%\setmainfont[]{TeX Gyre Termes}	%相当于MS Word中的Times New Roman。
\setmainfont[BoldFont={Times New Roman}]{Times New Roman}
%\setsansfont{TeX Gyre Heros}	%相当于MS Word中的Helvetica。
%\setsansfont{Arial}
\setsansfont{Times New Roman}
%\setmonofont{TeX Gyre Cursor}	%相当于MS Word中的Curier。
\setmonofont{Times New Roman}
\RequirePackage{xeCJK}
%\RequirePackage{CJK}

% xeCJK 环境初始化
\xeCJKsetup{xeCJKactive=true}

% 打开/关闭CJK文字之间的空格，tex 源码中汉字间的换行符和空格都会被编译成空格
% 作者编写论文 tex 源码时一般写到一个逗号就换行再写 这样能最大限度的保证清晰
% 如不符合您的需求请自行解注释
\xeCJKsetup{CJKspace=true}

%\xeCJKsetup{CheckSingle=true} % 避免单个CJK字符独占一行

% 非简体中文常用字处理(生僻字、繁体字、日本汉字)
% 发现实际排版时此类字框会相对于行内上移一个微小的单位
% 故当封面作者名称含此类字时，只能预留相应的字框宽度，待后期补上
%\xeCJKDeclareCharClass{Ext-B}{ "20000 -> "2A6DF } % 看XeLaTeX文档写的 没软用
%\xeCJKsetup{AutoFallBack=true} % 如果不加这句 非简体中文汉字在章节标题和论文标题上显示异常

% 标点处理格式 行末半角 所有标点占一个汉字宽度 行首行末对齐
\xeCJKEditPunctStyle{hangmobanjiao}{enabled-global-setting = false}


% 设置中文正文字体为仿宋，加粗为黑体，斜体为楷体
% 根据NEFU论文规范1.0 正文段落 宋体 / Times New Roman 小四号
\setCJKmainfont[BoldFont={SimHei}, ItalicFont={KaiTi}]{SimSun}
%\setCJKmainfont{SimSun}
% 中文无衬线字体，不知道怎么设置，待以后解决。
% \setCJKsansfont{}
% 由于汉字都是等宽的，等宽字体通常应用在代码中，故这里选择用幼圆字体，具体有待以
% 后更改。
\setCJKmonofont{YouYuan}


% 学位论文 专业学位论文 字体设置
\setCJKfamilyfont{hwxw}{STXinwei}    
\newcommand{\hwxw}{\CJKfamily{hwxw}}
\newcommand{\xiaochuhao}{\fontsize{36pt}{\baselineskip}\selectfont}
% title
\setCJKfamilyfont{hei}{SimHei}
\newcommand{\hei}{\CJKfamily{hei}}
\newcommand{\erhao}{\fontsize{21pt}{\baselineskip}\selectfont}
% name 此处注意修改 font.def文件 将 SimKai.tff -> KaiTi_GB2312
\setCJKfamilyfont{kt}{KaiTi_GB2312}
\newcommand{\kt}{\CJKfamily{KaiTi_GB2312}}
\newcommand{\yihao}{\fontsize{22pt}{\baselineskip}\selectfont}

\newcommand{\xiaoerhao}{\fontsize{18pt}{\baselineskip}\selectfont}
\newcommand{\xiaosihao}{\fontsize{12pt}{\baselineskip}\selectfont}

% 新罗马字体为英文摘要
\newcommand{\tnewroman}{\fontspec{Times New Roman}}
\newcommand{\arial}{\fontspec{Arial}}




%---------% 封面及中英标题页 ----------
% 定义封面及标题页设置中常用的下划线命令（默认宽度90pt）
\renewcommand\ULthickness{0pt}    % 重新定义下划线的厚度
\newcommand\NEFUunderline[2][90pt]{\uline{\hbox to #1{\hss#2\hss}}\hskip3pt}
% 重新定义\maketitle
\renewcommand\maketitle{
% \@mainmatterfalse
	\NEFUmakecover
	\NEFUmakeenglishcover
	%\NEFUmakeCNtitlepage
	% 博士显示英文题名页，硕士不显示
	%\makeOSpag
}
% 封面
\newcommand\NEFUmakecover{
	%\cleardoublepage
	\pdfbookmark[0]{封面}{anchor_cover}
	\thispagestyle{NEFU@empty}
	%分类号: \NEFUunderline[90pt]{\NEFU@classification}
	\hfill
	\makebox[5em][s]{\songti \zihao{4} 学校代码}: \NEFUunderline[60pt]{\NEFU@serialnumber} \par
	%密\quad 级: \NEFUunderline[90pt]{\NEFU@secretlevel} 
	\hfill
	% 此处仍然通过下划线的作用，将下划线厚度置为0pt
	\makebox[5em][s]{\songti \zihao{4} 学号}: \NEFUunderline[60pt]{\NEFU@studentnumber} \par
	\vspace{10mm}
	\begin{center}
		% TODO 此处需要NEFU的logo
		%\includegraphics[width=60mm]{./logo/NEFULOGO} \par
		%\vspace{4mm}
		\vspace{18pt}
		{
			\if@AcaMaster
			% TODO 这里需要确定 宋体小2号 华文新彩 小二号
				{\hwxw \xiaochuhao 学 位 论 文}
			\else
				{\hwxw \xiaochuhao 专 业 学 位 论 文}
			\fi
		}
		%\vspace{6mm}
		% TODO 此处需要NEFU的logo
		%\includegraphics[width=22.8mm]{./logo/QSY.pdf}
	\end{center}
	%\vspace{6mm}
	\vspace{18pt}
	% 新建一个长度寄存器，存放封面标题下划线的宽度值
	\newlength{\titleulwidth@cover}
	\addtolength{\titleulwidth@cover}{260pt}
	\begin{center}
		{\hei \zihao{2} \NEFU@title} 
		% 这里的空格很关键
		
		\vspace{15pt}
		\vspace{15pt}
		\vspace{15pt}
		\vspace{15pt}
		{\kt \zihao{-1} \NEFU@author}
		\vspace{15pt}
		\vspace{15pt}
		\vspace{15pt}
		\vspace{15pt}
		%\begin{tabular}[t]{>{\zihao{3}\bfseries}rl}
		%	中文论文题目: &
		%	{\begin{minipage}[t][60pt][t]{\titleulwidth@cover}
		%			\zihao{-2} \fangsong\bfseries
		%			\uline{\NEFU@title\hfill}
		%	\end{minipage}} \\%[20pt]
		%	\rule{0pt}{10mm}英文论文题目: &
		%	{\begin{minipage}[t][60pt][t]{\titleulwidth@cover}
		%			\newlength{\etitlelength}
		%			\fontsize{16}{23}\bfseries
		%			\settowidth{\etitlelength}{\NEFU@englishtitle}
					% 使封面英文标题下划线数量能够适应因英文标题内容长短变化而引起的英文标题行数变化
					% 而引起的下划线行数变化，下划线行数就是英文标题行数。目前最大的支持行数为3行，
					% 不过行数可以根据需要扩展，只要符合页面格式的美观即可。不过论文编写规则中提到：
					% 英文标题翻译应简短准确，一般不应超过150个字母，必要时可以加副标题。
		%			\NEFU@englishtitle\\*
		%			\ifdim\etitlelength<\titleulwidth@cover
		%			\raisebox{31pt}[0pt][0pt]{\parbox[t][][t]{\titleulwidth@cover}{
		%					\rule{\titleulwidth@cover}{\ULthickness}}}
		%			\else\ifdim\etitlelength<2\titleulwidth@cover
		%			\raisebox{67pt}[0pt][0pt]{\parbox[t][][t]{\titleulwidth@cover}{
		%					\rule{\titleulwidth@cover}{\ULthickness}\\*
		%					\rule{\titleulwidth@cover}{\ULthickness}}}
		%			\else\ifdim\etitlelength<3\titleulwidth@cover
		%			\raisebox{103pt}[0pt][0pt]{\parbox[t][][t]{\titleulwidth@cover}{
		%					\rule{\titleulwidth@cover}{\ULthickness}\\*
		%					\rule{\titleulwidth@cover}{\ULthickness}\\*
		%					\rule{\titleulwidth@cover}{\ULthickness}}}
		%			\fi\fi\fi
		%	\end{minipage}}\\*
		%\end{tabular}
		% 此处表格的头的定义 array 要符合格式 >{}>{}>{} 最后一项没有 >
		\begin{tabular}{>{\zihao{4}\hei}c>{\zihao{4}\songti}l>{\zihao{4}\hei}c>{\zihao{4}\songti}l}
			\if@cpsupervisor
				\multirow{2}{*}{\makebox[7em][s]{指导教师姓名:}}& \multicolumn{3}{l}{\multirow{2}{*}{\zihao{4}\songti \tabincell{l}{\NEFU@supervisor\\[-1mm] \NEFU@cpsupervisor} }} \\ [7mm]
			\else
				\makebox[7em][s]{指导教师姓名:} & \multicolumn{3}{l}{\zihao{4}\songti \NEFU@supervisor} \\	[3mm]
			\fi
			%\if@cpsupervisor
			%合作导师: & \NEFUunderline[200pt]{\NEFU@cpsupervisor} \\[3mm]
			%\fi
			% 利用makebox进行不一致长度的文字对齐 s表示分散对齐
			\makebox[7em][s]{申请学位级别:} & \NEFU@degreelevel        & \if@AcaMaster\makebox[7em][s]{学科专业:}\else\makebox[7em][s]{学科领域:}\fi & \NEFU@major \\ [3mm]
			\makebox[7em][s]{论文提交日期:} & \NEFU@submitdate     & \makebox[7em][s]{论文答辩日期:}& \NEFU@replydate \\ [3mm]
			\makebox[7em][s]{授予学位单位:} & \NEFU@awardingunit & \makebox[7em][s]{授予学位日期:}& \NEFU@awardingdate \\ [18pt]
			\multicolumn{4}{c}{\zihao{4} \hei \makebox[8em][s]{答辩委员会主席:}} \\ [3mm]
			\multicolumn{4}{c}{\zihao{4} \hei \makebox[8em][s]{论文评阅人:}}
		\end{tabular}
	\end{center}
	\vspace{10.5pt}
	\vspace{10.5pt}
	\vspace{10.5pt}
	\vspace{10.5pt}
	\begin{center}
		\includegraphics[width=7.01cm,height=1.56cm]{./logo/NEFU}
	\end{center}
	\vspace{12pt}
	\vspace{10.5pt}

	%\begin{center}
	%	{\zihao{-3}\songti\bfseries 论文提交日期\NEFUunderline[150pt]{%
	%			\NEFU@submitdate}}
	%\end{center}
	\global\let\NEFU@classification\@empty
	\global\let\NEFU@serialnumber\@empty
	\global\let\NEFU@secretlevel\@empty
	\global\let\NEFU@studentnumber\@empty
	\global\let\NEFU@author\@empty
	\global\let\NEFU@supervisor\@empty
	\global\let\NEFU@cpsupervisor\@empty
	\global\let\NEFU@major\@empty
	\global\let\NEFU@research\@empty
	\global\let\NEFU@institute\@empty
	\global\let\NEFU@submitdate\@empty
	\global\let\classification\relax
	\global\let\serialnumber\relax
	\global\let\secretlevel\relax
	\global\let\studentnumber\relax
	\global\let\author\relax
	\global\let\supervisor\relax
	\global\let\cpsupervisor\relax
	\global\let\major\relax
	\global\let\research\relax
	\global\let\institute\relax
	\global\let\submitdate\relax
}
\newcommand\NEFUmakeenglishcover{
	\cleardoublepage
	\pdfbookmark[0]{封面}{anchor_cover}
	\thispagestyle{NEFU@empty}
	%分类号: \NEFUunderline[90pt]{\NEFU@classification}
	\hfill
	{\xiaosihao University Code}: \NEFUunderline[60pt]{\NEFU@serialnumber} \par
	%密\quad 级: \NEFUunderline[90pt]{\NEFU@secretlevel} 
	\hfill
	% 此处仍然通过下划线的作用，将下划线厚度置为0pt 
	% 这里将下划线长度调整到70pt使得两个code左对齐
	{\xiaosihao Register Code}: \NEFUunderline[70pt]{\NEFU@studentnumber} \par
	\vspace{10mm}
	\begin{center}
		% TODO 此处需要NEFU的logo
		%\includegraphics[width=60mm]{./logo/NEFULOGO} \par
		%\vspace{4mm}
		\vspace{18pt}
		{
			\if@AcaMaster
			{\xiaochuhao Dissertation for the Degree of Master}
			\else
			{\xiaochuhao Dissertation for the Degree of Master}
			\fi
		}
		%\vspace{6mm}
		% TODO 此处需要NEFU的logo
		%\includegraphics[width=22.8mm]{./logo/QSY.pdf}
	\end{center}
	\vspace{18pt}
	\begin{center}
		{\zihao{2} \NEFU@englishtitle} 
		% 这里的空格很关键
		
		\vspace{15pt}
		\vspace{15pt}
		\vspace{15pt}
		\vspace{15pt}
		%{\zihao{1} \NEFU@author}
		\vspace{15pt}
		\vspace{15pt}
		\vspace{15pt}
		\vspace{15pt}
		%\zihao{4} 
		\begin{tabular}{>{\zihao{4}\bfseries}l>{\zihao{4}}l}
			{Candidate}: & Qiucheng Miao\\ [3mm]
			\if@cpsupervisor
				\multirow{2}{*}{Supervisor:}& {\multirow{2}{*}{\tabincell{l}{\NEFU@supervisorenglish\\[-1mm] \NEFU@cpsupervisorenglish} }}\\[7mm]
			\else
				{Supervisor:}& {\NEFU@supervisorenglish} \\ [3mm]
			\fi
			
			{Candidate}: & \NEFU@supervisorenglish \\ [3mm]
			{Academic Degree Applied for}: & \NEFU@degreelevelenglish \\ [3mm]
			{Speciality}: & \NEFU@majorenglish \\ [3mm]
			{Date of Oral Examination}: & \NEFU@replydateenglish \\ [3mm]
			{University}: & \NEFU@awardingunitenglish \\
			
		\end{tabular}
	\end{center}
	\vspace{10.5pt}
	\vspace{10.5pt}
	\vspace{12pt}
	\vspace{10.5pt}
	\global\let\NEFU@classification\@empty
	\global\let\NEFU@serialnumber\@empty
	\global\let\NEFU@secretlevel\@empty
	\global\let\NEFU@studentnumber\@empty
	\global\let\NEFU@author\@empty
	\global\let\NEFU@supervisor\@empty
	\global\let\NEFU@cpsupervisor\@empty
	\global\let\NEFU@major\@empty
	\global\let\NEFU@research\@empty
	\global\let\NEFU@institute\@empty
	\global\let\NEFU@submitdate\@empty
	\global\let\classification\relax
	\global\let\serialnumber\relax
	\global\let\secretlevel\relax
	\global\let\studentnumber\relax
	\global\let\author\relax
	\global\let\supervisor\relax
	\global\let\cpsupervisor\relax
	\global\let\major\relax
	\global\let\research\relax
	\global\let\institute\relax
	\global\let\submitdate\relax
}
	
	
%  层次标题格式的设置
\setcounter{secnumdepth}{4}  %设置为四级标题
\renewcommand\@chapapp{\thechapter}

% 以下对标题格式采用laTeX2e底层命令主要是为了防止ctex宏包升级改变导致的命令不兼
% 容性，假如2.0之后宏包对1.02宏包命令不再支持，以后又要修改，不如一鼓作气。
% 现在以下命令可以正常工作，调整参数则慢慢来吧。


%% 章标题格式设置----小三仿宋加黑


% 更改为黑体小二加黑

% 在book类中 \chapter 总是令起一页，希望 \chapter 不要换页紧接着当前内容进行排版
% TODO 看不太懂
% TODO 将中英文摘要分开的极其笨重的方法 cn en

\renewcommand\chapter{%
	\if@openright\cleardoublepage\else\clearpage\fi%
	\phantomsection			% hyperref宏包的命令，超链接用。
	\thispagestyle{NEFU@chapterplain}%
	\global\@topnum\z@%
	\@afterindenttrue%
	\secdef\@chapter\@schapter}
% @chapter
\def\@chapter[#1]#2{
	\ifnum \c@secnumdepth > \m@ne
		\if@mainmatter
			\refstepcounter{chapter} % 计数器不变
			\addcontentsline{toc}{chapter}{\protect\numberline{\@chapapp}#1}
		\else
			\addcontentsline{toc}{chapter}{#1}
		\fi
	\else
		\addcontentsline{toc}{chapter}{#1}
	\fi
	\chaptermark{#1}
	% 在图目录和表目录中相应章节位置加垂直10pt空白
	\addtocontents{lof}{\protect\addvspace{10\p@}}
	\addtocontents{lof}{\protect\addvspace{10\p@}}
	\@makechapterhead{#2}
	\@afterheading 
}

% TODO abstract chapter
%\newcommand\abchapter{%
%	\if@openright\cleardoublepage\else\clearpage\fi%
%	\phantomsection			% hyperref宏包的命令，超链接用。
%	\thispagestyle{NEFU@plain}%
%	\global\@topnum\z@%
%	\@afterindenttrue%
%	\secdef\@chapter\@schapter}
% @chapter
%\def\@abchapter[#1]#2{
%	\ifnum \c@secnumdepth > \m@ne
%	\if@mainmatter
%	\refstepcounter{chapter} % 计数器不变
%	\addcontentsline{toc}{chapter}{\protect\numberline{\@chapapp}#1}
%	\else
%	\addcontentsline{toc}{chapter}{#1}
%	\fi
%	\else
%	\addcontentsline{toc}{chapter}{#1}
%	\fi
%	\chaptermark{#1}
	% 在图目录和表目录中相应章节位置加垂直10pt空白
%	\addtocontents{lof}{\protect\addvspace{10\p@}}
%	\addtocontents{lof}{\protect\addvspace{10\p@}}
%	\@makechapterhead{#2}
%	\@afterheading 
%}

% chapter 标题 黑体小二号 根据东北林业大学论文规范
\def\@makechapterhead#1{
	\vspace*{-4mm}
	{\parindent \z@ \if@frontmatter\centering\else\raggedright\fi % frontmatter centering
	\arial\centering\zihao{-2}\bfseries{\centering\hei\zihao{-2}}  % 所有chapter的标题 黑体小二加黑
	\ifnum \c@secnumdepth > \m@ne
		\if@mainmatter
			\@chapapp \hskip1em
		\fi
	\fi
	\interlinepenalty\@M
	#1\par\nobreak
	\vskip 10\p@
	}
}
% @schapter
\def\@schapter#1{
	\@makeschapterhead{#1}
	\@afterheading
}
\def\@makeschapterhead#1{
	\vspace*{-4mm}%12\p@
	{\parindent \z@ \raggedright
	\centering \hei \zihao{-2}  % 所有chapter的标题 黑体小二加黑
	\interlinepenalty\@M
	#1\par\nobreak
    \vskip 10\p@
	}
}

% 新建一个章节标题宏，用法跟\chapter一样，只不过在无星号时，标题插入目录，但是没
% 有页码和中间点线。加星号功能跟\chapter一样，主要为了兼容。\mainmatter中chapter
% 编号计数器不变\npchapter和\chapter都为chapter计数器。

\newcommand\npchapter{
	\if@openright\cleardoublepage\else\clearpage\fi%
	\phantomsection			% hyperref宏包的命令，超链接用。
	\thispagestyle{NEFU@chapterplain}%     目录也需要的是 chapterplain 样式
	\global\@topnum\z@%
	\@afterindenttrue%
	\secdef\@npchapter\@schapter}

\def\@npchapter[#1]#2{%
	\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter
			\refstepcounter{chapter}%计数器不变
			\addcontentsline{toc}{nopagechapter}{\protect\numberline{\@chapapp}#1}
		\else
		% TODO exclude 目录
		%\addcontentsline{toc}{nopagechapter}{#1}%
	\fi
	\else
		\addcontentsline{toc}{chapter}{#1}%
	\fi
	\chaptermark{#1}%
	% 在图目录和表目录中相应章节位置加垂直10pt的空白。
	\addtocontents{lof}{\protect\addvspace{10\p@}}%
	\addtocontents{lot}{\protect\addvspace{10\p@}}%
	\@makechapterhead{#2}
	\@afterheading}



% 根据东北林业大学论文规范1.0 所有标题均不加粗
%% 一级节标题格式设置 四号仿宋加黑 --> 黑体小三

% TODO 目前section title中的英文字体有问题，英文字体为arial而不是times new roman
\titleformat{\section}[block]{\arial\bfseries\zihao{-3}}{\arabic{chapter}.\arabic{section}}{1em}{}[]
\titleformat{\subsection}[block]{\arial\bfseries\zihao{4}}{\arabic{chapter}.\arabic{section}.\arabic{subsection}}{1em}{}[]
\titleformat{\subsubsection}[block]{\arial\zihao{-4}\bfseries}{\arabic{chapter}.\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}{1em}{}[]

\titlespacing{\section}{0ex}{2ex \@plus .2ex \@minus .2ex}{1.8ex \@plus.2ex}
\titlespacing{\subsection}{0ex}{1.6ex \@plus 0.4ex \@minus .2ex}{1ex \@plus.2ex}
\titlespacing{\subsubsection}{0ex}{1.4ex \@plus 0.3ex \@minus .2ex}{0.9ex \@plus.2ex}

%\renewcommand\section{\@startsection{section}{1}{\z@}
%												{2ex \@plus .2ex \@minus .2ex}% 与上文之间的间隔
%												{1.8ex \@plus.2ex}%
%												{\parindent \z@ \raggedright
%												\hei\zihao{-3}}}

%%二级节标题格式设置----小四号仿宋  --> 黑体四号
%\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
%													  {1.6ex \@plus 0.4ex \@minus .2ex}%
%													  {1ex \@plus.2ex}%
%													  {\parindent \z@ \raggedright
%													  \hei\zihao{4}}}									 	


%%三级节标题格式设置----小四号仿宋 --> 黑体小四
%\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
%									                       	{1.4ex \@plus 0.3ex \@minus .2ex}%
%	                                                       	{0.9ex \@plus.2ex}%
 %                                                           {\parindent \z@ \raggedright
  %                                                      		\hei\zihao{-4}}}


%\titleformat{\subsection}[block]{format}{label}{sep}{before-code}[after-code]
%\titleformat{\subsubsection}[block]{format}{label}{sep}{before-code}[after-code]



\newif\if@frontmatter\@frontmatterfalse
% \frontmatter \mainmatter \backmatter 重新定义
                                                    
\renewcommand\frontmatter{
	\if@openright\cleardoublepage\else\clearpage\fi
	\@frontmattertrue
	\@mainmatterfalse
	\pagenumbering{Roman}
	\pagestyle{NEFU@headings}
}
\renewcommand\mainmatter{
	\if@openright\cleardoublepage\else\clearpage\fi
	\@frontmatterfalse
	\@mainmattertrue
	\pagenumbering{arabic}
	\pagestyle{NEFU@headings}
}
\renewcommand\backmatter{
	\if@openright\cleardoublepage\else\clearpage\fi
	\@frontmatterfalse
	\@mainmatterfalse
}


% 对\appendix进行重新定义，使之可以在\backmatter之后产生章节标题序号，且在书签栏
% 和目录上点击后可以正常跳转到相应的标题项。放弃原来对 \appendix的修改，在前部加
% 上\mainmattertrue会导致书签和目录项跳转产生问题。

\let\OLDappendix\appendix
\newif\if@appendixinbackmatter
\renewcommand\appendix{
	\if@mainmatter
		\@appendixxinbackmatterfalse
		\OLDappendix
	\else
		\@appendixinbackmattertrue
		\@mainmattertrue
		\OLDappendix
		\renewcommand\@chapapp{附录~\thechapter}
		\gdef\thechapter{\@Alph\c@chapter}
	\fi
}
%  目录 目次
%\renewcommand{\contentsname}{目\texorpdfstring{\NEFUspace}{}录}      % 重新命名章节目录名
%\renewcommand{\listfigurename}{插\texorpdfstring{\NEFUspace}{}图}    % 重新命名插图目录名
%\renewcommand{\listtablename}{表\texorpdfstring{\NEFUspace}{}格}     % 重新命名表目录名字

% 下一条命令作用：在toc目录文件中插入‘\let\CTEX@spaceChar\relax’字符，用以删除目
% 录中的空格字符，其空格字符由\CTEX@spaceChar定义。
\addtocontents{toc}{\let\string\NEFU@spaceChar\relax}

% 目录位置尺寸设置
\renewcommand\@pnumwidth{1.55em}     % 放页码page这个盒子的宽度
\renewcommand\@tocrmarg{2.55em}      % 这个参数没用 改动以后看不到效果
\renewcommand\@dotsep{0.8}           %  目录点间距离
\setcounter{tocdepth}{2}             %  目录深度，到subsection

% 章节目录
\renewcommand\tableofcontents{
		% 使用\npchapter 将标题插入目录，但是不产生页码和中间点线
		\npchapter{\contentsname}
		% TODO 在目录页不加入 目录
		\markboth{\contentsname}{}
		\@starttoc{toc}
}

% 发现latex2e源码中有这么一行：\def\contentsline#1{\csname l@#1\endcsname}这样一
% 下子就明白了，以\l@*** 开头的命令的两个参数就是\contentsline使用说明的三个参数
% 中的后面两个参数，虽然定义的时候\contentsline只有一个参数。
% #1为目录内容，可以加上章节号title，\chapter中有定义；#2为页码page。
\renewcommand*\l@chapter[2]{
	\ifnum \c@tocdepth > \m@ne
			\addpenalty{-\@highpenalty}
			% 下一行增加新一章章节标题在目录中与前面部分的间距
			% \vskip 2\p@ \@plus \p@
			% 下一行是章节序号所在box的宽度
			\setlength\@tempdima{1.5em}  %
			\begingroup
							\parindent \z@ \rightskip \@pnumwidth
				\parfillskip -\@pnumwidth
				\leavevmode
				\advance\leftskip\@tempdima
				\hskip -\leftskip
				\arial\zihao{-4}\bfseries{\hei \zihao{-4}\bfseries #1}\nobreak
				% 下两行是增加章节标题项的中间点
				% 此处章节标题的点也是\bfseries的
				\leaders\hbox{\bfseries$\m@th%
					\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
				\nobreak\hb@xt@\@pnumwidth{\hss #2}\par
				\penalty\@highpenalty
				\endgroup
				\fi}
			
			
% 这个样式主要是为“目录”这个标题在目录页中的样式服务的，模板中要求“目录”没有页码
% 和中间点连接线，所以弄了这么个nopagechapter目录格式。你说我为什么不用其他方法，
% 这也是没办法，hyperref 宏包把\addcontentsline和\contentsline改了，主要是为了超
% 链接用，如果我把他们重新定义，超链接就会失效。

\newcommand*\l@nopagechapter[2]{%
	\ifnum \c@tocdepth >\m@ne
		\addpenalty{-\@highpenalty}%
		\setlength\@tempdima{1.5em}%
		\begingroup
			\parindent \z@ \rightskip \@pnumwidth
			\parfillskip -\@pnumwidth
			\leavevmode
			\advance\leftskip\@tempdima
			\hskip -\leftskip
			\arial\zihao{-4}\bfseries{\hei\zihao{-4}\bfseries #1}\nobreak\hfill
			\nobreak\hb@xt@\@pnumwidth{\hss}\par
			\penalty\@highpenalty
		\endgroup
	\fi}


% \@dottedtocline定义了5个参数，但是一下命令里只使用了两个，后面两个其实原理跟上
% 面介绍的一样，\contentsline带有3个参数，第一个参数展开后形成\l@***的命令，然后
% \l@***再展开，形成带有3个参数的\@dottedtocline{}{}{}，\@dottedtocline还需title
% 和page两个参数，而\contentsline剩下的两个参数刚好是title和page。
% TODO 对目录中三个标题的格式进行重新定义
%\renewcommand*\l@section{\@dottedtocline{1}{2em}{2.1em}}
%\renewcommand*\l@subsection{\@dottedtocline{2}{4em}{3em}}
%\renewcommand*\l@subsubsection{\@dottedtocline{3}{6em}{3.8em}}

\renewcommand*\l@section[2]{
	\ifnum \c@tocdepth > \m@ne
	\addpenalty{-\@highpenalty}
	% 下一行增加新一章章节标题在目录中与前面部分的间距
	%\vskip 2\p@ \@plus \p@
	% 下一行是章节序号所在box的宽度
	\setlength\@tempdima{1.5em}  %
	\begingroup
	\parindent \z@ \rightskip \@pnumwidth
	\parfillskip -\@pnumwidth
	\leavevmode
	\advance\leftskip\@tempdima
	\hskip -\leftskip
	\arial\zihao{-4}{\songti \zihao{-4}#1}\nobreak
	% 下两行是增加章节标题项的中间点
	% 此处章节标题的点也是\bfseries的
	\leaders\hbox{$\m@th%
		\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
	\nobreak\hb@xt@\@pnumwidth{\hss #2}\par
	\penalty\@highpenalty
	\endgroup
	\fi}
\renewcommand*\l@subsection[2]{
	\ifnum \c@tocdepth > \m@ne
	\addpenalty{-\@highpenalty}
	% 下一行增加新一章章节标题在目录中与前面部分的间距
	%\vskip 2\p@ \@plus \p@
	% 下一行是章节序号所在box的宽度
	\setlength\@tempdima{1.5em}  %
	\begingroup
	\parindent \z@ \rightskip \@pnumwidth
	\parfillskip -\@pnumwidth
	\leavevmode
	\advance\leftskip\@tempdima
	\hskip -\leftskip
	\arial\zihao{-4}{\songti \zihao{-4}#1}\nobreak
	% 下两行是增加章节标题项的中间点
	% 此处章节标题的点也是\bfseries的
	\leaders\hbox{$\m@th%
		\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
	\nobreak\hb@xt@\@pnumwidth{\hss #2}\par
	\penalty\@highpenalty
	\endgroup
	\fi}
\renewcommand*\l@subsubsection[2]{
	\ifnum \c@tocdepth > \m@ne
	\addpenalty{-\@highpenalty}
	% 下一行增加新一章章节标题在目录中与前面部分的间距
	%\vskip 2\p@ \@plus \p@
	% 下一行是章节序号所在box的宽度
	\setlength\@tempdima{1.5em}  %
	\begingroup
	\parindent \z@ \rightskip \@pnumwidth
	\parfillskip -\@pnumwidth
	\leavevmode
	\advance\leftskip\@tempdima
	\hskip -\leftskip
	\arial\zihao{-4}{\songti \zihao{-4}#1}\nobreak
	% 下两行是增加章节标题项的中间点
	% 此处章节标题的点也是\bfseries的
	\leaders\hbox{$\m@th%
		\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
	\nobreak\hb@xt@\@pnumwidth{\hss #2}\par
	\penalty\@highpenalty
	\endgroup
	\fi}
% 图目录
\renewcommand\listoffigures{%
	\if@openright\cleardoublepage\else\clearpage\fi%
	\chapter{\listfigurename}
	\@starttoc{lof}}

\renewcommand*\l@figure{\@dottedtocline{1}{0\p@}{2.3em}}

% 表目录
\renewcommand\listoftables{%
	\if@openright\cleardoublepage\else\clearpage\fi%
	\chapter{\listtablename}
	\@starttoc{lot}}

\let\l@table\l@figure

% ---------- 参考文献样式 ----------
% 修改thebibliography 环境用于在目次中加入参考文献页。
\renewenvironment{thebibliography}[1]
{\chapter{\bibname}%
	\@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
	\list{\@biblabel{\@arabic\c@enumiv}}%
	{\settowidth\labelwidth{\@biblabel{#1}}%
		\leftmargin\labelwidth
		\advance\leftmargin\labelsep
		\itemsep \z@ \@plus\p@ \@minus\p@
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



% 采用gbt7714-2005参考文献样式，
% 参考自https://github.com/githamburger/GBT7714-2005-BibTeX-Style
\bibliographystyle{gbt7714-2005}



% natbib宏包命令，参考文献上标设置。
\setcitestyle{super,square,comma}



% 重新定义 \ref 命令，使其前面自动加一个 ``~''。因为hyperref 宏包会通过 \AtBegin-
% Document 修改 \ref 的定义，因此我们对 \ref 的修改也必须使用\AtBeginDocument 命
% 令进行。同时我们需要修改 \eqref，使其括号前后不出现空隙。参考自njuthesis胡海星。
\AtBeginDocument{%
	\let\oldref\ref%
	\renewcommand*{\ref}[1]{\thinspace\oldref{#1}}%
	\renewcommand*{\eqref}[1]{(\oldref{#1})}
}


% ---------- 浮动体相关定义 ----------
% 设置浮动环境标题的字体大小。根据学位论文格式要求，插图和标题字体需要比正文
% 字体略小。
\captionsetup{%
	format=hang,
	labelsep=quad,		% 去掉图表号后的冒号。图序与图名文字之间空一个汉字宽度。
	skip=0pt,			% 标题与图标之间空10pt距离。   更改将10pt的距离改为无距离
	font=small,			% 标题字体比正文小一号，这里取small。 正文为小四 标题则为五号，不支持英文，所以都是宋体五号
	% width=0.75\textwidth 	% 标题最大宽度为0.75倍正文宽度。
	%TODO:width影响bi-second居中
}

% 根据学位论文格式要求，表格的标题必须位于表格上方，插图的标题必须位于插图下方。
\captionsetup[table]{position=above}
\captionsetup[figure]{position=below}

% 中英文双语bicaption定义
\captionsetup[bi-first]{bi-first}
\captionsetup[bi-second]{bi-second, list=off}


\DeclareCaptionOption{bi-first}[]{%
	\def\tablename{表}%
	\def\figurename{图}}
\DeclareCaptionOption{bi-second}[]{%
	\def\tablename{Tab}%
	\def\figurename{Fig}}


%% 以下为设置浮动对象和文字之间的距离。
% 版心顶部或者版心底部浮动体之间的垂直距离，默认为12pt plus 2pt minus 2pt。
\setlength{\floatsep}{10bp \@plus2pt \@minus1pt}

% 文本行之间浮动体（使用h位置选项）与上下文之间的距离，默认为12pt plus 2pt minus
% 2pt。
\setlength{\intextsep}{12bp \@plus2pt \@minus1pt}

% 版心顶部或底部的浮动体与文本之间的距离，默认为12pt plus 2pt minus 2pt。
\setlength{\textfloatsep}{12bp \@plus2pt \@minus1pt}

% 浮动页中，版心顶部的浮动体与版心顶边之间的距离，默认为0pt plus 1fil。
\setlength{\@fptop}{0bp \@plus1.0fil}

% 浮动页中浮动体直接的距离，默认为8pt plus 2fil。
\setlength{\@fpsep}{8bp \@plus2.0fil}

% 浮动页中，版心底部的浮动体与版心底边之间的距离，默认为0pt plus 1fil。
\setlength{\@fpbot}{0bp \@plus1.0fil}

%% 下面这组命令使浮动对象的缺省值稍微宽松一点，从而防止幅度对象占据过多的文本页
%% 面，也可以防止在很大空白的浮动页上放置很小的图形。
% 默认情况下，LaTeX要求每页的文字至少占据 20%，否则该页就只单独放置一个浮动环境。
% 而这通常不是我们想要的。我们将这个要求降低到 5%。
\renewcommand{\textfraction}{0.05}

% 在一文本页中，被置于版心顶部的所有浮动体的高度与版心高度的最大比值，默认为0.7，
% 这里修改为0.9，任何造成高度超过版心高度90% 的浮动体都被将阻止置于当前版心顶部。
\renewcommand{\topfraction}{0.9}

% 同上，只不过变成了版心底部，默认为0.3.
\renewcommand{\bottomfraction}{0.8}

% 在任意一个“浮动页”中，所有的浮动体高度与版心的高度的最小比值，默认为 0.5，这里
% 设置成0.85。因此，浮动页中空白与版心的比值不会超过1-\floatpagefraction。
\renewcommand{\floatpagefraction}{0.85}




% ---------- 中英文摘要及关键词 ----------
% 中文摘要环境
%\texorpdfstring{\NEFUspace}{}


% 在这里控制\chapter 内部的字体，使得两个chapter的字体不同 中文-宋体小四，英文-新罗马小四  除了封皮都有页眉，所以统一定义chapter样式 -> chapterplain
% 根据NEFU论文规范1.0 摘要标题为小二号黑体
\newenvironment{cabstract}{\songti \zihao{-4} \chapter{摘要}}{}
\newenvironment{eabstract}{\tnewroman \zihao{-4} \chapter{Abstract}}{}

% 结论与中文摘要的格式一致
\newenvironment{conclusion}{\songti \zihao{-4} \chapter{结论}}{}



% 中英文关键词命令及其格式的自动定义；
% 参照thuthesis，薛瑞尼，P37/66，v4.8.1 (2014/12/09)。
% 这段宏定义搞了我一个下午才看懂，哎…… 这个 \@for 命令挺有用的。
\def\NEFU@parse@keywords#1{
	\expandafter\gdef\csname NEFU@#1\endcsname{} % todo: need or not?
	\expandafter\gdef\csname @#1\endcsname##1{
	\@for\reserved@a:=##1\do{
			\expandafter\ifx\csname NEFU@#1\endcsname\@empty\else
			\expandafter\g@addto@macro\csname NEFU@#1\endcsname{%
				\ignorespaces\csname NEFU@#1@separator\endcsname}
			\fi
			\expandafter\expandafter\expandafter\g@addto@macro%
			\expandafter\csname NEFU@#1\expandafter\endcsname%
			\expandafter{\reserved@a}}}}
		
% 根据以上宏定义，以下命令分别产生\@ckeywords{} 和 \@ekeywords{} 两个读取关
% 键词的宏，和加工后保存关键词的 \ZJU@ckeywords 和 \ZJU@ckeywords 的宏定义。
\NEFU@parse@keywords{ckeywords}
\NEFU@parse@keywords{ekeywords}

% 以下分别是中英文关键词的分隔符
\def\NEFU@ckeywords@separator{；}
\def\NEFU@ekeywords@separator{;}


% 用户界面命令，读取和排版关键词
\newcommand*\ckeywords[1]{%
	\@ckeywords{#1}
	\vspace{2ex}
	\noindent{\hei \zihao{-4} 关键词\hspace{1em}}\NEFU@ckeywords}
	%\noindent{关键词:}\NEFU@ckeyworks}
\newcommand*\ekeywords[1]{%
	\@ekeywords{#1}
	\vspace{2ex}
	\noindent{\tnewroman \zihao{-4} \bfseries Keywords\hspace{1em}}\NEFU@ekeywords}




% ---------- 通用列表环境的重新定义 ----------
% 以下列表参数的修改主要是模仿book.cls，整体样式改动不大，只是修改了参数，但是去
% 掉了对twocolumn的支持。

%% 各级列表的缩进没有改变，所以注释掉了，如需改变，自己改。
% \setlength\leftmargini  {2.5em}
% \leftmargin  \leftmargini
% \setlength\leftmarginii  {2.2em}
% \setlength\leftmarginiii {1.87em}
% \setlength\leftmarginiv  {1.7em}
% \setlength\leftmarginv  {1em}
% \setlength\leftmarginvi {1em}

%% 标签与列表正文的间距和标签的宽度，因为参数没改，所以注释掉了。
% \setlength  \labelsep  {.5em}
% \setlength  \labelwidth{\leftmargini}
% \addtolength\labelwidth{-\labelsep}

% 鼓励在list前、后和item间分页。
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty

% 各级列表的参数结构参数设置
\def\@listi{\leftmargin\leftmargini
	\parsep\parskip
	\topsep\z@
	\itemsep\z@}
\let\@listI\@listi
\@listi
\def\@listii {\leftmargin\leftmarginii
	\labelwidth\leftmarginii
	\advance\labelwidth-\labelsep
	\topsep \z@
	\parsep \z@
	\itemsep \parsep}
\def\@listiii{\leftmargin\leftmarginiii
	\labelwidth\leftmarginiii
	\advance\labelwidth-\labelsep
	\topsep \z@
	\parsep \z@
	\partopsep \p@ \@plus\z@ \@minus\p@
	\itemsep \topsep}
\def\@listiv {\leftmargin\leftmarginiv
	\labelwidth\leftmarginiv
	\advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
	\labelwidth\leftmarginv
	\advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
	\labelwidth\leftmarginvi
	\advance\labelwidth-\labelsep}

% ---------- 打算重新定义Enumerate，Itemize，先挖个坑 ----------


% ---------- 缩写、符号清单、术语表 ----------
% 以下尺寸详细说明见P33/112
\newenvironment*{denotation}[1][2.5cm]{
	\chapter{缩写、符号清单、术语表}
	\noindent
	\begin{list}{}{
			\renewcommand\makelabel[1]{##1\hfil}
			\setlength{\itemindent}{0cm} 			% 标签缩进量
			\setlength{\labelsep}{1cm} 				% 标签与列表文本距离
			\setlength{\labelwidth}{#1} 			% 标签盒子宽度，如有需要可以自行修改
			\setlength{\listparindent}{0pt} 		% 同一\item 第二及以后段落缩进量
			\setlength{\rightmargin}{0cm}
			\setlength{\leftmargin}{\labelwidth}		% list环境整体向右推
			\addtolength{\leftmargin}{\labelsep}		% \labelwidth + \labelsep 的距离
			\setlength{\itemsep}{0pt plus2pt minus1pt}	% 标签间距
			\setlength{\parsep}{\itemsep} 				% 段落间距
			\setlength{\topsep}{0pt} 					% 标签与上文的间距
			\setlength{\partopsep}{3pt plus2pt minus2pt}
	}}{\end{list}}

% ---------- 脚注样式 ----------
% 使用footmisc宏包和pifont宏包设置符合 GB/T 7713.1-2006 规范的脚注样式。注意，由
% 于pifont宏包提供的特殊符号的限制，一页之中最多只能有10个脚注。
% 这些命令设置跟脚注设置方法思路全都引用自南京大学计算机科学与技术系胡海星编写的
% 《NJU-Thesis:南京大学学位论文XeLaTeX模板》v1.1.18 (2015/7/16)版本。
\DefineFNsymbols*{circlednumber}[text]{%
	{\ding{192}} %
	{\ding{193}} %
	{\ding{194}} %
	{\ding{195}} %
	{\ding{196}} %
	{\ding{197}} %
	{\ding{198}} %
	{\ding{199}} %
	{\ding{200}} %
	{\ding{201}}}
\setfnsymbol{circlednumber}
% 脚注部分需要修改，段落部分单倍行距。
