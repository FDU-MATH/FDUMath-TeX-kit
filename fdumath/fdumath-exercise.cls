%%
%% This is file `fdumath-exercise.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% fdumath.dtx  (with options: `class,article,exercise')
%% 
%%     Copyright (C) 2022--2023
%%     School of Mathematical Sciences, Fudan University,
%%     Shanghai Center for Mathematical Sciences, Fudan University,
%%     and any individual authors listed in the documentation.
%% ---------------------------------------------------------------------
%% 
%%     This work may be distributed and/or modified under the
%%     conditions of the LaTeX Project Public License, either
%%     version 1.3c of this license or (at your option) any later
%%     version. This version of this license is in
%%        http://www.latex-project.org/lppl/lppl-1-3c.txt
%%     and the latest version of this license is in
%%        http://www.latex-project.org/lppl.txt
%%     and version 1.3 or later is part of all distributions of
%%     LaTeX version 2005/12/01 or later.
%% 
%%     This work has the LPPL maintenance status "maintained".
%% 
%% ---------------------------------------------------------------------
%% 
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{expl3}
\PassOptionsToPackage{quiet}{fontspec}
\GetIdInfo$Id: fdumath.dtx 1.0 2023-01-14 12:00:00 +0800 Yiyang Wang <maixyoeng@gmail.com> $
  {One of the Class Facilities for SMS&SCMS, Fudan University}
\LoadClass[12pt, a4paper]{article}
\ProvidesExplClass{fdumath-exercise}
  {\ExplFileDate}{\ExplFileVersion}{\ExplFileDescription}
\msg_new:nnnn { fdumath } { l3-too-old }
  { Supporting~ package~ `#1'~ too~ old. }
  {
    Please~ update~ an~ up-to-date~ version~ of~ the~ bundles \\
    "l3kernel"~ and~ "l3packages".~ Using~ your~ TeX~ package \\
    manager~ or~ from~ CTAN.
  }
\@ifpackagelater { expl3 } { 2021/02/10 } { }
  { \msg_error:nnn { fdumath } { l3-too-old } { expl3 } }
\RequirePackage { fix-cm }
\tl_gset_rescan:Nnx \c__fdm_engine_tl {}
  { \cs_if_exist:NTF \ngostype { aptex } { \c_sys_engine_str } }
\clist_const:Nn \c__fdm_supported_engine_clist {xetex, luatex}
\msg_new:nnn { fdumath } { engine-not-supported }
  {
    FDUMATH~ Requires~ XeTeX~ or~ LuaTeX. \\\\
    "#1"~ Not~ Supported~ For~ Now. \\
    Change~ to~ "XeLaTeX"~ or~ "LuaLaTeX".
  }
\clist_if_in:NVF \c__fdm_supported_engine_clist \c__fdm_engine_tl
  { \msg_fatal:nnx { fdumath } { engine-not-supported } {\c__fdm_engine_tl} }
%% 
%%     This package consists of the files fdumath.dtx,
%%                  and the derived files fdumath.ins,
%%                                        fdumath-article.cls,
%%                                        fdumath-exercise.cls,
%%                                        fdumath-assignment.cls,
%%                                        fdumath-exam.cls,
%%                                        fdumath-thesis.cls,
%%                                        fdumath-book.cls,
%%                                        fdumath-report.cls,
%%                                        fdumath-beamer.cls, and
%%                                        README.md.
%%
%% End of file `fdumath-exercise.cls'.
