" Vapor vim color scheme
" Author:   Andrew Roberts
" URL:      https://github.com/sombreroman55/myvimcolors/
" License:  MIT <https://www.gnu.org/licenses/gpl.html>
"
" Summary:
"
" An A E S T H E T I C color scheme for vim.
"
" The structure of this file owes a great deal to the "gruvbox" color scheme.
"
" Installation:
"
" To install, copy this file into your ~/.vim/colors directory
"
" Usage:
"
" To set it for the current buffer, type 
"       
"       :colorscheme vapor 
" 
" into the current buffer in vim.
"
" To set it permanently, add the line 
"       
"       set colorscheme vapor
"
" to your .vimrc file.

" Supporting code ------------------------------------------------------------
" Initialization: {{{
if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

set background=dark
let g:colors_name="vapor"

" Finish if we are in a terminal lacking 256 color support
if !has("gui_running") && &t_Co <= 255
    finish
endif
" }}}
" Global Settings: {{{
if !exists('g:vapor_bold')
    let g:vapor_bold=1
endif

if !exists('g:vapor_italic')
    if has('gui_running') || $TERM_ITALICS == 'true'
        let g:vapor_italic=1
    else
        let g:vapor_italic=0
    endif
endif

if !exists('g:vapor_undercurl')
    let g:vapor_undercurl=1
endif

if !exists('g:vapor_underline')
    let g:vapor_underline=1
endif

if !exists('g:vapor_inverse')
    let g:vapor_inverse=1
endif

if !exists('g:vapor_guisp_fallback') || index(['fg', 'bg'], g:vapor_guisp_fallback) == -1
    let g:vapor_guisp_fallback='NONE'
endif

if !exists('g:vapor_improved_strings')
    let g:vapor_improved_strings=0
endif

if !exists('g:vapor_improved_warnings')
    let g:vapor_improved_warnings=0
endif

if !exists('g:vapor_termcolors')
    let g:vapor_termcolors=256
endif

if !exists('g:vapor_invert_indent_guides')
    let g:vapor_invert_indent_guides=0
endif

if !exists('g:vapor_contrast_dark')
    let g:vapor_contrast_dark='medium'
endif

if !exists('g:vapor_contrast_light')
    let g:vapor_contrast_light='medium'
endif

let g:is_dark=(&background == 'dark')
    
" }}}
" Palette: {{{

" Setup the palette dictionary
let s:vpcolors = {}

" Fill dictionary with absolute colors
let s:vpcolors.



" }}}
" Setup Emphasis: {{{
let s:bold = 'bold,'
if g:vapor_bold == 0
    let s:bold = ''
endif

let s:italic = 'italic'
if g:vapor_italic == 0
    let s:italic = ''
endif

let s:underline = 'underline'
if g:vapor_underline == 0
    let s:underline = ''
endif

let s:undercurl = 'undercurl'
if g:vapor_undercurl == 0
    let s:undercurl = ''
endif

let s:inverse = 'inverse'
if g:vapor_inverse == 0
    let s:inverse = ''
endif
" }}}
" Setup Colors: {{{
" }}}

" Overload Settings: {{{
" }}}
" Highlighting Function: {{{
function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    " Foreground
    let fg = a:fg

    " Background
    if a:0 >= 1
        let bg = a:1
    else
        let bg = s:none
    endif

    " Emphasis
    if a:0 >= 2 && strlen(a:2)
        let emstr = a:2
    else
        let emstr = 'NONE,'
    endif

    " Special Fallback
    if a:0 >= 3
        if g:vapor_guisp_fallback != 'NONE'
            let fg = a:3
        endif

        " BG Fallback mode should invert highlighting
        if g:vapor_guisp_fallback == 'bg'
            let emstr .= 'inverse,'
        endif
    endif

    let histring = [ 'hi', a:group,
          \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
          \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
          \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
          \ ]

    " Special
    if a:0 >= 3
        call add(histring, 'guisp=' . a:3[0])
    endif

    execute join(histring, ' ')
endfunction
" }}}
" Vapor Hi Groups: {{{
" }}}

" Vanilla colorsceme ---------------------------------------------------------


" TODO: Fill in these specifics after fine-tuning vanilla settings
" Plugin specific ------------------------------------------------------------


" Filetype specific ----------------------------------------------------------


" Functions ------------------------------------------------------------------
" Search Highlighting Cursor: {{{
function! VaporHlsShowCursor()
    call s:HL('Cursor', s:bg0, s:hls_cursor)
endfunction

function! VaporHlsHideCursor()
    call s:HL('Cursor', s:none, s:none, s:inverse)
endfunction
" }}}
