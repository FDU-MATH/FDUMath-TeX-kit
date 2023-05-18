%%
%% This is file `fdmthesis2023.tex'
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
\NeedsTeXFormat{LaTeX2e}[2020/10/01]
\GetIdInfo $Id: fdmthesis2023.cls 1.1 2023-04-11 12:00:00 +0800 Yiyang Wang <wang_yi_yang@foxmail.com> $
  {Class Infrastructure for SMS&SCMS, Fudan University}
\ProvidesExplClass{fdmthesis2023}
  {\ExplFileDate}{\ExplFileVersion}{\ExplFileDescription}
\RequirePackage { xtemplate, l3keys2e }
\msg_new:nnn { fduthesis } { l3-too-old }
  {
    Package~ "#1"~ is~ too~ old. \\\\
    Please~ update~ an~ up-to-date~ version~ of~ the~ bundles \\
    "l3kernel"~ and~ "l3packages"~ using~ your~ TeX~ package \\
    manager~ or~ from~ CTAN.
  }
\clist_map_inline:nn { xtemplate, l3keys2e }
  {
    \@ifpackagelater {#1} { 2020/07/17 }
      { } { \msg_error:nnn { fduthesis } { l3-too-old } {#1} }
  }
\msg_new:nnn { fduthesis } { unsupported-engine }
  {
    The~ fduthesis~ class~ requires~ either~ XeTeX~ or~ LuaTeX. \\\\
    "#1"~ is~ not~ supported~ at~ present.~ You~ must~ change \\
    your~ typesetting~ engine~ to~ "xelatex"~ or~ "lualatex".
  }
\sys_if_engine_xetex:F
  {
    \sys_if_engine_luatex:F
      {
        \msg_fatal:nnx { fduthesis } { unsupported-engine }
          { \c_sys_engine_str }
      }
  }
\box_new:N   \l__fdu_tmpa_box
\clist_new:N \l__fdu_tmpa_clist
\clist_new:N \l__fdu_tmpb_clist
\dim_new:N   \l__fdu_tmpa_dim
\dim_new:N   \l__fdu_tmpb_dim
\skip_new:N  \l__fdu_tmpa_skip
\tl_new:N    \l__fdu_tmpa_tl
\tl_new:N    \l__fdu_tmpb_tl
\int_new:N \g__fdu_thesis_type_int
\clist_new:N \g__fdu_to_ctexbook_clist
\clist_new:N \g__fdu_to_hyperref_clist
\bool_new:N \g__fdu_twoside_bool
\bool_set_true:N \g__fdu_twoside_bool
\bool_new:N \g__fdu_draft_bool
\tl_new:N \g__fdu_config_tl
\cs_generate_variant:Nn \file_input:n     { V  }
\cs_generate_variant:Nn \int_to_arabic:n  { v  }
\cs_generate_variant:Nn \keys_define:nn   { nx }
\cs_generate_variant:Nn \tl_map_inline:nn { xn }
\prg_generate_conditional_variant:Nnn \tl_if_eq:nn { Vn } { T, TF }
\cs_new:Npn \__fdu_quad:  { \skip_horizontal:n { 1 em } }
\cs_new:Npn \__fdu_qquad: { \skip_horizontal:n { 2 em } }
\cs_new_protected:Npn \__fdu_vspace:N #1
  {
    \dim_set_eq:NN \l__fdu_tmpa_dim \prevdepth
    \hrule height \c_zero_dim
    \nobreak
    \skip_vertical:N #1
    \skip_vertical:N \c_zero_skip
    \dim_set_eq:NN \prevdepth \l__fdu_tmpa_dim
  }
\cs_new_protected:Npn \__fdu_vspace:n #1
  {
    \skip_set:Nn \l__fdu_tmpa_skip {#1}
    \__fdu_vspace:N \l__fdu_tmpa_skip
  }
\cs_generate_variant:Nn \__fdu_vspace:N { c }
\cs_new:Npn \__fdu_symbol:n #1 { \tex_char:D #1 \scan_stop: }
\cs_new:Npn \__fdu_arabic:n #1
  { \int_to_arabic:v { c@ #1 } }
\cs_new_protected:Npn \__fdu_gadd_ltxhook:nn #1#2
  { \hook_gput_code:nnn {#1} { . } {#2} }
\hook_gset_rule:nnnn { begindocument/before } { . } { < } { xeCJK }
\cs_new_protected:Npn \__fdu_patch_cmd:Nnn #1#2#3
  {
    \ctex_patch_cmd_once:NnnnTF #1 { } {#2} {#3}
      { } { \ctex_patch_failure:N #1 }
  }
\cs_new_protected:Npn \__fdu_appto_cmd:Nn #1#2
  {
    \ctex_appto_cmd:NnnTF #1 { } {#2}
      { } { \ctex_patch_failure:N #1 }
  }
\cs_new_protected:Npn \__fdu_define_fn_style:nn #1#2
  { \tl_const:cn { c__fdu_fn_style_ #1 _tl } {#2} }
\cs_new_protected:Npn \__fdu_define_punct:nn #1#2
  { \tl_const:cn { c__fdu_ #1 _tl } {#2} }
\cs_new_protected:Npn \__fdu_define_name:nn #1#2
  { \tl_const:cn { c__fdu_name_ #1 _tl } {#2} }
\cs_new_protected:Npn \__fdu_define_name:nnn #1#2#3
  {
    \tl_const:cn { c__fdu_name_ #1    _tl } {#2}
    \tl_const:cn { c__fdu_name_ #1 _en_tl } {#3}
  }
\cs_new:Npn \__fdu_msg_new:nn  { \msg_new:nnn      { fduthesis } }
\cs_new:Npn \__fdu_error:n     { \msg_error:nn     { fduthesis } }
\cs_new:Npn \__fdu_error:nn    { \msg_error:nnn    { fduthesis } }
\cs_new:Npn \__fdu_error:nx    { \msg_error:nnx    { fduthesis } }
\cs_new:Npn \__fdu_error:nnn   { \msg_error:nnnn   { fduthesis } }
\cs_new:Npn \__fdu_error:nnnn  { \msg_error:nnnnn  { fduthesis } }
\cs_new:Npn \__fdu_warning:n   { \msg_warning:nn   { fduthesis } }
\cs_new:Npn \__fdu_warning:nn  { \msg_warning:nnn  { fduthesis } }
\cs_new:Npn \__fdu_warning:nxx { \msg_warning:nnxx { fduthesis } }
\cs_new:Npn \__fdu_info:nx     { \msg_info:nnx     { fduthesis } }
\keys_define:nn { fdu / option }
  {
    type .choice:,
    type .value_required:n = true,
    type .choices:nn =
      { doctor, master, bachelor }
      { \int_set_eq:NN \g__fdu_thesis_type_int \l_keys_choice_int },
    type .initial:n = bachelor,
    oneside .value_forbidden:n = true,
    twoside .value_forbidden:n = true,
    oneside .code:n =
      {
        \clist_gput_right:Nn \g__fdu_to_ctexbook_clist { oneside }
        \bool_set_false:N    \g__fdu_twoside_bool
      },
    twoside .code:n =
      {
        \clist_gput_right:Nn \g__fdu_to_ctexbook_clist { twoside }
        \bool_set_true:N     \g__fdu_twoside_bool
      },
    draft .choice:,
    draft / true  .code:n =
      {
        \bool_set_true:N     \g__fdu_draft_bool
        \clist_gput_right:Nn \g__fdu_to_ctexbook_clist { draft }
      },
    draft / false .code:n =
      { \bool_set_false:N    \g__fdu_draft_bool },
    draft .default:n = true,
    draft .initial:n = false,
    config .tl_set:N = \g__fdu_config_tl,
    unknown .code:n = { \__fdu_error:n { unknown-option } }
  }
\__fdu_msg_new:nn { unknown-option }
  { Class~ option~ "\l_keys_key_str"~ is~ unknown. }
\ProcessKeysOptions { fdu / option }
\file_input:n { fduthesis.def }
\__fdu_msg_new:nn { load-config-file }
  { You~ are~ loading~ config~ file~ "#1". }
\tl_if_empty:NF \g__fdu_config_tl
  {
    \__fdu_info:nx { load-config-file } { \g__fdu_config_tl }
    \file_input:V \g__fdu_config_tl
  }
\PassOptionsToClass
  {
    UTF8,
    heading    = true,
    fontset    = none,
    zihao      = -4,
    linespread = \c__fdu_line_spread_fp,
    \g__fdu_to_ctexbook_clist
  }
  { ctexbook }
\clist_map_inline:nn
  {
    % { no-math           } { fontspec },
    { perpage           } { footmisc },
    % { amsmath, thmmarks } { ntheorem }
  }
  { \PassOptionsToPackage #1 }
\LoadClass { ctexbook }
\RequirePackage
  {
    amsmath,
    % unicode-math,
    geometry,
    fancyhdr,
    footmisc,
    % ntheorem,
    graphicx,
    longtable,
    caption,
    xcolor,
  }
\cs_new_protected:Npn \__fdu_check_package:nnn #1#2#3
  {
    \@ifpackagelater {#1} {#2}
      { } { \__fdu_error:nnnn { package-too-old } { Package } {#1} {#3} }
  }
\cs_new_protected:Npn \__fdu_check_class:nnn #1#2#3
  {
    \@ifclasslater {#1} {#2}
      { } { \__fdu_error:nnnn { package-too-old } { Class } {#1} {#3} }
  }
\__fdu_msg_new:nn { package-too-old }
  {
    #1~ "#2"~ is~ too~ old. \\
    The~ fduthesis~ class~ only~ supports~ "#2" \\
    with~ a~ version~ higher~ than~ v#3. \\\\
    Please~ update~ an~ up-to-date~ version~ of~ it \\
    using~ your~ TeX~ package~ manager~ or~ from~ CTAN.
  }
\__fdu_check_class:nnn { ctexbook } { 2021/03/14 } { 2.5.6 }
\sys_if_engine_xetex:T
  { \__fdu_check_package:nnn { xeCJK } { 2020/05/01 } { 3.8.3 } }
\geometry
  {
    paper      = a4paper,
    vmargin    = 2.54 cm,
    hmargin    = 3.18 cm,
    headheight = 15 pt
  }
\bool_if:NT \g__fdu_draft_bool { \geometry { showframe } }
\tl_new:N \g__fdu_fontset_tl
\tl_new:N \g__fdu_cjk_fontset_tl
\keys_define:nn { fdu / style }
  {
    font .choices:nn =
      { garamond, libertinus, lm, palatino, times, times*, none }
      { \tl_set_eq:NN \g__fdu_fontset_tl \l_keys_choice_tl }
  }
\keys_define:nn { fdu / style }
  {
    cjk-font .choices:nn =
      { adobe, fandol, founder, mac, sinotype, sourcehan, windows, none }
      { \tl_set_eq:NN \g__fdu_cjk_fontset_tl \l_keys_choice_tl }
  }
\cs_new_protected:Npn \__fdu_setmainfont:nn #1#2
  { \__fontspec_main_setmainfont:nn {#2} {#1} }
\cs_new_protected:Npn \__fdu_setsansfont:nn #1#2
  { \__fontspec_main_setsansfont:nn {#2} {#1} }
\cs_new_protected:Npn \__fdu_setmonofont:nn #1#2
  { \__fontspec_main_setmonofont:nn {#2} {#1} }
% \cs_new_protected:Npn \__fdu_setmathfont:nn #1#2
%   { \__um_setmathfont:nn {#2} {#1} }
\cs_new_protected:Npn \__fdu_setCJKmainfont:nn #1#2
  { \__fdu_set_family:xnn { \CJKrmdefault } {#2} {#1} }
\cs_new_protected:Npn \__fdu_setCJKsansfont:nn #1#2
  { \__fdu_set_family:xnn { \CJKsfdefault } {#2} {#1} }
\cs_new_protected:Npn \__fdu_setCJKmonofont:nn #1#2
  { \__fdu_set_family:xnn { \CJKttdefault } {#2} {#1} }
\cs_new_protected:Npn \__fdu_set_cjk_font_kai:nn #1#2
  { \__fdu_set_family:nnn { fdu@kai } {#2} {#1} }
\cs_new_protected:Npn \fdu@kai
  { \__fdu_switch_family:n { fdu@kai } }
\tl_const:Nn \__fdu_cjk_font_options:
 { UprightFont = *, ItalicFont = *, AutoFakeBold = true }
\cs_new_protected:Npx \__fdu_setCJKmainfont:n   #1
  { \__fdu_setCJKmainfont:nn   {#1} { \__fdu_cjk_font_options: } }
\cs_new_protected:Npx \__fdu_setCJKsansfont:n   #1
  { \__fdu_setCJKsansfont:nn   {#1} { \__fdu_cjk_font_options: } }
\cs_new_protected:Npx \__fdu_setCJKmonofont:n   #1
  { \__fdu_setCJKmonofont:nn   {#1} { \__fdu_cjk_font_options: } }
\cs_new_protected:Npx \__fdu_set_cjk_font_kai:n #1
  { \__fdu_set_cjk_font_kai:nn {#1} { \__fdu_cjk_font_options: } }
\sys_if_engine_xetex:TF
  {
    \cs_new_eq:NN \__fdu_set_family:nnn  \xeCJK_set_family:nnn
    \cs_new_eq:NN \__fdu_switch_family:n \xeCJK_switch_family:n
  }
  {
    \cs_new_eq:NN \__fdu_set_family:nnn  \ctex_ltj_set_family:nnn
    \cs_new_eq:NN \__fdu_switch_family:n \ctex_ltj_switch_family:n
  }
\cs_generate_variant:Nn \__fdu_set_family:nnn { x }
\cs_new_protected:Npn \__fdu_set_font_helper:n #1
  {
    \exp_args:Nc \RenewDocumentCommand { set #1 font } { O { } m O { } }
      {
        \ctex_at_end_preamble:n
          { \use:c { __fdu_set #1 font:nn } {##2} { ##1, ##3 } }
      }
  }
% \clist_map_inline:nn { main, sans, mono, math    } { \__fdu_set_font_helper:n {#1} }
\clist_map_inline:nn { main, sans, mono } { \__fdu_set_font_helper:n {#1} }
%
\clist_map_inline:nn { CJKmain, CJKsans, CJKmono } { \__fdu_set_font_helper:n {#1} }
\tl_new:N \g__fdu_font_family_libertinus_serif_tl
\tl_new:N \g__fdu_font_family_libertinus_sans_tl
\tl_new:N \g__fdu_font_style_libertinus_rm_tl
\tl_new:N \g__fdu_font_style_libertinus_bf_tl
\tl_new:N \g__fdu_font_style_libertinus_it_tl
\tl_new:N \g__fdu_font_style_libertinus_bfit_tl
\tl_new:N \g__fdu_font_style_libertinus_bfsl_tl
\tl_new:N \g__fdu_font_family_xits_tl
\tl_new:N \g__fdu_font_style_xits_rm_tl
\tl_new:N \g__fdu_font_style_xits_bf_tl
\tl_new:N \g__fdu_font_style_xits_it_tl
\tl_new:N \g__fdu_font_style_xits_bfit_tl
\tl_new:N \g__fdu_font_name_libertinus_serif_tl
\tl_new:N \g__fdu_font_name_libertinus_sans_tl
\tl_new:N \g__fdu_font_name_libertinus_math_tl
\tl_new:N \g__fdu_font_name_xits_tl
\tl_new:N \g__fdu_font_name_xits_math_rm_tl
\tl_new:N \g__fdu_font_name_xits_math_bf_tl
\fontspec_font_if_exist:nTF { LibertinusSerif-Regular.otf }
  {
    \tl_set:Nn \g__fdu_font_family_libertinus_serif_tl { LibertinusSerif }
    \tl_set:Nn \g__fdu_font_family_libertinus_sans_tl  { LibertinusSans  }
    \tl_set:Nn \g__fdu_font_family_libertinus_math_tl  { LibertinusMath  }
    \tl_set:Nn \g__fdu_font_style_libertinus_rm_tl     { Regular         }
    \tl_set:Nn \g__fdu_font_style_libertinus_bf_tl     { Bold            }
    \tl_set:Nn \g__fdu_font_style_libertinus_it_tl     { Italic          }
    \tl_set:Nn \g__fdu_font_style_libertinus_bfit_tl   { BoldItalic      }
    \fontspec_font_if_exist:nTF { LibertinusSans-BoldOblique.otf }
      { \tl_set:Nn \g__fdu_font_style_libertinus_bfsl_tl { BoldOblique } }
      { \tl_set:Nn \g__fdu_font_style_libertinus_bfsl_tl { Bold        } }
  }
  {
    \tl_set:Nn \g__fdu_font_family_libertinus_serif_tl { libertinusserif }
    \tl_set:Nn \g__fdu_font_family_libertinus_sans_tl  { libertinussans  }
    \tl_set:Nn \g__fdu_font_family_libertinus_math_tl  { libertinusmath  }
    \tl_set:Nn \g__fdu_font_style_libertinus_rm_tl     { regular         }
    \tl_set:Nn \g__fdu_font_style_libertinus_bf_tl     { bold            }
    \tl_set:Nn \g__fdu_font_style_libertinus_it_tl     { italic          }
    \tl_set:Nn \g__fdu_font_style_libertinus_bfit_tl   { bolditalic      }
    \tl_set:Nn \g__fdu_font_style_libertinus_bfsl_tl   { bolditalic      }
  }
\fontspec_font_if_exist:nTF { XITS-Regular.otf }
  {
    \tl_set:Nn \g__fdu_font_family_xits_tl        { XITS             }
    \tl_set:Nn \g__fdu_font_style_xits_rm_tl      { Regular          }
    \tl_set:Nn \g__fdu_font_style_xits_bf_tl      { Bold             }
    \tl_set:Nn \g__fdu_font_style_xits_it_tl      { Italic           }
    \tl_set:Nn \g__fdu_font_style_xits_bfit_tl    { BoldItalic       }
    \tl_set:Nn \g__fdu_font_name_xits_math_rm_tl  { XITSMath-Regular }
    \tl_set:Nn \g__fdu_font_name_xits_math_bf_tl  { XITSMath-Bold    }
  }
  {
    \tl_set:Nn \g__fdu_font_family_xits_tl        { xits          }
    \tl_set:Nn \g__fdu_font_style_xits_rm_tl      { regular       }
    \tl_set:Nn \g__fdu_font_style_xits_bf_tl      { bold          }
    \tl_set:Nn \g__fdu_font_style_xits_it_tl      { italic        }
    \tl_set:Nn \g__fdu_font_style_xits_bfit_tl    { bolditalic    }
    \tl_set:Nn \g__fdu_font_name_xits_math_rm_tl  { xits-math     }
    \tl_set:Nn \g__fdu_font_name_xits_math_bf_tl  { xits-mathbold }
  }
\tl_set:Nx \g__fdu_font_name_libertinus_serif_tl
  { \g__fdu_font_family_libertinus_serif_tl - \g__fdu_font_style_libertinus_rm_tl }
\tl_set:Nx \g__fdu_font_name_libertinus_sans_tl
  { \g__fdu_font_family_libertinus_sans_tl  - \g__fdu_font_style_libertinus_rm_tl }
\tl_set:Nx \g__fdu_font_name_libertinus_math_tl
  { \g__fdu_font_family_libertinus_math_tl  - \g__fdu_font_style_libertinus_rm_tl }
\tl_set:Nx \g__fdu_font_name_xits_tl
  { \g__fdu_font_family_xits_tl - \g__fdu_font_style_xits_rm_tl }
\cs_new_protected:Npn \__fdu_load_font_garamond:
  {
    \__fdu_setmainfont:nn { EBGaramond }
      {
        Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Italic,
        BoldItalicFont = *-BoldItalic
      }
    \__fdu_setsansfont:nn { \g__fdu_font_family_libertinus_sans_tl }
      {
        Extension      = .otf,
        UprightFont    = *-\g__fdu_font_style_libertinus_rm_tl,
        BoldFont       = *-\g__fdu_font_style_libertinus_bf_tl,
        ItalicFont     = *-\g__fdu_font_style_libertinus_it_tl,
        BoldItalicFont = *-\g__fdu_font_style_libertinus_bfsl_tl
      }
    \__fdu_setmonofont:nn { lmmonolt10 }
      {
        Extension      = .otf,
        UprightFont    = *-regular,
        BoldFont       = *-bold,
        ItalicFont     = *-oblique,
        BoldItalicFont = *-boldoblique
      }
    % \__fdu_setmathfont:nn { Garamond-Math.otf } { }
  }
\cs_new_protected:Npn \__fdu_load_font_libertinus:
  {
    \__fdu_setmainfont:nn { \g__fdu_font_family_libertinus_serif_tl }
      {
        Extension      = .otf,
        UprightFont    = *-\g__fdu_font_style_libertinus_rm_tl,
        BoldFont       = *-\g__fdu_font_style_libertinus_bf_tl,
        ItalicFont     = *-\g__fdu_font_style_libertinus_it_tl,
        BoldItalicFont = *-\g__fdu_font_style_libertinus_bfit_tl
      }
    \__fdu_setsansfont:nn { \g__fdu_font_family_libertinus_sans_tl }
      {
        Extension      = .otf,
        UprightFont    = *-\g__fdu_font_style_libertinus_rm_tl,
        BoldFont       = *-\g__fdu_font_style_libertinus_bf_tl,
        ItalicFont     = *-\g__fdu_font_style_libertinus_it_tl,
        BoldItalicFont = *-\g__fdu_font_style_libertinus_bfsl_tl
      }
    \__fdu_setmonofont:nn { lmmonolt10 }
      {
        Extension      = .otf,
        UprightFont    = *-regular,
        BoldFont       = *-bold,
        ItalicFont     = *-oblique,
        BoldItalicFont = *-boldoblique
      }
    % \__fdu_setmathfont:nn { \g__fdu_font_name_libertinus_math_tl .otf } { }
  }
% \cs_new_protected:Npn \__fdu_load_font_lm:
%   { \__fdu_setmathfont:nn { latinmodern-math.otf } { } }
\cs_new_protected:Npn \__fdu_load_font_palatino:
  {
    \__fdu_setmainfont:nn { texgyrepagella }
      {
        Extension      = .otf,
        UprightFont    = *-regular,
        BoldFont       = *-bold,
        ItalicFont     = *-italic,
        BoldItalicFont = *-bolditalic
      }
    \__fdu_setsansfont:nn { \g__fdu_font_family_libertinus_sans_tl }
      {
        Extension      = .otf,
        UprightFont    = *-\g__fdu_font_style_libertinus_rm_tl,
        BoldFont       = *-\g__fdu_font_style_libertinus_bf_tl,
        ItalicFont     = *-\g__fdu_font_style_libertinus_it_tl,
        BoldItalicFont = *-\g__fdu_font_style_libertinus_bfsl_tl,
        Scale          = MatchUppercase
      }
    \__fdu_setmonofont:nn { lmmonolt10 }
      {
        Extension      = .otf,
        UprightFont    = *-regular,
        BoldFont       = *-bold,
        ItalicFont     = *-oblique,
        BoldItalicFont = *-boldoblique
      }
    % \__fdu_setmathfont:nn { texgyrepagella-math.otf } { }
  }
\cs_new_protected:Npn \__fdu_load_font_times:
  {
    \__fdu_setmainfont:nn { \g__fdu_font_family_xits_tl }
      {
        Extension          = .otf,
        UprightFont        = *-\g__fdu_font_style_xits_rm_tl,
        BoldFont           = *-\g__fdu_font_style_xits_bf_tl,
        ItalicFont         = *-\g__fdu_font_style_xits_it_tl,
        BoldItalicFont     = *-\g__fdu_font_style_xits_bfit_tl
      }
    \__fdu_setsansfont:nn { texgyreheros }
      {
        Extension      = .otf,
        UprightFont    = *-regular,
        BoldFont       = *-bold,
        ItalicFont     = *-italic,
        BoldItalicFont = *-bolditalic
      }
    \__fdu_setmonofont:nn { texgyrecursor }
      {
        Extension      = .otf,
        UprightFont    = *-regular,
        BoldFont       = *-bold,
        ItalicFont     = *-italic,
        BoldItalicFont = *-bolditalic,
        Ligatures      = CommonOff
      }
    % \__fdu_setmathfont:nn { \g__fdu_font_name_xits_math_rm_tl .otf }
    %   { BoldFont = \g__fdu_font_name_xits_math_bf_tl .otf }
  }
\cs_new_protected:cpn { __fdu_load_font_ times* : }
  {
    \__fdu_setmainfont:nn { Times~ New~ Roman    } { }
    \__fdu_setsansfont:nn { Arial                } { }
    \__fdu_setmonofont:nn { Courier~ New         } { }
    % \__fdu_setmathfont:nn { \g__fdu_font_name_xits_math_rm_tl .otf }
    %   { BoldFont = \g__fdu_font_name_xits_math_bf_tl .otf }
  }
\cs_new_protected:Npn \__fdu_load_cjk_font_adobe:
  {
    \__fdu_setCJKmainfont:n   { AdobeSongStd-Light       }
    \__fdu_setCJKsansfont:n   { AdobeHeitiStd-Regular    }
    \__fdu_setCJKmonofont:n   { AdobeFangsongStd-Regular }
    \__fdu_set_cjk_font_kai:n { AdobeKaitiStd-Regular    }
  }
\cs_new_protected:Npn \__fdu_load_cjk_font_fandol:
  {
    \__fdu_setCJKmainfont:nn   { FandolSong }
      {
        Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Bold
      }
    \__fdu_setCJKsansfont:nn   { FandolHei  }
      {
        Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Bold
      }
    \__fdu_setCJKmonofont:nn   { FandolFang }
      {
        Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Regular,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Regular
      }
    \__fdu_set_cjk_font_kai:nn { FandolKai  }
      {
        Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Regular,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Regular
      }
  }
\cs_new_protected:Npn \__fdu_load_cjk_font_founder:
  {
    \__fdu_setCJKmainfont:n   { FZShuSong-Z01  }
    \__fdu_setCJKsansfont:n   { FZHei-B01      }
    \__fdu_setCJKmonofont:n   { FZFangSong-Z02 }
    \__fdu_set_cjk_font_kai:n { FZKai-Z03      }
  }
\cs_new_protected:Npn \__fdu_load_cjk_font_mac:
  {
    \__fdu_setCJKmainfont:nn   { STSongti-SC }
      {
        UprightFont    = *-Light,
        BoldFont       = *-Bold,
        ItalicFont     = *-Light,
        BoldItalicFont = *-Bold
      }
    \__fdu_setCJKsansfont:nn   { STHeitiSC   }
      {
        UprightFont    = *-Medium,
        BoldFont       = *-Medium,
        ItalicFont     = *-Medium,
        BoldItalicFont = *-Medium
      }
    \__fdu_setCJKmonofont:n    { STFangsong  }
    \__fdu_set_cjk_font_kai:nn { STKaitiSC   }
      {
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Bold
      }
  }
\cs_new_protected:Npn \__fdu_load_cjk_font_sinotype:
  {
    \__fdu_setCJKmainfont:n   { STSong     }
    \__fdu_setCJKsansfont:n   { STHeiti    }
    \__fdu_setCJKmonofont:n   { STFangsong }
    \__fdu_set_cjk_font_kai:n { STKaiti    }
  }
\cs_new_protected:Npn \__fdu_load_cjk_font_sourcehan:
  {
    \__fdu_setCJKmainfont:nn { SourceHanSerifSC }
      {
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Bold
      }
    \__fdu_setCJKsansfont:nn { SourceHanSansSC  }
      {
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Bold
      }
    \__fdu_warning:n { source-han }
  }
\__fdu_msg_new:nn { source-han }
  { Font~ set~ "sourcehan"~ does~ not~ contain~ kaiti~ and~ fangsong. }
\cs_new_protected:Npn \__fdu_load_cjk_font_windows:
  {
    \__fdu_setCJKmainfont:n   { SimSun   }
    \__fdu_setCJKsansfont:n   { SimHei   }
    \__fdu_setCJKmonofont:n   { FangSong }
    \__fdu_set_cjk_font_kai:n { KaiTi    }
  }
\cs_new_protected:Npn \__fdu_load_font:
  {
    \use:c { __fdu_load_font_     \g__fdu_fontset_tl     : }
    \use:c { __fdu_load_cjk_font_ \g__fdu_cjk_fontset_tl : }
  }
\ctex_at_end_preamble:n { \__fdu_load_font: }
% \keys_set:nn { unicode-math }
%   {
%     math-style = ISO,
%     bold-style = ISO,
%   }
\keys_define:nn { fdu / style }
  {
    font-size .choice:,
    font-size .value_required:n = true,
    font-size / -4 .code:n = { },
    font-size /  5 .code:n =
      {
        \RenewDocumentCommand \tiny         { } { \zihao {  7 } }
        \RenewDocumentCommand \scriptsize   { } { \zihao { -6 } }
        \RenewDocumentCommand \footnotesize { } { \zihao {  6 } }
        \RenewDocumentCommand \small        { } { \zihao { -5 } }
        \RenewDocumentCommand \normalsize   { } { \zihao {  5 } }
        \RenewDocumentCommand \large        { } { \zihao { -4 } }
        \RenewDocumentCommand \Large        { } { \zihao { -3 } }
        \RenewDocumentCommand \LARGE        { } { \zihao { -2 } }
        \RenewDocumentCommand \huge         { } { \zihao {  2 } }
        \RenewDocumentCommand \Huge         { } { \zihao {  1 } }
      },
    fullwidth-stop .choice:,
    fullwidth-stop .value_required:n = true,
    fullwidth-stop / catcode .code:n =
      { \__fdu_set_fullwidth_stop_catcode: },
    fullwidth-stop / mapping .code:n =
      {
        \sys_if_engine_xetex:TF
          {
            \clist_gset:Nn \g__xeCJK_default_features_clist
              { Mapping = fullwidth-stop }
          }
          {
            \sys_if_engine_luatex:T
              {
                \__fdu_warning:n { mapping-not-available }
                \__fdu_set_fullwidth_stop_catcode:
              }
          }
      },
    fullwidth-stop / false .code:n = { }
  }
\__fdu_msg_new:nn { mapping-not-available }
  {
    Option~ "fullwidth-stop = mapping"~ is~ not~ available~ in~ LuaTeX. \\
    "fullwidth-stop = catcode"~ will~ be~ set~ instead.
  }
\cs_new:Npn \__fdu_set_fullwidth_stop_catcode:
  {
    \char_set_active_eq:NN ^^^^3002 \c__fdu_fwid_full_stop_tl
    \char_set_catcode_active:N ^^^^3002
    \clist_map_inline:nn
      { \c__fdu_orig_decl_text_tl, \c__fdu_auth_decl_text_tl }
      { \tl_set_rescan:Nno ##1 { } {##1} }
  }
\DeclareEmphSequence
  {
    \itshape \fdu@kai,
    % \upshape \CJKfamily { \CJKfamilydefault },
  }
\fancyhf { }
\cs_new_protected:Npn \__fdu_fancy_head:nn #1#2
  {
    \fancyhead [#1]
      { \small \fdu@kai \nouppercase {#2} }
  }
\bool_if:NTF \g__fdu_twoside_bool
  {
    \__fdu_fancy_head:nn { EL } { \leftmark  }
    \__fdu_fancy_head:nn { OR } { \rightmark }
  }
  {
    \__fdu_fancy_head:nn { L  } { \leftmark  }
    \__fdu_fancy_head:nn { R  } { \rightmark }
  }
\fancyfoot [ C ] { \small \thepage }
\RenewDocumentCommand \cleardoublepage { }
  {
    \clearpage
    \bool_if:NT \g__fdu_twoside_bool
      {
        \int_if_odd:nF \c@page
          { \hbox:n { } \thispagestyle { empty } \newpage }
      }
  }
\pagestyle { fancy }
\keys_set:nn { ctex }
  {
    chapter =
      {
        format      = \huge \normalfont \sffamily \centering,
        beforeskip  = 50 pt,
        afterskip   = 40 pt,
        number      = \__fdu_arabic:n { chapter },
        fixskip     = true
      },
    section =
      {
        format      = \Large \normalfont \sffamily \raggedright,
        beforeskip  = 3.5 ex plus 1.0 ex minus 0.2 ex,
        afterskip   = 2.7 ex plus 0.5 ex,
        fixskip     = true
      },
    subsection =
      {
        format      = \large \normalfont \sffamily \raggedright,
        beforeskip  = 3.25 ex plus 1.0 ex minus 0.2 ex,
        afterskip   = 2.5  ex plus 0.3 ex,
        fixskip     = true
      }
  }
\cs_new_protected:Npn \__fdu_chapter:n #1
  {
    \group_begin:
      \ctexset { chapter / numbering = false }
      \chapter {#1}
      \__fdu_chapter_header:n {#1}
    \group_end:
  }
\cs_generate_variant:Nn \__fdu_chapter:n { V }
\cs_new_protected:Npn \__fdu_chapter_no_toc:n #1
  {
    \chapter *           {#1}
    \__fdu_chapter_header:n {#1}
    \pdfbookmark [0] {#1} { toc }
  }
\cs_generate_variant:Nn \__fdu_chapter_no_toc:n { V }
\cs_new_protected:Npn \__fdu_chapter_header:n #1
  {
    \bool_if:NTF \g__fdu_twoside_bool
      { \markboth {#1} {#1} }
      { \markboth { \hfill #1 \hfill } { } }
  }
\clist_map_inline:nn
  {
    { plain           } { plain           },
    { libertinus      } { libertinus      },
    { libertinus_neg  } { libertinus*     },
    { libertinus_sans } { libertinus-sans },
    { pifont          } { pifont          },
    { pifont_neg      } { pifont*         },
    { pifont_sans     } { pifont-sans     },
    { pifont_sans_neg } { pifont-sans*    },
    { xits            } { xits            },
    { xits_sans       } { xits-sans       },
    { xits_sans_neg   } { xits-sans*      }
  }
  { \__fdu_define_fn_style:nn #1 }
\tl_new:N \l__fdu_fn_style_tl
\keys_define:nn { fdu / style }
  {
    footnote-style .choices:nn =
      {
        plain,
        libertinus, libertinus*, libertinus-sans,
        pifont,     pifont*,     pifont-sans,     pifont-sans*,
        xits,                    xits-sans,       xits-sans*
      }
      {
        \tl_gset_eq:NN \l__fdu_fn_style_tl \l_keys_choice_tl
        \int_compare:nT { 5 <= \l_keys_choice_int <= 8 }
          { \RequirePackage { pifont } }
      },
    footnote-style .value_required:n = true
  }
\cs_new:Npn \__fdu_fn_symbol_libertinus:n #1
  {
    \int_compare:nTF { #1 >= 21 }
      {
        \int_compare:nTF { #1 >= 47 }
          { \__fdu_symbol:n { \int_eval:n { "24B6 - 47 + #1 } } }
          { \__fdu_symbol:n { \int_eval:n { "24D0 - 21 + #1 } } }
      }
      { \__fdu_symbol:n { \int_eval:n { "2460 - 1 + #1 } } }
  }
\cs_new:Npn \__fdu_fn_symbol_libertinus_neg:n #1
  {
    \int_compare:nTF { #1 >= 11 }
      { \__fdu_symbol:n { \int_eval:n { "24EB - 11 + #1 } } }
      { \__fdu_symbol:n { \int_eval:n { "2776 -  1 + #1 } } }
  }
\cs_new_eq:NN \__fdu_fn_symbol_libertinus_sans:n \__fdu_fn_symbol_libertinus:n
\cs_new:Npn \__fdu_fn_symbol_pifont:n #1
  { \ding { \int_eval:n { 171 + #1 } } }
\cs_new:Npn \__fdu_fn_symbol_pifont_neg:n #1
  { \ding { \int_eval:n { 181 + #1 } } }
\cs_new:Npn \__fdu_fn_symbol_pifont_sans:n #1
  { \ding { \int_eval:n { 191 + #1 } } }
\cs_new:Npn \__fdu_fn_symbol_pifont_sans_neg:n #1
  { \ding { \int_eval:n { 201 + #1 } } }
\cs_new:Npn \__fdu_fn_symbol_xits:n #1
  {
    \int_compare:nTF { #1 >= 10 }
      {
        \int_compare:nTF { #1 >= 36 }
          { \__fdu_symbol:n { \int_eval:n { "24B6 - 36 + #1 } } }
          { \__fdu_symbol:n { \int_eval:n { "24D0 - 10 + #1 } } }
      }
      { \__fdu_symbol:n { \int_eval:n { "2460 - 1 + #1 } } }
  }
\cs_new:Npn \__fdu_fn_symbol_xits_sans:n #1
  { \__fdu_symbol:n { \int_eval:n { "2780 - 1 + #1 } } }
\cs_new:Npn \__fdu_fn_symbol_xits_sans_neg:n #1
  { \__fdu_symbol:n { \int_eval:n { "278A - 1 + #1 } } }
\cs_set:Npn \thefootnote { \fdu_footnote_number:N \c@footnote }
\cs_new:Npn \fdu_footnote_number:N #1
  {
    \tl_case:NnF \l__fdu_fn_style_tl
      {
        \c__fdu_fn_style_plain_tl
          { \int_use:N #1 }
        \c__fdu_fn_style_libertinus_tl
          {
            \fontspec { \g__fdu_font_name_libertinus_serif_tl .otf }
            \__fdu_fn_symbol_libertinus:n {#1}
          }
        \c__fdu_fn_style_libertinus_neg_tl
          {
            \fontspec { \g__fdu_font_name_libertinus_serif_tl .otf }
            \__fdu_fn_symbol_libertinus_neg:n {#1}
          }
        \c__fdu_fn_style_libertinus_sans_tl
          {
            \fontspec { \g__fdu_font_name_libertinus_sans_tl .otf }
            \__fdu_fn_symbol_libertinus_sans:n {#1}
          }
        \c__fdu_fn_style_pifont_tl
          { \__fdu_fn_symbol_pifont:n {#1} }
        \c__fdu_fn_style_pifont_neg_tl
          { \__fdu_fn_symbol_pifont_neg:n {#1} }
        \c__fdu_fn_style_pifont_sans_tl
          { \__fdu_fn_symbol_pifont_sans:n {#1} }
        \c__fdu_fn_style_pifont_sans_neg_tl
          { \__fdu_fn_symbol_pifont_sans_neg:n {#1} }
        \c__fdu_fn_style_xits_tl
          {
            \fontspec { \g__fdu_font_name_xits_tl .otf }
            \__fdu_fn_symbol_xits:n {#1}
          }
        \c__fdu_fn_style_xits_sans_tl
          {
            \fontspec { \g__fdu_font_name_xits_tl .otf }
            \__fdu_fn_symbol_xits_sans:n {#1}
          }
        \c__fdu_fn_style_xits_sans_neg_tl
          {
            \fontspec { \g__fdu_font_name_xits_tl .otf }
            \__fdu_fn_symbol_xits_sans_neg:n {#1}
          }
      }
      { \int_use:N #1 }
  }
\cs_set:Npn \@makefntext #1
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn { 1.5 em } { \@thefnmark \hfil }
    #1
  }
% \clist_const:Nn \c__fdu_thm_style_plain_clist
%   { plain, margin, change }
% \clist_const:Nn \c__fdu_thm_style_break_clist
%   { break, marginbreak, changebreak }
% \tl_new:N \l__fdu_thm_style_tl
% \tl_new:N \l__fdu_thm_header_font_tl
% \tl_new:N \l__fdu_thm_body_font_tl
% \tl_new:N \l__fdu_thm_qed_tl
% \tl_new:N \l__fdu_thm_counter_tl
% \keys_define:nn { fdu / theorem }
%   {
%     style       .tl_set:N  = \l__fdu_thm_style_tl,
%     header-font .tl_set:N  = \l__fdu_thm_header_font_tl,
%     body-font   .tl_set:N  = \l__fdu_thm_body_font_tl,
%     qed         .tl_set:N  = \l__fdu_thm_qed_tl,
%     counter     .tl_set:N  = \l__fdu_thm_counter_tl
%   }
% \cs_new_eq:NN \__fdu_thm_ntheorem_style:n \theoremstyle
% \cs_new_eq:NN \__fdu_thm_ntheorem_new:w   \newtheorem
% \RenewDocumentCommand \newtheorem { s o m m }
%   {
%     \IfBooleanTF {#1}
%       { \tl_set:Nn \l__fdu_thm_qed_tl { \ensuremath { \QED } } }
%       { \tl_set:Nn \l__fdu_thm_qed_tl { } }
%     \tl_set:Nn \l__fdu_thm_style_tl { plain }
%     \IfValueT {#2} { \keys_set:nn { fdu / theorem } {#2} }
%     \fdu_thm_set_header_font:V \l__fdu_thm_header_font_tl
%     \fdu_thm_set_body_font:V   \l__fdu_thm_body_font_tl
%     \fdu_thm_set_qed:V         \l__fdu_thm_qed_tl
%     \IfBooleanTF {#1}
%       {
%         \clist_if_in:nVF { plain, break } \l__fdu_thm_style_tl
%           {
%             \clist_if_in:NVTF
%               \c__fdu_thm_style_plain_clist \l__fdu_thm_style_tl
%               { \__fdu_thm_redefine_style:n { plain } }
%               {
%                 \clist_if_in:NVTF
%                   \c__fdu_thm_style_break_clist \l__fdu_thm_style_tl
%                   { \__fdu_thm_redefine_style:n { break } }
%                   {
%                     \__fdu_error:nx { unknown-theorem-style }
%                       { \l__fdu_thm_style_tl }
%                   }
%               }
%           }
%         \tl_put_left:Nn \l__fdu_thm_style_tl { nonumber }
%         \fdu_thm_new_no_number:Vxx \l__fdu_thm_style_tl {#3} {#4}
%       }
%       {
%         \clist_clear:N \l__fdu_tmpa_clist
%         \clist_concat:NNN \l__fdu_tmpa_clist
%           \c__fdu_thm_style_plain_clist \c__fdu_thm_style_break_clist
%         \clist_if_in:NVF \l__fdu_tmpa_clist \l__fdu_thm_style_tl
%           {
%             \__fdu_error:nx { unknown-theorem-style }
%               { \l__fdu_thm_style_tl }
%           }
%         \fdu_thm_new:VVxx \l__fdu_thm_style_tl \l__fdu_thm_counter_tl
%           {#3} {#4}
%       }
%   }
% \cs_new:Npn \__fdu_thm_redefine_style:n #1
%   {
%     \__fdu_warning:nxx { redefine-theorem-style }
%       {#1} { \l__fdu_thm_style_tl }
%     \tl_set:Nn \l__fdu_thm_style_tl {#1}
%   }
% \__fdu_msg_new:nn { redefine-theorem-style }
%   { Theorem~ style~ "#2"~ will~ be~ redefined~ as~ "#1". }
% \__fdu_msg_new:nn { unknown-theorem-style }
%   { Theorem~ style~ "#1"~ is~ unknown. }
% \cs_new:Npn \fdu_thm_new:nnnn #1#2#3#4
%   {
%     \__fdu_thm_ntheorem_style:n {#1}
%     \__fdu_thm_ntheorem_new:w   {#3} {#4} [#2]
%   }
% \cs_generate_variant:Nn \fdu_thm_new:nnnn { VVxx }
% \cs_new:Npn \fdu_thm_new_no_number:nnn #1#2#3
%   {
%     \__fdu_thm_ntheorem_style:n {#1}
%     \__fdu_thm_ntheorem_new:w   {#2} {#3}
%   }
% \cs_generate_variant:Nn \fdu_thm_new_no_number:nnn { Vxx }
% \cs_new:Npn \fdu_thm_set_qed:n         #1 { \theoremsymbol     {#1} }
% \cs_new:Npn \fdu_thm_set_header_font:n #1 { \theoremheaderfont {#1} }
% \cs_new:Npn \fdu_thm_set_body_font:n   #1 { \theorembodyfont   {#1} }
% \cs_generate_variant:Nn \fdu_thm_set_qed:n         { V }
% \cs_generate_variant:Nn \fdu_thm_set_header_font:n { V }
% \cs_generate_variant:Nn \fdu_thm_set_body_font:n   { V }
\captionsetup [ figure ]
  {
    font     = small,
    labelsep = quad
  }
\captionsetup [ table  ]
  {
    font     = { small, sf },
    labelsep = quad
  }
\cs_set:Npn \thefigure
  { \thechapter - \__fdu_arabic:n { figure } }
\cs_set:Npn \thetable
  { \thechapter - \__fdu_arabic:n { table  } }
\clist_map_inline:nn
  {
    title, date, author, supervisor, department, major, student_id,
    school_id, clc, jel
  }
  { \tl_new:c { l__fdu_info_ #1 _tl } }
\clist_new:N \l__fdu_info_instructors_clist
\clist_new:N \l__fdu_info_keywords_clist
\clist_map_inline:nn
  { title, author, supervisor, department, major }
  { \tl_new:c { l__fdu_info_ #1 _en_tl } }
\clist_new:N \l__fdu_info_keywords_en_clist
\int_new:N \l__fdu_info_degree_type_int
\keys_define:nn { fdu / info }
  {
    degree      .choices:nn  =
      { academic, professional }
      { \int_set_eq:NN \l__fdu_info_degree_type_int \l_keys_choice_int },
    title       .tl_set:N    = \l__fdu_info_title_tl,
    title*      .tl_set:N    = \l__fdu_info_title_en_tl,
    date        .tl_set:N    = \l__fdu_info_date_tl,
    author      .tl_set:N    = \l__fdu_info_author_tl,
    author*     .tl_set:N    = \l__fdu_info_author_en_tl,
    supervisor  .tl_set:N    = \l__fdu_info_supervisor_tl,
    instructors .clist_set:N = \l__fdu_info_instructors_clist,
    department  .tl_set:N    = \l__fdu_info_department_tl,
    major       .tl_set:N    = \l__fdu_info_major_tl,
    student-id  .tl_set:N    = \l__fdu_info_student_id_tl,
    school-id   .tl_set:N    = \l__fdu_info_school_id_tl,
    keywords    .clist_set:N = \l__fdu_info_keywords_clist,
    keywords*   .clist_set:N = \l__fdu_info_keywords_en_clist,
    clc         .tl_set:N    = \l__fdu_info_clc_tl,
    jel         .tl_set:N    = \l__fdu_info_jel_tl
  }
\tl_new:N    \l__fdu_cover_logo_tl
\clist_new:N \l__fdu_cover_logo_size_clist
\keys_define:nn { fdu / style }
  {
    logo      .tl_set:N    = \l__fdu_cover_logo_tl,
    logo-size .clist_set:N = \l__fdu_cover_logo_size_clist
  }
\bool_new:N \l__fdu_secret_bool
\tl_new:N \l__fdu_info_secret_level_tl
\keys_define:nn { fdu / info }
  {
    secret-level .choices:nn  =
      { none, i, ii, iii }
      {
        \int_compare:nTF { \l_keys_choice_int >= 2 }
          {
            \bool_set_true:N \l__fdu_secret_bool
            \tl_set:Nn \l__fdu_info_secret_level_tl
              {
                \clist_item:Nn \c__fdu_secret_clist
                  { \l_keys_choice_int - 1 }
              }
          }
          { \bool_set_false:N \l__fdu_secret_bool }
      },
    secret-level .value_required:n = true,
    secret-year  .tl_set:N = \l__fdu_info_secret_year_tl
  }
\cs_new_protected:Npn \__fdu_spread_box:nn #1#2
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn {#1}
      { \tl_map_inline:xn {#2} { ##1 \hfil } \unskip }
  }
\cs_new_protected:Npn \__fdu_center_box:nn #1#2
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn {#1} { \hfil #2 \hfil }
  }
\cs_generate_variant:Nn \__fdu_center_box:nn  { Vn }
\cs_new:Npn \__fdu_fixed_width_box:nn #1#2
  { \parbox {#1} {#2} }
\cs_new:Npn \__fdu_fixed_width_center_box:nn #1#2
  { \parbox {#1} { \centering #2 } }
\cs_new:Npn \__fdu_get_text_width:Nn #1#2
  {
    \hbox_set:Nn \l__fdu_tmpa_box {#2}
    \dim_set:Nn #1 { \box_wd:N \l__fdu_tmpa_box }
  }
\cs_generate_variant:Nn \__fdu_get_text_width:Nn { NV }
\cs_new:Npn \__fdu_get_max_text_width:NN #1#2
  {
    \group_begin:
      \clist_set_eq:NN \l__fdu_tmpa_clist #2
      \bool_until_do:nn { \clist_if_empty_p:N \l__fdu_tmpa_clist }
        {
          \clist_pop:NN \l__fdu_tmpa_clist \l__fdu_tmpa_tl
          \__fdu_get_text_width:NV \l__fdu_tmpa_dim \l__fdu_tmpa_tl
          \dim_gset:Nn #1 { \dim_max:nn {#1} { \l__fdu_tmpa_dim } }
        }
    \group_end:
  }
\cs_new:Npn \__fdu_blank_underline:n #1
  { \rule [ -0.5 ex ] {#1} { 0.4 pt } }
\cs_new:Npn \__fdu_line_spread:N #1
  { \linespread { \fp_use:N #1 } \selectfont }
\cs_new:Npn \__fdu_line_spread:n #1
  { \linespread {#1} \selectfont }
\cs_new_protected:Npn \__fdu_cover_id:
  {
    \__fdu_fixed_width_box:nn { 120 pt }
      {
        \bool_if:NT \l__fdu_secret_bool
          {
            \group_begin:
              \sffamily
              \__fdu_cover_id_aux:n { secret_level }
              \c__fdu_name_secret_star_tl
              \l__fdu_info_secret_year_tl
            \group_end:
            \par
          }
        \__fdu_cover_id_aux:n { school_id  } \par
        \__fdu_cover_id_aux:n { student_id }
      }
    \hbox_to_wd:nn { -24 pt } { }
  }
\cs_new:Npn \__fdu_cover_id_aux:n #1
  {
    \tl_use:c { c__fdu_name_ #1 _tl }
    \c__fdu_fwid_colon_tl
    \tl_use:c { l__fdu_info_ #1 _tl }
  }
\cs_new_protected:Npn \__fdu_cover_logo:
  {
    \clist_pop:NN   \l__fdu_cover_logo_size_clist \l__fdu_tmpa_tl
    \clist_pop:NNTF \l__fdu_cover_logo_size_clist \l__fdu_tmpb_tl
      {
        \tl_if_empty:NTF \l__fdu_tmpa_tl
          { \includegraphics [ height = \l__fdu_tmpb_tl ] }
          {
            \includegraphics
              [ width  = \l__fdu_tmpa_tl, height = \l__fdu_tmpb_tl ]
          }
      }
      { \includegraphics [ width = \l__fdu_tmpa_tl ] }
    { \l__fdu_cover_logo_tl }
  }
\cs_new_protected:Npn \__fdu_cover_type:
  {
    \tl_set:Nx \l__fdu_tmpa_tl
      {
        \clist_item:Nn \c__fdu_thesis_type_clist
          { \g__fdu_thesis_type_int }
      }
    \__fdu_spread_box:nn { 0.45 \textwidth } { \l__fdu_tmpa_tl }
  }
\cs_new_protected:Npn \__fdu_cover_degree:
  {
    \int_compare:nT { \g__fdu_thesis_type_int != 3 }
      {
        \c__fdu_fwid_left_paren_tl
        \clist_item:Nn \c__fdu_degree_type_clist
          { \l__fdu_info_degree_type_int }
        \c__fdu_fwid_right_paren_tl
      }
  }
\cs_new_protected:Npn \__fdu_cover_info:
  {
    \tl_set:Nx \l__fdu_cover_info_left_width_tl
      {
        \int_case:nn { \l__fdu_info_degree_type_int }
          {
            { 1 } { 6 em }
            { 2 } { 9 em }
          }
      }
    \begin{minipage} [ c ] { \textwidth }
      \centering \zihao { 4 }
      \clist_set:Nx \l__fdu_tmpa_clist
        {
          \c__fdu_name_department_tl,
          \int_case:nn { \l__fdu_info_degree_type_int }
            {
              { 1 } { \c__fdu_name_major_tl              }
              { 2 } { \c__fdu_name_major_professional_tl }
            },
          \c__fdu_name_author_tl,
          \c__fdu_name_supervisor_tl,
          \c__fdu_name_date_tl,
        }
      \clist_set:Nx \l__fdu_tmpb_clist
        {
          { \l__fdu_info_department_tl },
          { \l__fdu_info_major_tl      },
          { \l__fdu_info_author_tl     },
          { \l__fdu_info_supervisor_tl },
          { \l__fdu_info_date_tl       }
        }
      \__fdu_get_max_text_width:NN \l__fdu_tmpb_dim \l__fdu_tmpb_clist
      \bool_until_do:nn
        { \clist_if_empty_p:N \l__fdu_tmpa_clist }
        {
          \clist_pop:NN \l__fdu_tmpa_clist \l__fdu_tmpa_tl
          \clist_pop:NN \l__fdu_tmpb_clist \l__fdu_tmpb_tl
          \__fdu_spread_box:nn
            { \l__fdu_cover_info_left_width_tl }
            { \l__fdu_tmpa_tl }
          \c__fdu_fwid_colon_tl
          \__fdu_center_box:Vn \l__fdu_tmpb_dim { \l__fdu_tmpb_tl }
          \skip_vertical:n { 1 ex }
        }
    \end{minipage}
  }
\tl_new:N \l__fdu_cover_info_left_width_tl
\cs_new_protected:Npn \__fdu_cover_signature:N #1
  {
    \clist_map_inline:Nn #1
      {
        ##1 \c__fdu_fwid_colon_tl
        \__fdu_blank_underline:n { 6 em }
        \__fdu_quad:
      }
  }
\DeclareObjectType { fdu / cover } { \c_zero_int }
\NewDocumentCommand \DeclareCoverTemplate { m m }
  { \fdu_cover_declare_template:nn {#1} {#2} }
\cs_new_protected:Npn \fdu_cover_declare_template:nn #1#2
  {
    \tl_set:Nn \l__fdu_cover_template_tl {#1}
    \__fdu_cover_declare_template_interface:nx {#1}
      {
        format      : tokenlist,
        top-skip    : skip,
        bottom-skip : skip,
        \clist_map_function:nN {#2} \__fdu_cover_key_type:n
      }
    \tl_new:c   { l__fdu_cover / #1 / format_tl   }
    \skip_new:c { l__fdu_cover / #1 / top_skip    }
    \skip_new:c { l__fdu_cover / #1 / bottom_skip }
    \clist_map_inline:nn {#2}
      {
        \tl_new:c   { l__fdu_cover / #1 / ##1 / content_tl  }
        \tl_new:c   { l__fdu_cover / #1 / ##1 / format_tl   }
        \skip_new:c { l__fdu_cover / #1 / ##1 / bottom_skip }
      }
    \__fdu_cover_declare_template_code:nxn {#1}
      {
        format      = \exp_not:c { l__fdu_cover / #1 / format_tl   },
        top-skip    = \use:c     { l__fdu_cover / #1 / top_skip    },
        bottom-skip = \use:c     { l__fdu_cover / #1 / bottom_skip },
        \clist_map_function:nN {#2} \__fdu_cover_key_binding:n
      }
      {
        \AssignTemplateKeys
        \tl_use:c       { l__fdu_cover / #1 / format_tl }
        \__fdu_vspace:c { l__fdu_cover / #1 / top_skip  }
        \clist_map_inline:nn {#2}
          {
            \use:c { __fdu_cover / #1 / ####1 / align:n }
              {
                \tl_use:c { l__fdu_cover / #1 / ####1 / format_tl  }
                \tl_use:c { l__fdu_cover / #1 / ####1 / content_tl }
                \par
              }
            \__fdu_vspace:c { l__fdu_cover / #1 / ####1 / bottom_skip }
          }
        \__fdu_vspace:c { l__fdu_cover / #1 / bottom_skip }
      }
  }
\tl_new:N \l__fdu_cover_template_tl
\cs_new_protected:Npn \__fdu_cover_declare_template_interface:nn #1#2
  { \DeclareTemplateInterface { fdu / cover } {#1} { \c_zero_int } {#2} }
\cs_new_protected:Npn \__fdu_cover_declare_template_code:nnn #1#2#3
  { \DeclareTemplateCode { fdu / cover } {#1} { \c_zero_int } {#2} {#3} }
\cs_generate_variant:Nn \__fdu_cover_declare_template_interface:nn { nx  }
\cs_generate_variant:Nn \__fdu_cover_declare_template_code:nnn     { nxn }
\cs_new:Npn \__fdu_cover_key_type:n #1
  {
    #1 / content     : tokenlist,
    #1 / format      : tokenlist,
    #1 / bottom-skip : skip,
    #1 / align       : choice { left, right, center, normal } = normal,
  }
\cs_new:Npn \__fdu_cover_key_binding:n #1
  {
    #1 / content     =
      \exp_not:c
        { l__fdu_cover / \l__fdu_cover_template_tl / #1 / content_tl  },
    #1 / format      =
      \exp_not:c
        { l__fdu_cover / \l__fdu_cover_template_tl / #1 / format_tl   },
    #1 / bottom-skip =
      \exp_not:c
        { l__fdu_cover / \l__fdu_cover_template_tl / #1 / bottom_skip },
    #1 / align       =
      {
        left   =
          \exp_not:N \cs_set_protected:cpn
            { __fdu_cover / \l__fdu_cover_template_tl / #1 / align:n }
            \exp_not:n {##1}
            {
              \exp_not:n
                {
                  \group_begin:
                    \flushleft ##1 \endflushleft
                  \group_end:
                }
            },
        right  =
          \exp_not:N \cs_set_protected:cpn
            { __fdu_cover / \l__fdu_cover_template_tl / #1 / align:n }
            \exp_not:n {##1}
            {
              \exp_not:n
                {
                  \group_begin:
                    \flushright ##1 \endflushright
                  \group_end:
                }
            },
        center =
          \exp_not:N \cs_set_protected:cpn
            { __fdu_cover / \l__fdu_cover_template_tl / #1 / align:n }
            \exp_not:n {##1}
            {
              \exp_not:n
                {
                  \group_begin:
                    \center ##1 \endcenter
                  \group_end:
                }
            },
        normal =
          \exp_not:N \cs_set_protected:cpn
            { __fdu_cover / \l__fdu_cover_template_tl / #1 / align:n }
            \exp_not:n {##1}
            { \exp_not:n { \group_begin: ##1 \group_end: } }
      },
  }
\NewDocumentCommand \makecoveri { }
  {
    \thispagestyle { empty }
    \UseInstance { fdu / cover } { cover-i-default }
  }
\NewDocumentCommand \makecoverii { }
  {
    \thispagestyle { empty }
    \clist_if_empty:NF \l__fdu_info_instructors_clist
      { \UseInstance { fdu / cover } { cover-ii-default } }
  }
\NewDocumentCommand \makecoveriii { }
  {
    \cleardoublepage
    \tl_if_empty:NTF \l__fdu_declaration_page_tl
      {
        \thispagestyle { empty }
        \UseInstance { fdu / cover } { cover-iii-default }
      }
      { \includepdf { \l__fdu_declaration_page_tl } }
  }
\DeclareCoverTemplate { cover-i   }
  { id, logo, type, degree, title, title-en, info }
\DeclareCoverTemplate { cover-ii  } { title, name-list }
\DeclareCoverTemplate { cover-iii }
  {
    originality-decl-name,
    originality-decl-text,
    originality-decl-sig,
    authorization-decl-name,
    authorization-decl-text,
    authorization-decl-sig
  }
\DeclareInstance { fdu / cover } { cover-i-default } { cover-i }
  {
    bottom-skip            = 0 pt plus 1.5 fill,
    id       / content     = \__fdu_cover_id:,
    logo     / content     = \__fdu_cover_logo:,
    type     / content     = \__fdu_cover_type:,
    degree   / content     = \__fdu_cover_degree:,
    title    / content     =
      \__fdu_fixed_width_center_box:nn
        { 0.9 \textwidth } { \l__fdu_info_title_tl },
    title-en / content     =
      \__fdu_fixed_width_center_box:nn
        { 0.9 \textwidth } { \l__fdu_info_title_en_tl },
    info     / content     = \__fdu_cover_info:,
    id       / format      = \zihao { -5 },
    type     / format      = \zihao {  2 },
    degree   / format      = \zihao {  4 },
    title    / format      = \zihao { -2 } \bfseries,
    title-en / format      = \__fdu_line_spread:n { 1.2 } \zihao { 4 } \bfseries,
    id       / bottom-skip = 0 pt plus 1.6 fill,
    logo     / bottom-skip = 0 pt plus 0.3 fill,
    type     / bottom-skip = -18 pt,
    degree   / bottom-skip = 0 pt plus 0.8 fill,
    title-en / bottom-skip = 0 pt plus 2.5 fill,
    id       / align       = right,
    logo     / align       = center,
    type     / align       = center,
    degree   / align       = center,
    title    / align       = center,
    title-en / align       = center,
    info     / align       = center,
  }
\DeclareInstance { fdu / cover } { cover-ii-default } { cover-ii }
  {
    title     / content =
      \__fdu_spread_box:nn { 7 em } { \c__fdu_name_instructors_tl },
    name-list / content =
      \clist_use:Nn \l__fdu_info_instructors_clist { \par },
    title     / format  = \zihao { 2 } \sffamily,
    name-list / format  = \large,
    title     / align   = center,
    name-list / align   = center,
  }
\DeclareInstance { fdu / cover } { cover-iii-default } { cover-iii }
  {
    format                                =
      \__fdu_line_spread:n { 1.8 },
    top-skip                              = 0 pt plus 0.2 fill,
    bottom-skip                           = 0 pt plus 2.5 fill,
    originality-decl-name   / content     = \c__fdu_name_orig_decl_tl,
    originality-decl-text   / content     = \c__fdu_orig_decl_text_tl,
    originality-decl-sig    / content     =
      \__fdu_cover_signature:N \c__fdu_orig_decl_sign_clist,
    authorization-decl-name / content     = \c__fdu_name_auth_decl_tl,
    authorization-decl-text / content     = \c__fdu_auth_decl_text_tl,
    authorization-decl-sig  / content     =
      \__fdu_cover_signature:N \c__fdu_auth_decl_sign_clist,
    originality-decl-name   / format      =
      \__fdu_line_spread:n { 1.2 } \zihao { -2 } \bfseries,
    authorization-decl-name / format      =
      \__fdu_line_spread:n { 1.2 } \zihao { -2 } \bfseries,
    originality-decl-name   / bottom-skip = 0.4 cm,
    originality-decl-text   / bottom-skip = 0.4 cm,
    originality-decl-sig    / bottom-skip = 0 pt plus 2.5 fill,
    authorization-decl-name / bottom-skip = 0.4 cm,
    authorization-decl-text / bottom-skip = 0.4 cm,
    originality-decl-name   / align       = center,
    originality-decl-sig    / align       = right,
    authorization-decl-name / align       = center,
    authorization-decl-sig  / align       = right,
  }
\bool_new:N \l__fdu_auto_make_cover_bool
\tl_new:N   \l__fdu_declaration_page_tl
\keys_define:nn { fdu / style }
  {
    auto-make-cover  .bool_set:N = \l__fdu_auto_make_cover_bool,
    auto-make-cover  .default:n  = true,
    declaration-page .code:n     =
      {
        \tl_set_eq:NN \l__fdu_declaration_page_tl \l_keys_value_tl
        \RequirePackage { pdfpages }
      },
  }
\ctex_after_end_preamble:n
  {
    \bool_if:NT \l__fdu_auto_make_cover_bool
      {
        \begin{titlepage}
          \makecoveri \newpage \makecoverii
        \end{titlepage}
      }
  }
\__fdu_gadd_ltxhook:nn { enddocument }
  { \bool_if:NT \l__fdu_auto_make_cover_bool { \makecoveriii } }
\keys_set:nn { ctex }
  {
    contentsname   = \c__fdu_name_toc_tl,
    listfigurename = \c__fdu_name_lof_tl,
    listtablename  = \c__fdu_name_lot_tl,
    chapter / tocline =
      {
        \normalfont \sffamily
        \CTEXnumberline {#1} #2
      },
    section / tocline =
      {
        \CTEXnumberline {#1} #2
      },
    subsection / tocline =
      {
        \fdu@kai
        \CTEXnumberline {#1} #2
      }
  }
\__fdu_patch_cmd:Nnn \tableofcontents
  {
    \chapter*{\contentsname
      \@mkboth{\MakeUppercase\contentsname}
              {\MakeUppercase\contentsname}}
  }
  { \__fdu_chapter_no_toc:V \contentsname }
\__fdu_patch_cmd:Nnn \listoffigures
  {
    \chapter*{\listfigurename}
    \@mkboth{\MakeUppercase\listfigurename}
            {\MakeUppercase\listfigurename}
  }
  { \__fdu_chapter:V \listfigurename }
\__fdu_patch_cmd:Nnn \listoftables
  {
    \chapter*{\listtablename}
    \@mkboth{\MakeUppercase\listtablename}
            {\MakeUppercase\listtablename}
  }
  { \__fdu_chapter:V \listtablename }
\NewDocumentEnvironment { abstract  } { }
  { \__fdu_abstract_begin:    } { \__fdu_abstract_end:      }
\NewDocumentEnvironment { abstract* } { }
  { \__fdu_abstract_en_begin: } { \__fdu_abstract_en_end:   }
\cs_new_protected:Npn \__fdu_abstract_begin:
  { \__fdu_chapter:V \c__fdu_name_abstract_tl    }
\cs_new_protected:Npn \__fdu_abstract_en_begin:
  { \__fdu_chapter:V \c__fdu_name_abstract_en_tl }
\cs_new_protected:Npn \__fdu_abstract_end:
  {
    % 2023-04-11
    \thispagestyle{empty}
    % 2023-04-11
    \__fdu_keywords:nNn
      { \sffamily \c__fdu_name_keywords_tl \c__fdu_fwid_colon_tl }
      \l__fdu_info_keywords_clist { \c__fdu_fwid_semicolon_tl }
    \tl_if_empty:NF \l__fdu_info_clc_tl
      {
        \__fdu_clc_jel:nn
          { \sffamily \c__fdu_name_clc_tl \c__fdu_fwid_colon_tl }
          { \l__fdu_info_clc_tl }
      }
  }
\cs_new_protected:Npn \__fdu_abstract_en_end:
  {
    % 2023-04-11
    \thispagestyle{empty}
    % 2023-04-11
    \__fdu_keywords:nNn
      { \bfseries \c__fdu_name_keywords_en_tl \__fdu_quad: }
      \l__fdu_info_keywords_en_clist { ; ~ }
    \tl_if_empty:NTF \l__fdu_info_jel_tl
      {
        \tl_if_empty:NF \l__fdu_info_clc_tl
          {
            \__fdu_clc_jel:nn
              { \bfseries \c__fdu_name_clc_en_tl \__fdu_quad: }
              { \l__fdu_info_clc_tl }
          }
      }
      {
        \__fdu_clc_jel:nn
          { \bfseries \c__fdu_name_jel_en_tl \__fdu_quad: }
          { \l__fdu_info_jel_tl }
      }
  }
\cs_new_protected:Npn \__fdu_keywords:nNn #1#2#3
  {
    \par \mode_leave_vertical: \par \noindent
    \__fdu_get_text_width:Nn \l__fdu_tmpa_dim {#1}
    \group_begin: #1 \group_end:
    \parbox [t] { \dim_eval:n { \textwidth - \l__fdu_tmpa_dim } }
      {
        \clist_use:Nn #2 {#3} \par
        \cs_gset:Npx \__fdu_keywords_prevdepth: { \dim_use:N \tex_prevdepth:D }
      }
  }
\cs_new_protected:Npn \__fdu_clc_jel:nn #1#2
  {
    \par \tex_prevdepth:D \__fdu_keywords_prevdepth: \noindent
    \group_begin: #1 \group_end:
    #2
  }
\NewDocumentEnvironment { notation } { O { l p { 7.5 cm } } }
  {
    \__fdu_notation_begin:
    \group_begin:
      \__fdu_notation_long_table_setup:
      \longtable {#1}
  }
  {
      \endlongtable
    \group_end:
  }
\cs_new_protected:Npn \__fdu_notation_begin:
  {
    \__fdu_chapter:V \c__fdu_name_notation_tl
  }
\cs_new_protected:Npn \__fdu_notation_long_table_setup:
  {
    \dim_set_eq:NN \LTpre  \c_zero_dim
    \dim_set_eq:NN \LTpost \c_zero_dim
  }
% \bool_new:N \l__fdu_bibtex_bool
% \tl_new:N \l__fdu_bib_style_tl
% \tl_new:N \l__fdu_bib_gb_style_tl
% \tl_new:N \l__fdu_cite_style_tl
% \clist_new:N \l__fdu_bib_resource_clist
% \keys_define:nn { fdu / style }
%   {
%     bib-backend .choice:,
%     bib-backend .value_required:n = true,
%     bib-backend / bibtex   .code:n =
%       { \bool_set_true:N  \l__fdu_bibtex_bool },
%     bib-backend / biblatex .code:n =
%       { \bool_set_false:N \l__fdu_bibtex_bool },
%     bib-style .choice:,
%     bib-style .value_required:n = true,
%     bib-style / numerical    .code:n =
%       {
%         \tl_set:Nn  \l__fdu_bib_gb_style_tl { numerical  }
%         \tl_clear:N \l__fdu_bib_style_tl
%       },
%     bib-style / author-year .code:n =
%       {
%         \tl_set:Nn  \l__fdu_bib_gb_style_tl { author-year }
%         \tl_clear:N \l__fdu_bib_style_tl
%       },
%     bib-style / unknown     .code:n =
%       {
%         \tl_set_eq:NN \l__fdu_bib_style_tl \l_keys_value_tl
%         \tl_clear:N   \l__fdu_bib_gb_style_tl
%       },
%     cite-style .tl_set:N = \l__fdu_cite_style_tl,
%     bib-resource .clist_set:N = \l__fdu_bib_resource_clist
%   }
% \ctex_at_end_preamble:n
%   {
%     \bool_if:NT \l__fdu_bibtex_bool
%       {
%         \tl_if_empty:NTF \l__fdu_bib_style_tl
%           {
%             \RequirePackage [ sort & compress ] { gbt7714 }
%             \exp_args:No \bibliographystyle { gbt7714- \l__fdu_bib_gb_style_tl }
%           }
%           {
%             \RequirePackage [ sort & compress ] { natbib }
%             \exp_args:NV \bibliographystyle \l__fdu_bib_style_tl
%           }
%         \__fdu_bibtex_setup:
%       }
%   }
% \__fdu_gadd_ltxhook:nn { env/document/begin }
%   {
%     \bool_if:NF \l__fdu_bibtex_bool
%       {
%         \__fdu_biblatex_pre_setup:
%         \RequirePackage { biblatex }
%         \__fdu_biblatex_post_setup:
%       }
%   }
% \cs_new_protected:Npn \__fdu_bibtex_setup:
%   {
%     \tl_if_eq:VnTF \l__fdu_bib_gb_style_tl { numerical }
%       {
%         \exp_args:NNx \DeclareRobustCommand \parencite
%           { \exp_args:No \exp_not:o { \cs:w cite ~ \cs_end: } }
%         \exp_args:Nc \ctex_patch_cmd:Nnn { parencite ~ }
%           { \begingroup }
%           { \begingroup \bibstyle@numbers }
%       }
%       { \cs_set_eq:NN \parencite \cite }
%     \tl_if_empty:NF \l__fdu_cite_style_tl
%       { \exp_args:NV \citestyle \l__fdu_cite_style_tl }
%     \ctex_patch_cmd:Nnn \NAT@citexnum
%       { - \NAT@penalty }
%       { \textendash \NAT@penalty }
%     \cs_set:Npn \bibsection { \__fdu_chapter:V \bibname }
%     \NewDocumentCommand \printbibliography { o }
%       {
%         \exp_args:NV \bibliography \l__fdu_bib_resource_clist
%         \IfValueT {##1}
%           { \__fdu_warning:nn { invalid-option-in-bibtex } {##1} }
%       }
%   }
% \__fdu_msg_new:nn { invalid-option-in-bibtex }
%   { Option(s)~ "#1"~ are~ invalid~ in~ BibTeX. }
% \bool_if:NF \l__fdu_bibtex_bool
%   {
%     \NewDocumentCommand \addbibresource { m }
%       { \clist_gput_right:Nn \l__fdu_bib_resource_clist {#1} }
%   }
% \cs_new_protected:Npn \__fdu_biblatex_pre_setup:
%   {
%     \cs_undefine:N \addbibresource
%     \clist_new:N \l__fdu_biblatex_options_clist
%     \clist_put_right:Nn \l__fdu_biblatex_options_clist { hyperref = manual }
%     \clist_put_right:Nx \l__fdu_biblatex_options_clist
%       {
%         style =
%         \tl_if_empty:NTF \l__fdu_bib_style_tl
%           {
%             \str_if_eq:VnTF \l__fdu_bib_gb_style_tl { numerical }
%               { gb7714-2015 } { gb7714-2015ay }
%           }
%           { \l__fdu_bib_style_tl }
%       }
%     \tl_if_empty:NF \l__fdu_cite_style_tl
%       {
%         \clist_put_right:Nx \l__fdu_biblatex_options_clist
%           { citestyle = \l__fdu_cite_style_tl }
%       }
%     \exp_args:NV \PassOptionsToPackage \l__fdu_biblatex_options_clist
%       { biblatex }
%   }
% \cs_new_protected:Npn \__fdu_biblatex_post_setup:
%   {
%     \clist_map_function:NN \l__fdu_bib_resource_clist \addbibresource
%     \__fdu_biblatex_allow_url_break:
%     \__fdu_biblatex_use_en_dash:
%     \defbibheading { bibliography } [ \bibname ] { \__fdu_chapter:n {##1} }
%   }
% \cs_new:Npn \__fdu_biblatex_allow_url_break:
%   {
%     \int_set_eq:NN \c@biburlucpenalty  \c_one_int
%     \int_set_eq:NN \c@biburlnumpenalty \c_one_int
%     \int_set_eq:NN \c@biburllcpenalty  \c_one_int
%   }
% \cs_new:Npn \__fdu_biblatex_use_en_dash:
%   {
%     \DefineBibliographyExtras { english }
%       {
%         \cs_set_nopar:Npn \bibrangedash
%           { \textendash \penalty \hyphenpenalty }
%       }
%     \DefineBibliographyExtras { russian }
%       {
%         \cs_set_nopar:Npn \bibrangedash
%           { \textendash \penalty \hyphenpenalty }
%       }
%   }
\NewDocumentCommand \hypersetup { m }
  { \fdu_hyperref_setup:n {#1} }
\cs_new_protected:Npn \fdu_hyperref_setup:n #1
  { \clist_gput_right:Nn \g__fdu_to_hyperref_clist {#1} }
\cs_new:Npn \__fdu_set_hyperlink_color_key:n #1
  {
    hyperlink-color / \clist_item:nn {#1} {1} .code:n =
      {
        \__fdu_define_hyperlink_color:nnn
          { \clist_item:nn {#1} {2} }
          { \clist_item:nn {#1} {3} }
          { \clist_item:nn {#1} {4} }
        \fdu_hyperref_setup:n
          {
            linkcolor = fdu@link, linkbordercolor = fdu@link,
            urlcolor  = fdu@url,  urlbordercolor  = fdu@url,
            citecolor = fdu@cite, citebordercolor = fdu@cite
          }
      },
  }
\cs_new_protected:Npn \__fdu_define_hyperlink_color:nnn #1#2#3
  {
    \definecolorset { HTML } { fdu@ } { }
      { link, #1; url, #2; cite, #3 }
  }
\keys_define:nx { fdu / style }
  {
    hyperlink .choice:,
    hyperlink .value_required:n = true,
    hyperlink / border .code:n =
      { \fdu_hyperref_setup:n { colorlinks = false } },
    hyperlink / color  .code:n =
      { \fdu_hyperref_setup:n { colorlinks = true  } },
    hyperlink / none   .code:n =
      { \fdu_hyperref_setup:n { hidelinks } },
    hyperlink-color .choice:,
    hyperlink-color .value_required:n = true,
    \clist_map_function:nN
      {
        { classic,   FF0000, 0000FF, 00FF00 },
        { default,   990000, 0000B2, 007F00 },
        { material,  E91E63, 009688, 4CAF50 },
        { graylevel, 616161, 616161, 616161 },
        { prl,       2D3092, 2D3092, 2D3092 }
      }
      \__fdu_set_hyperlink_color_key:n
  }
\cs_new:Npn \fdu_allow_url_break:
  {
    \cs_new:Npn \__fdu_add_url_break_points:
      { \tl_map_function:NN \c__fdu_url_break_points_tl \do }
    \__fdu_appto_cmd:Nn \UrlBreaks
      { \UrlOrds \__fdu_add_url_break_points: }
  }
\tl_const:Nn \c__fdu_url_break_points_tl
  {
    abcdefghijklmnopqrstuvwxyz
    ABCDEFGHIJKLMNOPQRSTUVWXYZ
    0123456789
  }
\ctex_at_end_preamble:n
  {
    \RequirePackage { hyperref }
    \hypersetup
      {
        bookmarksnumbered = true,
        psdextra          = true,
        unicode           = true,
        pdftitle    = \l__fdu_info_title_tl,
        pdfauthor   = \l__fdu_info_author_tl,
        pdfkeywords = \l__fdu_info_keywords_clist,
        pdfcreator  = \c__fdu_name_pdf_creator_tl
      }
    \exp_args:NV \hypersetup \g__fdu_to_hyperref_clist
    \fdu_allow_url_break:
    % \bool_if:NF \l__fdu_bibtex_bool { \BiblatexManualHyperrefOn }
  }
\ctex_at_end_package:nn { hyperref }
  {
    \pdfstringdefDisableCommands
      {
        \cs_set_eq:NN \fdu@kai \prg_do_nothing:
        \cs_set_eq:NN \quad    \c_space_tl
        \cs_set_eq:NN \qquad   \c_space_tl
      }
  }
\keys_define:nn { fdu }
  {
    info  .meta:nn = { fdu / info  } {#1},
    style .meta:nn = { fdu / style } {#1}
  }
\keys_set:nn { fdu }
  {
    style   / font            = times,
    style   / cjk-font        = fandol,
    style   / font-size       = -4,
    style   / fullwidth-stop  = false,
    style   / auto-make-cover = true,
    style   / logo            = { fudan-name.pdf },
    style   / logo-size       = { 0.5 \textwidth },
    style   / hyperlink       = color,
    style   / hyperlink-color = default,
    % style   / bib-style       = numerical,
    info    / degree          = academic,
    info    / secret-level    = none,
    info    / school-id       = { 10246 },
    info    / date            = { \zhtoday },
    % theorem / header-font     = { \sffamily },
    % theorem / body-font       = { \fdu@kai },
    % theorem / counter         = { chapter }
  }
\NewDocumentCommand \fdusetup { m }
  { \keys_set:nn { fdu } {#1} }
% \newtheorem* { proof       } { \c__fdu_name_proof_tl      }
% \newtheorem  { axiom       } { \c__fdu_name_axiom_tl      }
% \newtheorem  { corollary   } { \c__fdu_name_corollary_tl  }
% \newtheorem  { definition  } { \c__fdu_name_definition_tl }
% \newtheorem  { example     } { \c__fdu_name_example_tl    }
% \newtheorem  { lemma       } { \c__fdu_name_lemma_tl      }
% \newtheorem  { theorem     } { \c__fdu_name_theorem_tl    }
%%
%% End of file `fduthesis.cls'.


