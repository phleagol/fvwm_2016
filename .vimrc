" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype plugin indent on

" Enable syntax highlighting
syntax on

" Syntax highlighting for *.md files is no markdown, not modula2
au BufRead,BufNewFile *.md set filetype=markdown

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
" set hidden

" Disable swap files and backups - annoying
set nobackup
set nowritebackup
set noswapfile

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline

set modeline
set scrolloff=6



"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
"set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=2
"set tabstop=2


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Use space as your Leader key.
" http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
" :let mapleader = " "
let mapleader = "\<space>"

" Copy & paste to system clipboard with <Space>p and <Space>y
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" If you want to keep the cursor in place when you join lines with J,
" you can do this, dropping a mark before the operation to which you
" return afterwards: http://blog.sanctum.geek.nz/vim-annoyances/
nnoremap J mzJ`z

" center the window automatically around the cursor after jumping to
" a location with motions like n (next search pattern occurrence)
" or } (end of next paragraph)
nnoremap n nzz
nnoremap } }zz

" Disable nuisance keys that are default standards in normal mode.
" F1 for help; :help is generally more useful for the experienced user
" Q to start ex mode; annoying when you intended to start recording a macro with q
" K to bring up a man page for the word under the cursor
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop>

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>


" http://statico.github.io/vim.html
" If I hit j I would expect the cursor to move down a single row on
" the screen, just like every other text editing area in the world.
" The following does just that:

nmap    j     gj
nmap    k     gk
nmap <C-Up>   gj
nmap <C-Down> gk
" ^^^ Not working yet
"
" http://statico.github.io/vim.html
" make searches case-insensitive except when you include upper-case characters

:set ignorecase
:set smartcase


" highlight the current search. Also set key-binding to clear hilight.
" :set hlsearch
" :nmap \q :nohlsearch<CR>

" http://statico.github.io/vim.html
" two keys to cycle between all open buffers

:nmap <C-n> :bnext<CR>
:nmap <C-p> :bprev<CR>

" Up to section : Yes, My Editor Does That

:setlocal spell spelllang=en_nz
:set nospell



" Folding {{{1

function! MyFoldText() " {{{2
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}

set foldtext=MyFoldText()
set foldmethod=marker

"------------------------------------------------------------

" GnuPG Extensions {{{1

" Set extra file options.
augroup GnuPGExtra
    autocmd BufReadCmd,FileReadCmd *.\(gpg\|asc\|pgp\) call SetGPGOptions()
augroup END

function SetGPGOptions()
" Fold at markers.
    set foldmethod=marker
" Automatically close all folds.
    set foldclose=all
" Only open folds with insert commands.
    set foldopen=insert
endfunction


"}}}


" vim-plug {{{1

call plug#begin('~/.vim/plugged')

Plug 'whatyouhide/vim-gotham'

Plug 'jamessan/vim-gnupg'

call plug#end()

"}}}

" Colorscheme {{{1

" Vim uses bright background by default. Set to dark.
set background=dark

" https://github.com/chriskempson/base16-vim
" let g:base16_shell_path='/home/phleagol/.config/base16-shell/'
" let base16colorspace=256
" colorscheme base16-default

:let g:zenburn_high_Contrast=1
colors zenburn

" colorscheme gotham

"}}}