\RequirePackage{ fdulogo, changepage, xeCJKfntef }
%%*********************************************************************************************************************
%%*************************************************** Infrastructure **************************************************
%%*********************************************************************************************************************
% Control Sequences For Initializing New Variables
\cs_new:Nn \__fdm_ifr_int_init:N
  { \int_if_exist:NTF #1 { \int_set_eq:NN #1 \c_zero_int } { \int_new:N #1 } }
\cs_new:Nn \__fdm_ifr_int_ginit:N
  { \int_if_exist:NTF #1 { \int_gset_eq:NN #1 \c_zero_int } { \int_new:N #1 } }
\cs_new:Nn \__fdm_ifr_dim_init:N
  { \dim_zero_new:N #1 }
\cs_new:Nn \__fdm_ifr_dim_ginit:N
  { \dim_gzero_new:N #1 }
\cs_new:Nn \__fdm_ifr_clist_init:N
  { \clist_if_exist:NTF #1 { \clist_set_eq:NN #1 \c_empty_clist } { \clist_new:N #1 } }
\cs_new:Nn \__fdm_ifr_clist_ginit:N
  { \clist_if_exist:NTF #1 { \clist_gset_eq:NN #1 \c_empty_clist } { \clist_new:N #1 } }
\cs_new:Nn \__fdm_ifr_tl_init:N
  { \tl_if_exist:NTF #1 { \tl_set:Nn #1 { } } { \tl_new:N #1 } }
\cs_new:Nn \__fdm_ifr_tl_ginit:N
  { \tl_if_exist:NTF #1 { \tl_gset:Nn #1 { } } { \tl_new:N #1 } }
\cs_new:Nn \__fdm_ifr_bool_init:N
  { \bool_if_exist:NTF #1 { \bool_set_false:N #1 } { \bool_new:N #1 } }
\cs_new:Nn \__fdm_ifr_bool_ginit:N
  { \bool_if_exist:NTF #1 { \bool_gset_false:N #1 } { \bool_new:N #1 } }
\cs_generate_variant:Nn \tl_show:n { x, o }
\cs_generate_variant:Nn \tl_if_eq:nnTF { xxTF }
\cs_generate_variant:Nn \tl_if_eq:nnT { xxT }
\cs_generate_variant:Nn \tl_if_eq:nnF { xxF }
\cs_generate_variant:Nn \str_if_eq:nnTF { xxTF }
\cs_generate_variant:Nn \str_if_eq:nnT { xxT }
\cs_generate_variant:Nn \str_if_eq:nnF { xxF }
\clist_map_inline:nn { int, dim, clist, tl, bool }
  {
    \clist_map_inline:nn { init, ginit }
      { \cs_generate_variant:cn { __fdm_ifr_#1_##1:N } { c } }
  }

% New Line
\cs_new_protected_nopar:Nn \__fdm_ifr_newline:
  {
    \newline
    \begin{minipage}{1ex}\centering\end{minipage}
  }

% Font Setter Creator
\NewDocumentCommand \DeclareNewFontSize { m }
  { \__ctex_save_font_size:nn { #1 } { #1 } }
\cs_new_protected:Nn \__fdm_ifr_gset_font_setter:nn
  { \cs_gset_protected_nopar:cn { __fdm_ #1 _font_setter: } { #2 } }
\cs_generate_variant:Nn \__fdm_ifr_gset_font_setter:nn { xx, nV }
\cs_new_protected_nopar:Nn \c__fdm_ifr_empty_font_setter: { }
\cs_new_protected:Nn \__fdm_ifr_gempty_font_setter:n 
  { \__fdm_ifr_gset_font_setter:nn { #1 } { \c__fdm_ifr_empty_font_setter: } }

% Font Env Setter Creator
\cs_new_protected:Nn \__fdm_ifr_gset_font_env_setter:nn
  { \cs_gset_protected:cn { __fdm_ #1 _font_env_setter:n } { \cs_if_exist_use:N #2 { ##1 } } }
  \cs_generate_variant:Nn \__fdm_ifr_gset_font_env_setter:nn { nV }
\cs_new_protected:Npn \c__fdm_ifr_empty_font_env_setter:n #1 { #1 }
\cs_new_protected:Nn \__fdm_ifr_gempty_font_env_setter:n
  { \__fdm_ifr_gset_font_env_setter:nn { #1 } { \c__fdm_ifr_empty_font_env_setter:n } }

% Dimension Adder Creator
\cs_new_protected:Nn \__fdm_ifr_create_dim_adder:nn 
  {
    \dim_if_exist:cF { g__fdm_ #1 _dim } 
      {
        \__fdm_ifr_dim_ginit:c { g__fdm_ #1 _dim }
        \dim_gset:cn { g__fdm_ #1 _dim } { #2 } % Original Value
      }
    \dim_if_exist:cF { g__fdm_ #1 _dim_addition }
      { \__fdm_ifr_dim_ginit:c { g__fdm_ #1 _dim_addition } }
    \cs_gset:cn { __fdm_ #1 _dim: }
      { \dim_eval:n { \dim_use:c { g__fdm_ #1 _dim } + \dim_use:c { g__fdm_ #1 _dim_addition } } }
  }
\cs_generate_variant:Nn \__fdm_ifr_create_dim_adder:nn { xx }
\cs_new_protected:Nn \__fdm_ifr_gzero_dim_adder:n { \dim_gzero:c { g__fdm_ #1 _dim_addition } }
\cs_new_protected:Nn \__fdm_ifr_gset_dim_adder:nn { \dim_gset:cn { g__fdm_ #1 _dim_addition } { #2 } }
\cs_generate_variant:Nn \__fdm_ifr_gset_dim_adder:nn { nV }
\cs_new_protected:Nn \__fdm_ifr_gadd_dim_adder:nn 
  { 
    \dim_gset:cn { g__fdm_ #1 _dim_addition }
      { \dim_use:c { g__fdm_ #1 _dim_addition } + #2 }
  }
\cs_generate_variant:Nn \__fdm_ifr_gadd_dim_adder:nn { nV }

% UnPack Protected Control Sequence and Save the Macro Into a Token List
\cs_new_protected:Nn \__fdm_ifr_unpack_protected_cs_to_tl:NN { \tl_gset:Nx #1 { \tl_head:N #2 \tl_tail:N #2 } }

% Variant For \__fdu_spread_box:nn
\cs_generate_variant:Nn \__fdu_spread_box:nn { Vn }
%% Renew Patcher
\cs_gset_protected:Npn \__fdm_ifr_spread_box:nnn #1#2#3
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn {#1}
      { \tl_map_inline:xn {#2} { { #3 ##1 } \hfil } \unskip }
  }

% Renew \__fdu_get_text_width:Nn ( space has 0 width )
\cs_gset:Npn \__fdu_get_text_width:Nn #1#2
  {
    \__fdm_ifr_dim_init:N #1
    \tl_if_in:nnF { #2 } { \c_space_token }
      {
        \hbox_set:Nn \l__fdu_tmpa_box {#2}
        \dim_set:Nn #1 { \box_wd:N \l__fdu_tmpa_box }
        % \tl_show:n { #2 }
        % \dim_show:n { #1 }
      }
  }
\cs_generate_variant:Nn \__fdu_get_text_width:Nn { Nx, cn, cx }

% Renew \__fdu_get_max_text_width:NN
\cs_gset:Npn \__fdu_get_max_text_width:NN #1#2
  {
    \__fdm_ifr_dim_ginit:N #1
    \group_begin:
      \clist_set_eq:NN \l__fdu_tmpa_clist #2
      \bool_until_do:nn { \clist_if_empty_p:N \l__fdu_tmpa_clist }
        {
          \clist_pop:NN \l__fdu_tmpa_clist \l__fdu_tmpa_tl
          \__fdu_get_text_width:NV \l__fdu_tmpa_dim \l__fdu_tmpa_tl
          \dim_gset:Nn #1 { \dim_max:nn {#1} { \l__fdu_tmpa_dim } }
        }
    \group_end:
  }

% Rows Clist Converts to Columns Clist (Transpose)
\cs_new:Nn \__fdm_ifr_rows_clist_transpose:Nnn 
  {
    \__fdm_ifr_clist_ginit:N #1
    \group_begin:
      \__fdm_ifr_clist_init:N \l__fdm_tmpa_clist
      \int_step_inline:nn { #3 } 
        {
          \clist_clear:N \l__fdm_tmpa_clist
          \clist_map_inline:nn { #2 } 
            {
              \int_compare:nTF { ##1 > \clist_count:n { ####1 } }
                { \clist_put_right:Nn \l__fdm_tmpa_clist { \c_space_token } }
                { \clist_put_right:Nx \l__fdm_tmpa_clist { \clist_item:nn { ####1 } { ##1 } } }
            }
          \clist_gput_right:Nx #1 { { \l__fdm_tmpa_clist } }
        }
    \group_end:
  }
\cs_generate_variant:Nn \__fdm_ifr_rows_clist_transpose:Nnn { NVn, NnV, NVV }
\cs_new_protected:Nn \__fdm_ifr_rows_clist_get_column_num:Nn
  {
    \__fdm_ifr_int_ginit:N #1
    \clist_map_inline:nn { #2 }
      { \int_gset:Nn #1 { \int_max:nn { #1 } { \clist_count:n { ##1 } } } }
  }
\cs_generate_variant:Nn \__fdm_ifr_rows_clist_get_column_num:Nn { NV }
\cs_new:Nn \__fdm_ifr_rows_clist_get_col_num_and_transpose:NNn 
  {
    \__fdm_ifr_rows_clist_get_column_num:Nn #1 { #3 }
    \__fdm_ifr_rows_clist_transpose:NnV #2 { #3 } #1
  }
\cs_generate_variant:Nn \__fdm_ifr_rows_clist_get_col_num_and_transpose:NNn  { NNV }

%%*********************************************************************************************************************
%%************************************************* Edition Raiser ****************************************************
%%*********************************************************************************************************************
% Control Sequance For Declaring New Edition
\__fdm_ifr_clist_ginit:N \g__fdm_thesis_edition_clist
\clist_gput_left:Nn \g__fdm_thesis_edition_clist { 0 }
\cs_new_protected:Nn \__fdm_thesis_new_edition:nn
  { 
    \clist_gput_left:Nn \g__fdm_thesis_edition_clist { #1 } 
    \exp_args:NNo \cs_gset_nopar:Nn \__fdm_thesis_edition_raiser_aux: 
      { \__fdm_thesis_edition_raiser_aux: #2 }
  }

% Paper Year Key For Edition Raising
\__fdm_ifr_int_ginit:N \g__fdm_thesis_edition_int
\__fdm_ifr_int_ginit:N \g__fdm_thesis_paper_year_int
\keys_define:nn { fdu / info }
  {
    date / year .code:n = 
      {
        \int_gset:Nn \g__fdm_thesis_paper_year_int { #1 }
        \tl_gset:Nx \l__fdu_info_date_year_tl { #1 }
        \__fdm_thesis_edition_confirm_aux:NNN
          \g__fdm_thesis_edition_int    % [#1] Output
          \g__fdm_thesis_paper_year_int % [#2] Input
          \g__fdm_thesis_edition_clist  % [#3] Input
        \int_compare:nF { \g__fdm_thesis_edition_int == 0 }
          { \__fdm_thesis_edition_raiser_aux: }
      },
    date .initial:n = { \the\year },
  }

% New Keys For Content Control
\keys_define:nn { fdu / info }
  {
    date / month .tl_set:N = \l__fdu_info_date_month_tl,
    date / month .initial:n = { \the\month },
    date / day .tl_set:N = \l__fdu_info_date_day_tl,
    date / day .initial:n = { \the\day }
  }

% Dimension Adder Creator With Keys Defining
\cs_new_protected:Nn \__fdm_thesis_create_dim_adder:nn 
  {
    \__fdm_ifr_create_dim_adder:nn { thesis_#1 } { #2 }
    \keys_define:nn { fdu / FDUMathThesisEditor }
      {
        gzeroDimAdder / #1 .value_forbidden:n = true,
        gzeroDimAdder / #1 .code:n = { \__fdm_ifr_gzero_dim_adder:n { thesis_#1 } },
        gsetDimAdder  / #1 .code:n = { \__fdm_ifr_gset_dim_adder:nV { thesis_#1 } \l_keys_value_tl },
        gaddDimAdder  / #1 .code:n = { \__fdm_ifr_gadd_dim_adder:nV { thesis_#1 } \l_keys_value_tl },
      }
  }

% Control Sequences and Keys For Edition Raising
\cs_new_protected:Nn \__fdm_thesis_declare_cover_objects:nnnn
  {
    \clist_map_inline:nn { #1 }
      { 
        \__fdm_ifr_gset_font_setter:nn     { thesis_info_box }                             {  #2  }
        \__fdm_ifr_gset_font_setter:nn     { thesis_##1 }                                  {  #2  }
        \__fdm_ifr_gset_font_setter:nn     { thesis_##1_content }                          {  #3  }
        \__fdm_ifr_gset_font_env_setter:nn { thesis_##1_content_line }                     {  #4  }
        \__fdm_thesis_create_dim_adder:nn         { ##1_content_left_blank }               { 0 pt }
        \__fdm_thesis_create_dim_adder:nn         { ##1_content_line_left_space }          { 0 pt }
        \__fdm_thesis_create_dim_adder:nn         { ##1_content_line_right_space }         { 0 pt }
        \bool_if_exist:cF           { g__fdm_thesis_##1_content_flushleft_bool }
          { \bool_new:c             { g__fdm_thesis_##1_content_flushleft_bool }                  }
        \tl_if_exist:cF             { g__fdm_thesis_##1_idx_intarray }
          { \intarray_new:cn        { g__fdm_thesis_##1_idx_intarray } { 2 }                      }
        \keys_define:nn { fdu / FDUMathThesisEditor / ##1 }
          { 
            % Tag Font Setter
            gemptyTagFontSetter .value_forbidden:n = true,
            gemptyTagFontSetter .code:n = { \__fdm_ifr_gempty_font_setter:n { thesis_##1 } },
            gsetTagFontSetter .code:n = { \__fdm_ifr_gset_font_setter:nV  { thesis_##1 } \l_keys_value_tl },
            % Content Font Setter
            gemptyContentFontSetter .value_forbidden:n = true,
            gemptyContentFontSetter .code:n = { \__fdm_ifr_gempty_font_setter:n { thesis_##1_content } },
            gsetContentFontSetter .code:n = { \__fdm_ifr_gset_font_setter:nV  { thesis_##1_content } \l_keys_value_tl },
            % Content Line Font Environment Setter
            gemptyContentLineFontEnvSetter .value_forbidden:n = true,
            gemptyContentLineFontEnvSetter .code:n = { \__fdm_ifr_gempty_font_env_setter:n { thesis_##1_content_line } },
            gsetContentLineFontEnvSetter .code:n = { \__fdm_ifr_gset_font_env_setter:nV  { thesis_##1_content_line } \l_keys_value_tl },
            % Content Left Blank
            gzeroContentLeftBlankAdder .value_forbidden:n = true,
            gzeroContentLeftBlankAdder .code:n = { \__fdm_ifr_gzero_dim_adder:n { thesis_##1_content_left_blank } },
            gsetContentLeftBlankAdder .code:n = { \__fdm_ifr_gset_dim_adder:nV { thesis_##1_content_left_blank } \l_keys_value_tl },
            gaddContentLeftBlankAdder .code:n = { \__fdm_ifr_gadd_dim_adder:nV { thesis_##1_content_left_blank } \l_keys_value_tl },
            % Content Line Left Space
            gzeroContentLineLeftSpaceAdder .value_forbidden:n = true,
            gzeroContentLineLeftSpaceAdder .code:n = { \__fdm_ifr_gzero_dim_adder:n { thesis_##1_content_line_left_space } },
            gsetContentLineLeftSpaceAdder .code:n = { \__fdm_ifr_gset_dim_adder:nV { thesis_##1_content_line_left_space } \l_keys_value_tl },
            gaddContentLineLeftSpaceAdder .code:n = { \__fdm_ifr_gadd_dim_adder:nV { thesis_##1_content_line_left_space } \l_keys_value_tl },
            % Content Line Right Space
            gzeroContentLineRightSpaceAdder .value_forbidden:n = true,
            gzeroContentLineRightSpaceAdder .code:n = { \__fdm_ifr_gzero_dim_adder:n { thesis_##1_content_line_right_space } },
            gsetContentLineRightSpaceAdder .code:n = { \__fdm_ifr_gset_dim_adder:nV { thesis_##1_content_line_right_space } \l_keys_value_tl },
            gaddContentLineRightSpaceAdder .code:n = { \__fdm_ifr_gadd_dim_adder:nV { thesis_##1_content_line_right_space } \l_keys_value_tl },
            % Content Flush Left
            setContentFlushleft .value_forbidden:n = true,
            setContentFlushleft .code:n = { \bool_set_true:c { g__fdm_thesis_##1_content_flushleft_bool } },
            defineContentAux .code:n = { \cs_gset_protected:cx { __fdm_thesis_info_box_##1_content_aux: } { \l_keys_value_tl } }
          }
      }
  }
\cs_generate_variant:Nn \__fdm_thesis_declare_cover_objects:nnnn { VVVV }
\cs_new_protected:Nn \__fdm_thesis_declare_cover_objects_aux:n
  {
    \__fdm_ifr_clist_init:N \__fdm_tmpa_clist
    \clist_set:Nn \__fdm_tmpa_clist { #1 }
    \clist_pop:NN \__fdm_tmpa_clist \g__fdm_thesis_cover_i_objects
    \clist_pop:NN \__fdm_tmpa_clist \g__fdm_thesis_cover_i_tag_font
    \clist_pop:NN \__fdm_tmpa_clist \g__fdm_thesis_cover_i_content_font
    \clist_pop:NN \__fdm_tmpa_clist \g__fdm_thesis_cover_i_content_line_font_env
    \__fdm_thesis_declare_cover_objects:VVVV
      \g__fdm_thesis_cover_i_objects
      \g__fdm_thesis_cover_i_tag_font
      \g__fdm_thesis_cover_i_content_font
      \g__fdm_thesis_cover_i_content_line_font_env
  }

% New Key Module For Edition Raising
\__fdm_ifr_tl_init:N \l__fdm_thesis_template_name_cover_i
\tl_set:Nn \l__fdm_thesis_template_name_cover_i { cover-i }
\keys_define:nn { fdu / FDUMathThesisEditor }
  {
    declareFont .code:n =  { \clist_map_inline:nn { #1 } { \DeclareNewFontSize { ##1 } } },
    editionYear .int_set:N = \l__fdm_thesis_edition_year,
    editionType .choice:,
    editionType .value_required:n = true,
    editionType .choices:nn = { doctor, master, bachelor, graduate, all }
      { 
        \__fdm_ifr_tl_init:N \l__fdm_thesis_type
        \tl_set:Nn \l__fdm_thesis_type { \tl_use:N \l_keys_choice_tl }
      },
    % declareCoverIPart Should Be Companied By editionYear and editionType
    declareCoverIPart .code:n = 
      { 
        \tl_set:Nx \l__fdm_thesis_template_name_cover_i
          { cover-i-\tl_use:N \l__fdm_thesis_type -\romannumeral \l__fdm_thesis_edition_year }
        \DeclareCoverTemplate { \tl_use:N \l__fdm_thesis_template_name_cover_i } { #1 }
      },
    % declareCoverIInstance Should Be Companied By declareCoverIPart
    declareCoverIInstance .code:n = 
      { \DeclareInstance { fdu / cover } { cover-i-default } { \tl_use:N \l__fdm_thesis_template_name_cover_i } { #1 } },
    % editCoverIInstance Can Be Alone
    editCoverIInstance .code:n = 
      { \EditInstance    { fdu / cover } { cover-i-default } { \tl_use:N \l__fdm_thesis_template_name_cover_i } { #1 } },
    declareCoverIObject .code:n = { \__fdm_thesis_declare_cover_objects_aux:n { #1 } },
    declareCoverIInfoBoxArrange .code:n =
      {
        \tl_gset:Nn \g__fdm_thesis_info_box_tags_array { #1 }
        \__fdm_ifr_rows_clist_get_col_num_and_transpose:NNV
          \g__fdm_thesis_info_box_col_num_int           % [#1] Output
          \g__fdm_thesis_info_box_tags_array_transposed % [#2] Output
          \g__fdm_thesis_info_box_tags_array            % [#3] Input
        \int_step_inline:nnn { 2 } { \g__fdm_thesis_info_box_col_num_int }
          {
            \exp_args:Nx \dim_if_exist:cF { g__fdm_thesis_info_box_col_\romannumeral ##1 _leftedge_rightmove_dim }
              { \exp_args:Nx \__fdm_thesis_create_dim_adder:nn { info_box_col_\romannumeral ##1 _leftedge_rightmove } { 0pt } }
          }
      },
    createCoverINewObjectInterface .code:n = 
      {
        \clist_map_inline:nn { #1 }
          {
            \__fdm_ifr_clist_init:N \__fdm_tmpa_clist
            \clist_set:Nn \__fdm_tmpa_clist { ##1 }
            \clist_pop:NN \__fdm_tmpa_clist \__fdm_thesis_new_key_interface_name
            \clist_pop:NN \__fdm_tmpa_clist \__fdm_thesis_new_key_key_name
            \clist_pop:NN \__fdm_tmpa_clist \__fdm_thesis_new_key_tag_name
            \tl_if_exist:cF { l__fdu_info_\tl_use:N \__fdm_thesis_new_key_key_name _tl }
              {
                \__fdm_ifr_tl_ginit:c { l__fdu_info_\tl_use:N \__fdm_thesis_new_key_key_name _tl }
                \exp_args:Nno \keys_define:nn { fdu / info }
                  { \__fdm_thesis_new_key_interface_name .tl_gset:c = { l__fdu_info_\tl_use:N \__fdm_thesis_new_key_key_name _tl } }
              }
            \tl_gset_eq:cN { c__fdu_name_\tl_use:N \__fdm_thesis_new_key_key_name _tl } \__fdm_thesis_new_key_tag_name
          }
      },
    contentAux .code:n = { #1 },
  }

%%*********************************************************************************************************************
%%************************************************* Edition Raiser ****************************************************
%%****************************************** (Auxiliary Control Sequences) ********************************************
%%*********************************************************************************************************************
\cs_new_protected:Nn \__fdm_thesis_edition_confirm_aux:NNN
  % \g__fdm_thesis_edition_int    % [#1] Output
  % \g__fdm_thesis_paper_year_int % [#2] Input
  % \g__fdm_thesis_edition_clist  % [#3] Input
  {
    \group_begin:
      \__fdm_ifr_clist_init:N \l__fdm_tmpa_clist
      \clist_set_eq:NN \l__fdm_tmpa_clist #3
      \__fdm_ifr_bool_init:N \l__fdm_tmpa_bool % False
      \bool_do_until:nn { \bool_if_p:N \l__fdm_tmpa_bool }
        {
          \clist_pop:NN \l__fdm_tmpa_clist \l__fdm_tmpa_tl
          \__fdm_ifr_int_init:N \l__fdm_tmpa_int
          \int_set:Nn \l__fdm_tmpa_int { \tl_use:N \l__fdm_tmpa_tl }
          \int_compare:nNnF { \l__fdm_tmpa_int } > { #2 }
            { 
              \int_gset_eq:NN #1 \l__fdm_tmpa_int
              \bool_set_true:N \l__fdm_tmpa_bool
            }
        }
    \group_end:
  }

\cs_new_nopar:Nn \__fdm_thesis_edition_raiser_aux: % It Should Be Unprotected
  {
    \__fdm_thesis_coveri_id_box_aux:
    \__fdm_thesis_coveri_type_box_aux:
    \__fdm_thesis_coveri_info_box_aux:
  }

\cs_new_protected_nopar:Nn \__fdm_thesis_coveri_id_box_aux:
  {
    \tl_gset_eq:NN \c__fdu_name_id_box_student_id_tl   \c__fdu_name_student_id_tl
    \tl_gset_eq:NN \c__fdu_name_id_box_school_id_tl    \c__fdu_name_school_id_tl
    \tl_gset_eq:NN \c__fdu_name_id_box_secret_level_tl \c__fdu_name_secret_level_tl
    \tl_gset:Nn    \c__fdu_name_student_id_tl          { 学号 }
    \__fdm_ifr_clist_ginit:N \g__fdm_thesis_id_box_clist
    \__fdm_thesis_declare_cover_objects:nnnn                             % Original Value
      { student_id, school_id }                                          % Original Value
      { \c__fdm_ifr_empty_font_setter: }                                 % Original Value
      { \c__fdm_ifr_empty_font_setter: }                                 % Original Value
      { \c__fdm_ifr_empty_font_env_setter:n }                            % Original Value
    \__fdm_thesis_declare_cover_objects:nnnn                             % Original Value
      { secret_level } { \sffamily } { \sffamily }                       % Original Value
      { \c__fdm_ifr_empty_font_env_setter:n }                            % Original Value
    \clist_gset:Nn \g__fdm_thesis_id_box_clist { school_id, student_id } % Original Value
    \__fdm_thesis_create_dim_adder:nn { id_box } { 120pt }               % Original Value
    \__fdm_thesis_create_dim_adder:nn { id_box_rightmove } { 20pt }      % Original Value
    %% Renew FDUTHESIS control sequence
    \cs_gset_eq:NN \__fdu_cover_id: \__fdm_cover_id:
  }

\cs_new_protected_nopar:Nn \__fdm_thesis_coveri_type_box_aux:
  {
    \__fdm_thesis_create_dim_adder:nn { type_box } {  0.45 \textwidth }  % Original Value
    %% Renew FDUTHESIS control sequence
    \cs_gset_eq:NN \__fdu_cover_type: \__fdm_cover_type:
  }

\cs_new_protected_nopar:Nn \__fdm_thesis_coveri_info_box_aux:
  { 
    \bool_if_exist:NF \g__fdm_thesis_info_box_content_compact_bool
      { \bool_new:N   \g__fdm_thesis_info_box_content_compact_bool }
    \__fdm_thesis_create_dim_adder:nn { info_box_content_compact_more_blank } { 0 pt }
    \__fdm_thesis_create_dim_adder:nn { info_box_leftedge_rightmove }         { 0 pt }
    \__fdm_thesis_create_dim_adder:nn { info_box_rightedge_rightmove }        { 0 pt }
    \__fdm_ifr_gset_font_setter:nn { thesis_info_box } { \centering }            % Original Value
    \__fdm_ifr_clist_ginit:N \g__fdm_thesis_info_box_tags_array
    \int_case:nn { \l__fdu_info_degree_type_int } 
      {
        { 1 }
        {
          \tl_gset:Nn \g__fdm_thesis_info_box_tags_array
            { department, major, author, supervisor, date }                      % Original Value
        }
        { 2 }
        {
          \tl_gset:Nn \g__fdm_thesis_info_box_tags_array
            { department, major_professional, author, supervisor, date }         % Original Value
        }
      }
    \__fdm_thesis_create_dim_adder:nn { info_box_tags } { 0em }                  % Original Value
    \__fdm_thesis_create_dim_adder:nn { info_box_line_skip } { 1ex }             % Original Value
    \__fdm_thesis_create_dim_adder:nn 
      { info_box_multiline_content_line_skip } { 0.2 \baselineskip }             % Original Value
    \__fdm_thesis_declare_cover_objects:nnnn                                     % Original Value
      { department, major, major_professional, author, supervisor, date, colon } % Original Value
      { \zihao { 4 } }                                                           % Original Value
      { \zihao { 4 } }                                                           % Original Value
      { \c__fdm_ifr_empty_font_env_setter:n }                                    % Original Value
    \dim_gset:Nn \g__fdm_thesis_info_box_leftedge_rightmove_dim { 7.2 pt }
    \dim_gset:Nn \g__fdm_thesis_info_box_rightedge_rightmove_dim { - 3.6 pt }
    \__fdm_ifr_dim_ginit:N \g__fdm_thesis_info_box_textwidth
    \dim_gset:Nn \g__fdm_thesis_info_box_textwidth
      { 
        \dim_eval:n
          {
            \textwidth
            - \__fdm_thesis_info_box_leftedge_rightmove_dim:
            + \__fdm_thesis_info_box_rightedge_rightmove_dim:
          }
      }
    %% Renew FDUTHESIS control sequence
    \cs_gset_eq:NN \__fdu_cover_info: \__fdm_cover_info:
  }
    
%% Renewer **********************************************************************************
\cs_gset:Npn \__fdm_cover_id_aux:n #1
  {
    {
      \cs_if_exist_use:c { __fdm_thesis_ #1 _font_setter: }
      \tl_use:c { c__fdu_name_id_box_ #1 _tl }
      \c__fdu_fwid_colon_tl
    }
    {
      \cs_if_exist_use:c { __fdm_thesis_ #1 _content_font_setter: }
      \tl_use:c { l__fdu_info_ #1 _tl }
    }
  }

\cs_gset_protected_nopar:Nn \__fdm_cover_id: 
  {
    \__fdu_fixed_width_box:nn { \g__fdm_thesis_id_box_dim + \g__fdm_thesis_id_box_dim_addition } 
      {
        \bool_if:NT \l__fdu_secret_bool 
          {
            \__fdm_cover_id_aux:n { secret_level }
            {
              \cs_if_exist_use:N \__fdm_thesis_secret_level_content_font_setter:
              \c__fdu_name_secret_star_tl
              \l__fdu_info_secret_year_tl
            }
            \par
          }
        \clist_map_inline:Nn \g__fdm_thesis_id_box_clist
          { \par \__fdm_cover_id_aux:n { ##1 } }
      }
    \hbox_to_wd:nn { - \g__fdm_thesis_id_box_rightmove_dim - \g__fdm_thesis_id_box_rightmove_dim_addition } { }
  }

\cs_gset_protected_nopar:Nn \__fdm_cover_type: 
  {
    \mode_leave_vertical:
    \__fdu_get_text_width:Nn \g__fdm_thesis_type_box_dim
      { \clist_item:Nn \c__fdu_thesis_type_clist { \g__fdu_thesis_type_int } }
    \__fdu_spread_box:nn { \g__fdm_thesis_type_box_dim + \g__fdm_thesis_type_box_dim_addition }
      { \clist_item:Nn \c__fdu_thesis_type_clist { \g__fdu_thesis_type_int } }
  }

\cs_gset_protected_nopar:Nn \__fdm_cover_info: 
  {
    \__fdm_thesis_multicol_info_box_calc_dims_aux:
    \begin{adjustwidth}
      { \__fdm_thesis_info_box_leftedge_rightmove_dim: }
      { \__fdm_thesis_info_box_rightedge_rightmove_dim: }
      \begin{minipage} [ c ] { \g__fdm_thesis_info_box_textwidth }
        \cs_if_exist_use:N \__fdm_thesis_info_box_font_setter:
        \__fdm_ifr_clist_init:N \l__fdm_tmpa_clist
        \clist_gset_eq:NN \l__fdm_tmpa_clist \g__fdm_thesis_info_box_tags_array
        \bool_until_do:nn { \clist_if_empty_p:N \l__fdm_tmpa_clist }
          {
            \clist_pop:NN \l__fdm_tmpa_clist \l__fdm_tmpa_tl
            \__fdm_thesis_multicol_info_box_row_output_aux:N \l__fdm_tmpa_tl
            \skip_vertical:n { \g__fdm_thesis_info_box_line_skip_dim + \g__fdm_thesis_info_box_line_skip_dim_addition }
          }
      \end{minipage}
    \end{adjustwidth}
  }
%% Auxiliary ********************************************************************************
\cs_new:Nn \__fdm_thesis_onecolumn_info_box_tag_output_aux:nn
  {
    \__fdm_ifr_spread_box:nnn { #2 } { \tl_use:c { c__fdu_name_ #1 _tl } }
      { \cs_if_exist_use:c { __fdm_thesis_ #1 _font_setter: } }
    { \cs_if_exist_use:c { __fdm_thesis_colon_font_setter: } \c__fdu_fwid_colon_tl }
  }
\cs_generate_variant:Nn \__fdm_thesis_onecolumn_info_box_tag_output_aux:nn { nV, Vn, VV }
\cs_new:Nn \__fdm_thesis_multicol_info_box_end_index_aux:NNN
  % \l__fdu_tmpb_int    % End Column Index            % [#1] Output and Input
  % \l__fdu_tmpa_clist  % Clist Start From Next Index % [#2] Input
  % \l__fdu_tmpa_tl     % This Index TL               % [#3] Input
  {
    \group_begin:
      \__fdm_ifr_tl_init:N \l__fdm_tmpc_tl % It Has To Be TMPC
      \clist_if_empty:NF #2
        {
          \clist_pop:NN #2 \l__fdm_tmpc_tl
          \tl_if_eq:xxT { #3 } { \l__fdm_tmpc_tl }
            {
              \int_gincr:N #1
              \__fdm_thesis_multicol_info_box_end_index_aux:NNN #1 #2 #3
            }
        }
    \group_end:
  }
\cs_new_protected_nopar:Nn \__fdm_thesis_multicol_info_box_determine_start_end_idx:
  {
    \group_begin:
      \__fdm_ifr_clist_init:N \l__fdm_tmpa_clist
      \clist_gset_eq:NN \l__fdm_tmpa_clist \g__fdm_thesis_info_box_tags_array
      \bool_until_do:nn { \clist_if_empty_p:N \l__fdm_tmpa_clist }
        {
          \clist_pop:NN \l__fdm_tmpa_clist \l__fdm_tmpb_clist
          \__fdm_ifr_int_init:N \l__fdm_tmpa_int % Column Index Start
          \__fdm_ifr_int_init:N \l__fdm_tmpb_int % Column Index End
          \__fdm_ifr_int_init:N \l__fdm_tmpc_int % Column Index Now At
          \int_incr:N           \l__fdm_tmpa_int % Initial at One
          \int_incr:N           \l__fdm_tmpb_int % Initial at One
          \int_incr:N           \l__fdm_tmpc_int % Initial at One
          \bool_until_do:nn { \clist_if_empty_p:N \l__fdm_tmpb_clist }
            {
              \clist_pop:NN \l__fdm_tmpb_clist \l__fdm_tmpb_tl
              \int_compare:nNnF { \l__fdm_tmpc_int } < { \l__fdm_tmpa_int }
                {
                  \tl_if_in:NnF \l__fdm_tmpb_tl { \c_space_token } 
                    {
                      \__fdm_thesis_multicol_info_box_end_index_aux:NNN
                        \l__fdm_tmpb_int    % End Column Index            % [#1] Output and Input
                        \l__fdm_tmpb_clist  % Clist Start From Next Index % [#2] Input
                        \l__fdm_tmpb_tl     % This Index TL               % [#3] Input
                      \intarray_gset:cnn 
                        { g__fdm_thesis_\tl_use:N \l__fdm_tmpb_tl _idx_intarray }
                        { 1 } { \int_use:N \l__fdm_tmpa_int }
                      \intarray_gset:cnn
                        { g__fdm_thesis_\tl_use:N \l__fdm_tmpb_tl _idx_intarray }
                        { 2 } { \int_use:N \l__fdm_tmpb_int }
                    }
                  \int_incr:N \l__fdm_tmpb_int
                  \int_set_eq:NN \l__fdm_tmpa_int \l__fdm_tmpb_int
                }
              \int_incr:N \l__fdm_tmpc_int
            }
        }
    \group_end:
  }
\cs_new_protected:Nn \__fdm_thesis_multicol_info_box_determine_tags_dim_aux:N
  {
    \fp_set:Nn \l_tmpa { \fparray_item:Nn #1 { 1 } }
    \int_step_inline:nnn { 2 } { \fparray_count:N #1 }
      {
        \fp_compare:nNnT { \l_tmpa } < { \fparray_item:Nn #1 { ##1 } }
          { \fp_set:Nn \l_tmpa { \fparray_item:Nn #1 { ##1 } } }
      }
    \int_step_inline:nn { \fparray_count:N #1 } { \fparray_gset:Nnn #1 { ##1 } { \l_tmpa } }
  }
\cs_new_protected_nopar:Nn \__fdm_thesis_multicol_info_box_calc_dims_aux:
  % To Calculate The Dimensions Below:
  % \g__fdm_thesis_info_box_tags_dim_fparray
  % \g__fdm_thesis_info_box_contents_dim_fparray
  % \g__fdm_thesis_info_box_content_line_dim_fparray
  % \g__fdm_thesis_info_box_colon_dim
  {
    \__fdm_thesis_multicol_info_box_determine_start_end_idx:
    \__fdu_get_text_width:Nx \g__fdm_thesis_info_box_colon_dim  % Output
      { \cs_if_exist_use:N \__fdm_thesis_colon_font_setter: \c__fdu_fwid_colon_tl }
    \fparray_new:Nn \g__fdm_thesis_info_box_tags_dim_fparray         { \g__fdm_thesis_info_box_col_num_int }
    \fparray_new:Nn \g__fdm_thesis_info_box_contents_dim_fparray     { \g__fdm_thesis_info_box_col_num_int }
    \fparray_new:Nn \g__fdm_thesis_info_box_content_line_dim_fparray { \g__fdm_thesis_info_box_col_num_int }
    \group_begin:
      \int_step_inline:nn { \g__fdm_thesis_info_box_col_num_int }
        {
          \__fdm_ifr_clist_init:N \l__fdm_tmpa_clist
          \__fdm_ifr_clist_init:N \l__fdm_tmpb_clist
          \__fdm_ifr_clist_init:N \l__fdm_tmpc_clist
          \clist_set:Nx \l__fdm_tmpa_clist 
            { \clist_item:Nn \g__fdm_thesis_info_box_tags_array_transposed { ##1 } }
          \clist_map_inline:Nn \l__fdm_tmpa_clist % For Each Item In This Column
            { 
              \tl_if_in:nnTF { ####1 } { \c_space_token }
              { 
                \clist_put_right:Nn \l__fdm_tmpb_clist { \c_space_token } 
                \clist_put_right:Nn \l__fdm_tmpc_clist { \c_space_token } 
              }
              {
                \bool_if:nTF
                  {
                    \int_compare_p:nNn { ##1 } = { \intarray_item:cn { g__fdm_thesis_ ####1 _idx_intarray } { 1 } }
                    &&
                    \int_compare_p:nNn { \intarray_item:cn { g__fdm_thesis_ ####1 _idx_intarray } { 1 } } =
                      { \intarray_item:cn { g__fdm_thesis_ ####1 _idx_intarray } { 2 } }
                  }
                  {
                    \clist_put_right:Nn \l__fdm_tmpb_clist
                      { { 
                        \cs_if_exist_use:c { __fdm_thesis_ ####1 _font_setter: }
                        \tl_use:c { c__fdu_name_ ####1 _tl } 
                      } }
                    \clist_put_right:Nn \l__fdm_tmpc_clist
                      { { 
                        \__fdm_thesis_multicol_info_box_content_text_output_aux:n { ####1 }
                      } }
                  }
                  {
                    \clist_put_right:Nn \l__fdm_tmpb_clist { \c_space_token } 
                    \clist_put_right:Nn \l__fdm_tmpc_clist { \c_space_token } 
                  }
              }
            }
          \__fdu_get_max_text_width:NN \l__fdm_tmpa_dim \l__fdm_tmpb_clist
          \fparray_gset:Nnn \g__fdm_thesis_info_box_tags_dim_fparray { ##1 } { \dim_to_decimal:n \l__fdm_tmpa_dim }
          \__fdu_get_max_text_width:NN \l__fdm_tmpa_dim \l__fdm_tmpc_clist
          \fparray_gset:Nnn \g__fdm_thesis_info_box_contents_dim_fparray { ##1 } { \dim_to_decimal:n \l__fdm_tmpa_dim }
        }
      \__fdm_thesis_multicol_info_box_determine_tags_dim_aux:N \g__fdm_thesis_info_box_tags_dim_fparray
      \bool_if:NTF \g__fdm_thesis_info_box_content_compact_bool
        {
          \int_step_inline:nn { \g__fdm_thesis_info_box_col_num_int }
            {
              \fparray_gset:Nnn \g__fdm_thesis_info_box_content_line_dim_fparray { ##1 } 
              { 
                \fparray_item:Nn \g__fdm_thesis_info_box_contents_dim_fparray { ##1 } 
                + \dim_to_decimal:n 
                  {
                    \g__fdm_thesis_info_box_content_compact_more_blank_dim
                    + \g__fdm_thesis_info_box_content_compact_more_blank_dim_addition
                  }
              }
            }
        }
        {
          \int_step_inline:nn { \g__fdm_thesis_info_box_col_num_int }
            {
              \__fdm_ifr_tl_init:N  \l__fdm_thesis_this_col_num_tl
              \__fdm_ifr_int_init:N \l__fdm_thesis_next_col_num
              \__fdm_ifr_tl_init:N  \l__fdm_thesis_next_col_num_tl
              \tl_set:Nn  \l__fdm_thesis_this_col_num_tl { \romannumeral ##1 }
              \int_set:Nn \l__fdm_thesis_next_col_num    { ##1 + 1 }
              \tl_set:Nn  \l__fdm_thesis_next_col_num_tl { \romannumeral \l__fdm_thesis_next_col_num }
              \dim_if_exist:cTF { g__fdm_thesis_info_box_col_\tl_use:N \l__fdm_thesis_this_col_num_tl _leftedge_rightmove_dim }
                {
                  \dim_if_exist:cTF { g__fdm_thesis_info_box_col_\tl_use:N \l__fdm_thesis_next_col_num_tl _leftedge_rightmove_dim }
                  {
                    \fparray_gset:Nnn \g__fdm_thesis_info_box_content_line_dim_fparray { ##1 }
                      {
                        \dim_to_decimal:n
                          {
                            \fp_eval:n { 1 / \int_use:N \g__fdm_thesis_info_box_col_num_int } \g__fdm_thesis_info_box_textwidth
                            - \fp_to_dim:n { \fparray_item:Nn \g__fdm_thesis_info_box_tags_dim_fparray { ##1 }}
                            - \g__fdm_thesis_info_box_colon_dim
                            - \dim_use:c { g__fdm_thesis_info_box_col_\tl_use:N \l__fdm_thesis_this_col_num_tl _leftedge_rightmove_dim }
                            - \dim_use:c { g__fdm_thesis_info_box_col_\tl_use:N \l__fdm_thesis_this_col_num_tl _leftedge_rightmove_dim_addition }
                            + \dim_use:c { g__fdm_thesis_info_box_col_\tl_use:N \l__fdm_thesis_next_col_num_tl _leftedge_rightmove_dim }
                            + \dim_use:c { g__fdm_thesis_info_box_col_\tl_use:N \l__fdm_thesis_next_col_num_tl _leftedge_rightmove_dim_addition }
                          }
                      }
                  }
                  {
                    \fparray_gset:Nnn \g__fdm_thesis_info_box_content_line_dim_fparray { ##1 }
                      {
                        \dim_to_decimal:n
                          {
                            \fp_eval:n { 1 / \int_use:N \g__fdm_thesis_info_box_col_num_int } \g__fdm_thesis_info_box_textwidth
                            - \fp_to_dim:n { \fparray_item:Nn \g__fdm_thesis_info_box_tags_dim_fparray { ##1 }}
                            - \g__fdm_thesis_info_box_colon_dim
                            - \dim_use:c { g__fdm_thesis_info_box_col_\tl_use:N \l__fdm_thesis_this_col_num_tl _leftedge_rightmove_dim }
                            - \dim_use:c { g__fdm_thesis_info_box_col_\tl_use:N \l__fdm_thesis_this_col_num_tl _leftedge_rightmove_dim_addition }
                          }
                      }
                  }
                }
                {
                  \int_compare:nNnTF { \g__fdm_thesis_info_box_col_num_int } = { 1 }
                    {
                      \fparray_gset:Nnn \g__fdm_thesis_info_box_content_line_dim_fparray { ##1 }
                        {
                          \dim_to_decimal:n
                            {
                              \fp_eval:n { 1 / \int_use:N \g__fdm_thesis_info_box_col_num_int } \g__fdm_thesis_info_box_textwidth
                              - \fp_to_dim:n { \fparray_item:Nn \g__fdm_thesis_info_box_tags_dim_fparray { ##1 } }
                              - \g__fdm_thesis_info_box_colon_dim
                            }
                        }
                    }
                    {
                      \fparray_gset:Nnn \g__fdm_thesis_info_box_content_line_dim_fparray { ##1 }
                        {
                          \dim_to_decimal:n
                            {
                              \fp_eval:n { 1 / \int_use:N \g__fdm_thesis_info_box_col_num_int } \g__fdm_thesis_info_box_textwidth
                              - \fp_to_dim:n { \fparray_item:Nn \g__fdm_thesis_info_box_tags_dim_fparray { ##1 } }
                              - \g__fdm_thesis_info_box_colon_dim
                              + \g__fdm_thesis_info_box_col_ii_leftedge_rightmove_dim
                              + \g__fdm_thesis_info_box_col_ii_leftedge_rightmove_dim_addition
                            }
                        }
                    }
                }
            }
        }
    \group_end:
  }
\cs_new:Nn \__fdm_thesis_multicol_info_box_row_output_aux:N
  % \l__fdu_tmpa_tl % [#1] Input
  {
    \group_begin:
      \__fdm_ifr_clist_init:N \l__fdm_tmpa_clist
      \clist_set_eq:NN \l__fdm_tmpa_clist #1
      \__fdm_ifr_int_init:N \l__fdm_tmpa_int % Column Index Start
      \__fdm_ifr_int_init:N \l__fdm_tmpc_int % Column Index Now At
      \int_incr:N           \l__fdm_tmpa_int % Initial at One
      \int_incr:N           \l__fdm_tmpc_int % Initial at One
      \bool_until_do:nn { \clist_if_empty_p:N \l__fdm_tmpa_clist }
        {
          \clist_pop:NN \l__fdm_tmpa_clist \l__fdm_tmpa_tl
          \int_compare:nNnF { \l__fdm_tmpc_int } < { \l__fdm_tmpa_int }
            {
              \tl_if_in:NnTF \l__fdm_tmpa_tl { \c_space_token } 
                { 
                  \__fdu_center_box:nn
                    {
                      \fp_to_dim:n { \fparray_item:Nn \g__fdm_thesis_info_box_tags_dim_fparray { \l__fdm_tmpa_int } }
                      + \g__fdm_thesis_info_box_colon_dim 
                      + \fp_to_dim:n { \fparray_item:Nn \g__fdm_thesis_info_box_content_line_dim_fparray { \l__fdm_tmpa_int } }
                    }{}
                  \int_incr:N \l__fdm_tmpa_int
                }
                {
                  \__fdm_thesis_onecolumn_info_box_tag_output_aux:Vn \l__fdm_tmpa_tl
                    { \fp_to_dim:n { \fparray_item:Nn \g__fdm_thesis_info_box_tags_dim_fparray { \l__fdm_tmpa_int } } }
                  \__fdm_thesis_multicol_info_box_content_output_aux:N \l__fdm_tmpa_tl
                  \int_set:Nn \l__fdm_tmpa_int { 1 + \intarray_item:cn { g__fdm_thesis_\tl_use:N \l__fdm_tmpa_tl _idx_intarray } { 2 } }
                }
            }
          \int_incr:N \l__fdm_tmpc_int
        }
    \group_end:
  }
\cs_new:Nn \__fdm_thesis_multicol_info_box_content_output_aux:N
  % \l__fdm_tmpa_tl  % This Index TL % [#1] Input
  {
    \group_begin:
      \__fdu_get_text_width:cn
        { g__fdm_thesis_ \tl_use:N #1 _content_left_blank_dim }
        { \__fdm_thesis_multicol_info_box_content_text_output_aux:n { \tl_use:N #1 } }
      \__fdm_ifr_dim_init:N \l__fdm_tmpa_dim
      \int_step_inline:nnn 
        { \intarray_item:cn { g__fdm_thesis_\tl_use:N #1 _idx_intarray } { 1 } }
        { \intarray_item:cn { g__fdm_thesis_\tl_use:N #1 _idx_intarray } { 2 } }
        {
          \dim_set:Nn \l__fdm_tmpa_dim
            {
              \l__fdm_tmpa_dim
              + \fp_to_dim:n { \fparray_item:Nn \g__fdm_thesis_info_box_content_line_dim_fparray { ##1 } } 
            }
          \int_compare:nNnT { ##1 } < { \intarray_item:cn { g__fdm_thesis_\tl_use:N #1 _idx_intarray } { 2 } }
            {
              \dim_set:Nn \l__fdm_tmpa_dim
                {
                  \l__fdm_tmpa_dim
                  + \fp_to_dim:n { \fparray_item:Nn \g__fdm_thesis_info_box_tags_dim_fparray { ##1 + 1 } } 
                  + \g__fdm_thesis_info_box_colon_dim
                }
            }
        }
      \dim_compare:nNnTF { \l__fdm_tmpa_dim } < { \dim_use:c { g__fdm_thesis_ \tl_use:N #1 _content_left_blank_dim } }
        {
          \parbox [ t ] { \l__fdm_tmpa_dim }
            { \__fdm_thesis_multicol_info_box_content_text_output_aux:n { \tl_use:N #1 } }
          \skip_vertical:n 
            { 
              \g__fdm_thesis_info_box_multiline_content_line_skip_dim
              + \g__fdm_thesis_info_box_multiline_content_line_skip_dim_addition
            }
        }
        {
          \dim_gset:cn { g__fdm_thesis_ \tl_use:N #1 _content_left_blank_dim }
            {
              ( 
                \l__fdm_tmpa_dim
                - \dim_use:c { g__fdm_thesis_ \tl_use:N #1 _content_left_blank_dim }
              ) / 2
            }
          \hbox_to_wd:nn { \dim_use:N \l__fdm_tmpa_dim }
            {
              \hspace{
                \dim_eval:n
                  {
                    \dim_use:c { g__fdm_thesis_ \tl_use:N #1 _content_line_left_space_dim }
                    + \dim_use:c { g__fdm_thesis_ \tl_use:N #1 _content_line_left_space_dim_addition }
                  }
              }
              {
                \cs_if_exist_use:c { __fdm_thesis_ \tl_use:N #1 _content_font_setter: }
                \cs_if_exist_use:c { __fdm_thesis_ \tl_use:N #1 _content_line_font_env_setter:n }
                  {
                    \bool_if:cTF { g__fdm_thesis_ \tl_use:N #1 _content_flushleft_bool }
                      { 
                        \hspace{
                          \dim_use:c { g__fdm_thesis_ \tl_use:N #1 _content_left_blank_dim_addition }
                        }
                        \__fdm_thesis_multicol_info_box_content_text_output_aux:n { \tl_use:N #1 } 
                        \hspace{
                          \dim_eval:n
                            {
                                \dim_use:c { g__fdm_thesis_ \tl_use:N #1 _content_left_blank_dim } 
                              - \dim_use:c { g__fdm_thesis_ \tl_use:N #1 _content_left_blank_dim_addition }
                              + \dim_use:c { g__fdm_thesis_ \tl_use:N #1 _content_left_blank_dim } 
                              - \dim_use:c { g__fdm_thesis_ \tl_use:N #1 _content_line_left_space_dim }
                              - \dim_use:c { g__fdm_thesis_ \tl_use:N #1 _content_line_left_space_dim_addition }
                              - \dim_use:c { g__fdm_thesis_ \tl_use:N #1 _content_line_right_space_dim }
                              - \dim_use:c { g__fdm_thesis_ \tl_use:N #1 _content_line_right_space_dim_addition }
                            }
                        }
                      }
                      {
                        \hspace{
                          \dim_eval:n
                            {
                              \dim_use:c { g__fdm_thesis_ \tl_use:N #1 _content_left_blank_dim } 
                              + \dim_use:c { g__fdm_thesis_ \tl_use:N #1 _content_left_blank_dim_addition }
                              - \dim_use:c { g__fdm_thesis_ \tl_use:N #1 _content_line_left_space_dim }
                              - \dim_use:c { g__fdm_thesis_ \tl_use:N #1 _content_line_left_space_dim_addition }
                            }
                        }
                        \__fdm_thesis_multicol_info_box_content_text_output_aux:n { \tl_use:N #1 }
                        \hspace{
                          \dim_eval:n
                            {
                              \dim_use:c { g__fdm_thesis_ \tl_use:N #1 _content_left_blank_dim } 
                              - \dim_use:c { g__fdm_thesis_ \tl_use:N #1 _content_left_blank_dim_addition }
                              - \dim_use:c { g__fdm_thesis_ \tl_use:N #1 _content_line_right_space_dim }
                              - \dim_use:c { g__fdm_thesis_ \tl_use:N #1 _content_line_right_space_dim_addition }
                            }
                        }
                      }
                  }
              }
              \hspace{
                \dim_eval:n
                  {
                    \dim_use:c { g__fdm_thesis_ \tl_use:N #1 _content_line_right_space_dim }
                    + \dim_use:c { g__fdm_thesis_ \tl_use:N #1 _content_line_right_space_dim_addition }
                  }
              }
            }
        }
    \group_end:
  }
\cs_new_protected:Nn \__fdm_thesis_multicol_info_box_content_text_output_aux:n
  { {
    \raggedright \raggedbottom
    \cs_if_exist_use:c { __fdm_thesis_ #1 _content_font_setter: }
    \cs_if_exist_use:cF { __fdm_thesis_info_box_ #1 _content_aux: }
      { \tl_use:c { l__fdu_info_ #1 _tl } }
  } }

%%*********************************************************************************************************************
%%**************************************************** Edition 2019 ***************************************************
%%*********************************************************************************************************************
\__fdm_thesis_new_edition:nn { 2019 } 
  {
    \int_compare:nNnF { 2019 } > { \g__fdm_thesis_edition_int }
      {
        % Only Bachelor
        \int_compare:nT { \g__fdu_thesis_type_int == 3} 
          {
            \keys_set:nn { fdu / FDUMathThesisEditor }
              {
                declareFont = { 35pt },
                editionYear = { 2019 },
                editionType = { bachelor },
                declareCoverIPart = { logo, type, emblem, info },
                declareCoverIInstance = 
                  {
                    format             = \__fdu_line_spread:N \c__fdu_line_spread_fp,
                    logo   / content   = \__fdu_cover_logo:,
                    type   / content   = \__fdu_cover_type:,
                    emblem / content   = { \resizebox{5cm}{!}{ \__fdulogo_tikz:nx { \fdulogo@emblem@new } { \c__fdulogo_default_arg_tl } } },
                    info   / content   = \__fdu_cover_info:,
                    type   / format    = \zihao{35pt}\sffamily,
                    logo   / align     = center,
                    type   / align     = center,
                    emblem / align     = center,
                    info   / align     = left,
                    emblem / bottom-skip = 50pt,
                  },
                declareCoverIObject = 
                  {
                    { title, author, student_id, department, major, supervisor, supervisor_title, supervisor_unit, date },
                    { \zihao{-3}\sffamily },
                    { \zihao{-3}\rmfamily },
                    { \CJKunderline }
                  },
                declareCoverIInfoBoxArrange = 
                  { 
                    { title,            title            }, 
                    { author,           student_id       }, 
                    { department,       department       },
                    { major,            major            }, 
                    { supervisor,       supervisor_title }, 
                    { supervisor_unit,  supervisor_unit  }, 
                    { date,             date             }  
                  },
                date         / gemptyContentLineFontEnvSetter,
                author       / gsetContentLineRightSpaceAdder       = { 5pt },
                supervisor   / gsetContentLineRightSpaceAdder       = { 5pt }, 
                gsetDimAdder / info_box_col_ii_leftedge_rightmove   = { 2em },
                gsetDimAdder / info_box_multiline_content_line_skip = { 0.3 \baselineskip }, % (1.3 - 1)
                createCoverINewObjectInterface = 
                  {
                    { supervisor-title, supervisor_title, 职称    },
                    { supervisor-unit,  supervisor_unit,  单位    },
                    { title,            title,            论文题目 },
                    { title-breakline,  title_breakline,  论文题目 },
                    { keywords-english, keywords_english, Keywords}
                  },
                title / defineContentAux =
                  {
                    \__fdm_thesis_title_content_line_font_env_setter:n
                      { \exp_not:N \l__fdu_info_title_tl \hfill }
                    \__fdm_ifr_newline:
                  },
                date / defineContentAux =
                  {
                    { \cs_if_exist_use:N \__fdm_thesis_date_font_setter: \exp_not:N \l__fdu_info_date_year_tl }
                    { \cs_if_exist_use:N \__fdm_thesis_date_font_setter: 年 }
                    \__fdu_center_box:nn { 2\exp_not:N \g__fdm_thesis_info_box_colon_dim }
                      { \cs_if_exist_use:N \__fdm_thesis_date_content_font_setter: \exp_not:N \l__fdu_info_date_month_tl }
                    { \cs_if_exist_use:N \__fdm_thesis_date_font_setter: 月 }
                    \__fdu_center_box:nn { 2\exp_not:N \g__fdm_thesis_info_box_colon_dim }
                      { \cs_if_exist_use:N \__fdm_thesis_date_content_font_setter: \exp_not:N \l__fdu_info_date_day_tl }
                    { \cs_if_exist_use:N \__fdm_thesis_date_font_setter: 日 }
                  },
                contentAux = 
                  {
                    \str_case_e:nn { \g__fdu_cjk_fontset_tl } {
                      { mac }    { \__fdm_ifr_gset_dim_adder:nn { thesis_type_box } { 0.5em } }
                      { fandol } { \__fdm_ifr_gset_dim_adder:nn { thesis_type_box } { 0.8em } }
                    }
                  }
              }
            \geometry{a4paper,hmargin={2.54cm,2.54cm},vmargin={3.17cm,3.17cm}}
            \usepackage[pdfborder={0 0 0},colorlinks=true,linkcolor=blue,CJKbookmarks=true]{hyperref}
            \@openrightfalse
            \let\cleardoublepage\clearpage
            \fdu_hyperref_setup:n
              {
                linkcolor = blue,
                citecolor = blue,
              }
            % \RenewDocumentCommand \headrulewidth { } { 0 pt }
            \renewcommand{\@pnumwidth}{2.5em}
            \renewcommand{\@tocrmarg}{3em}
            \RenewDocumentCommand \makecoveriii { } { }
            \ctexset{
              chapter = {
                nameformat={\zihao{3}\sffamily},%
                titleformat={\zihao{3}\sffamily},%
                beforeskip={0.8cm},afterskip={1.2cm}
              },
              section = {
                nameformat={\zihao{-3}\sffamily\centering},%
                titleformat={\zihao{-3}\sffamily\centering},%
                name={第~,~节},number={\arabic{section}},%
                beforeskip={1.5\baselineskip},afterskip={\baselineskip}
              },
              subsection = {
                format={\zihao{-4}\sffamily\raggedright},%
                titleformat={\zihao{-4}\sffamily\raggedright},%
                number={\arabic{section}.\arabic{subsection}.},%
                beforeskip={0.4cm},afterskip={0.4cm}
              }
            }
            \rendertitle:
            \RenewDocumentEnvironment { titlepage } { }
            {%
              \if@twocolumn
                \@restonecoltrue\onecolumn
              \else
                \@restonecolfalse\newpage
              \fi
              \thispagestyle{empty}%
            }
            {%
              \if@restonecol
                \twocolumn
              \else
                \newpage
              \fi
            }
          \RenewDocumentEnvironment { abstract* } { }
            { 
              \tl_gset:Nn \c__fdu_name_abstract_en_tl { {\fontfamily{lmr}\selectfont\textbf{Abstract}} }
              \__fdu_abstract_en_begin: 
            } 
            { 
              \clist_gset_eq:NN \l__fdu_info_keywords_en_clist \l__fdu_info_keywords_english_tl
              \__fdu_abstract_en_end:   
            }
          \RenewDocumentCommand \frontmatter { } { \renewcommand{\thepage}{} }
          \RenewDocumentCommand \mainmatter { } {
            \clearpage
            \renewcommand{\thepage}{\arabic{page}}
            \setcounter{page}{1}
            \pagestyle{plain}
          }
          \RenewDocumentCommand \backmatter { } { \renewcommand{\thepage}{} }
          \NewDocumentEnvironment { acknowledgement } { } { \__fdu_chapter:n { 致　谢 } } { \clearpage }
          }
      }
  }
\cs_new_protected:Nn \rendertitle: {
  \title{\sffamily \tl_use:N\l__fdu_info_title_breakline_tl}
  \author{
    \tl_use:N\l__fdu_info_author_tl\\ \quad\\
    \clist_gset:Nn \l__fdm_title_page_tags_clist { student_id, major, supervisor }
    \__fdm_ifr_clist_init:N \l__fdm_title_page_clist
    \clist_map_inline:Nn \l__fdm_title_page_tags_clist {
      \clist_put_right:Nn \l__fdm_title_page_clist {
        { \cs_if_exist_use:c { __fdm_thesis_ ####1 _font_setter: } \tl_use:c { c__fdu_name_ ####1 _tl } }
        { \cs_if_exist_use:c { __fdm_thesis_colon_font_setter: } \c__fdu_fwid_colon_tl }
      }
    }
    \__fdm_ifr_clist_init:N \l__fdm_title_page_value_clist
    \clist_map_inline:Nn \l__fdm_title_page_tags_clist { \clist_put_right:Nn \l__fdm_title_page_value_clist 
      { \tl_use:c { l__fdu_info_ ####1 _tl } } 
    }
    \__fdu_get_max_text_width:NN \l__fdm_title_page_info_width \l__fdm_title_page_clist
    \__fdu_get_max_text_width:NN \l__fdm_title_page_info_value_width \l__fdm_title_page_value_clist
    \clist_map_inline:Nn \l__fdm_title_page_tags_clist {
      \__fdm_thesis_onecolumn_info_box_tag_output_aux:nn { ####1 }{ \l__fdm_title_page_info_width }\quad
      \hbox_to_wd:nn { \l__fdm_title_page_info_value_width }{ 
        \hfil \tl_use:c { l__fdu_info_ ####1 _tl } \hfil
      }\\
    }
    \quad
  }
  \date{}
}
%% End of file `fdumath-fduthesis-patch'.

\RequirePackage{anyfontsize}
\RequirePackage{multicol}
\RequirePackage{framed}
\RequirePackage{paralist}
	\let\itemize\compactitem
	\let\enditemize\endcompactitem
	\let\enumerate\compactenum
	\let\endenumerate\endcompactenum
	\let\description\compactdesc
	\let\enddescription\endcompactdesc
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{amsthm} % 
	% \theoremstyle{plain/definition/remark}
\RequirePackage{bm} % 
\RequirePackage{extarrows}
\RequirePackage{mathrsfs}
\RequirePackage{esint} % 
\RequirePackage{nicematrix} % 
\RequirePackage{cancel} % 
\allowdisplaybreaks[4] % 
\RequirePackage{siunitx} % 
%
\let\kaishu\fdu@kai
\let\kaiti\fdu@kai
\let\heiti\bfseries
\renewcommand{\c__fdu_fwid_colon_tl}{：}
\renewcommand{\c__fdu_fwid_semicolon_tl}{；}
\RequirePackage{pdfpages} %
\endinput