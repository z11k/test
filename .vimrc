" Maintainer: Jan Jurak
" Version: 1.2

set nocompatible "use Vim settings, rather then Vi settings.

if filereadable(expand("~/.vimrc.plug"))
	source ~/.vimrc.plug
endif

let mapleader = ","

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
	finish
endif
func! Source(file)
  if filereadable(a:file)
	exec "source " . fnameescape(a:file)
  endif
endfun
com! -nargs=1 -complete=file Source call Source(<f-args>)

if has("vms")
	set nobackup "do not keep a backup file, use versions instead
else
	set backup "keep a backup file (restore to previous version)
	"if has('persistent_undo')
	"	set undofile    " keep an undo file (undo changes after closing)
	"endif
endif

silent fun! OSX()
	return has('macunix')
endfun
silent fun! UNIX()
	return has('unix') && !has('macunix') && !has('win32unix')
endfun
silent fun! WINDOWS()
	return  (has('win16') || has('win32') || has('win64'))
endfun

if &t_Co > 2 || has("gui_running")
	set hlsearch "switch on highlighting the last used search pattern.
endif

set directory=~/.vim/tmp,/tmp
set swapfile
set nobackup "do not keep backups after close
set writebackup "keep a backup while working
set backupcopy=yes "keep attributes of original file
set noautowrite "do not Automatically :write on :quit/next/prev
set noautowriteall
set autoread
set nomodeline "disable modeline for prevent security exploits
set tabpagemax=10 "open 10 tabs max
set backspace=eol,start,indent "backspace deletes like most programs in ins mode
set ruler "always show cursor position
set showcmd	"display incomplete commands
set history=50 "lots of command line history
set noexrc "enable per-directory .vimrc files
set hidden "this allow switching buffers without writing to disk. You can't use undo without
set nowrap
set splitbelow "opening splits down rather than up
set splitright "opening splits right rather than left
set ttyfast
set ttimeout
set ttimeoutlen=100 "fix esc timeout
set nonumber "do not show line numbers by default
set complete-=i
set lazyredraw "don't redraw while executing macros for good performance config
set grepprg=grep\ -nH\ $*
set formatoptions=c,q,r,t
set go+=a "visual selection automatically copied to the clipboard
set nrformats-=octal
set display+=lastline
set scrolloff=1 "minimum lines to keep above and below cursor
set sidescroll=1
set showmatch "show matching brackets.
set noignorecase "do case insensitive matching
set smartcase "do smart case matching. Only ignore case when we type lower case when searching
set wrapscan "wrap searches
set incsearch "do incremental searching
set smarttab "indent 'shiftwidth' on beginning of lines
set smartindent
set noexpandtab "note if you don't set expandtab, vi will
set copyindent
set preserveindent
set softtabstop=0
set tabstop=2 "number of visual spaces per TAB; KEEP THIS!
"set softtabstop=2 "number of spaces in tab when editing
set shiftwidth=2 "shiftwidth same as softtabstop
set shiftround
set nolinebreak "don't wrap words by default
set textwidth=0 "don't wrap lines by default
set fileformats=unix,dos "prefer Unix over Windows over OS 9 formats
set laststatus=2 "always display the status line
set statusline=%M%h%y\ %t\ \ [%{getcwd()}]\ %F\ %p%%\ %l/%L\ %=[%{&ff},%{&ft}]\ [a=\%03.3b]\ [h=\%02.2B]\ [%l,\ %v]\ %p%%
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set matchpairs+=<:> "match < >, to be used with %
set wildmenu "show menu with tab-completion and interactive Vim-menus
set wildmode=list:longest:full
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
set paste
set textwidth=80
set nocursorline "do not highlight current line

if !WINDOWS()
	if "" == &shell
		if executable("/usr/local/bin/zsh")
			set shell=/usr/local/bin/zsh
			set shellcmdflag=-i
		elseif executable("/bin/zsh")
			set shell=/bin/zsh
			set shellcmdflag=-i
		elseif executable("/bin/sh")
			set shell=/bin/sh
		endif
	endif
else
	set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
	lang C
	set iskeyword=48-57,65-90,97-122,_,161,163,166,172,177,179,182,188,191,198,202,209,211,230,234,241,243,143,156,159,165,175,185
	if has('unnamedplus')
		set clipboard=unnamedplus
	else
		set clipboard=unnamed
	endif
endif

"if &listchars ==# 'eol:$'
"	set listchars=tab:>.,trail:.,extends:>,precedes:<,nbsp:+
"	if !WINDOWS() && (&termencoding ==# "utf-8" || &encoding ==# 'utf-8')
"		let &listchars = "tab:\u21e5,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
"	endif
"endif

if has("autocmd") "only do this part when compiled with support for autocommands.
	aug vimrcEx "put these in an autocmd group, so that we can delete them easily
	au!
	au FileType text setlocal textwidth=78 "for all text files set 'textwidth' to 78 characters
	aug END
	filetype plugin indent on
	set nocp
	au VimEnter * nohlsearch
	au FileType mail set tw=70
	au FileType * set tabstop=2|set shiftwidth=2|set noexpandtab|set noautoindent
	fun! ResCur()
		if line("'\"") <= line("$")
			normal! g`"
			return 1
		endif
	endfun
	if !exists('g:no_restore_cursor')
		aug resCur
			au!
			au BufWinEnter * call ResCur()
		aug END
	endif
	au BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
else
	set autoindent "always set autoindenting on
endif

if has("gui_runnig")
	set mouse=a
else
	set mouse=v
endif

if (&t_Co >= 256) || has("gui_running") "color Scheme
	if filereadable(expand("$VIMRUNTIME/colors/lucius.vim")) ||
			\ filereadable(expand("$HOME/.vim/colors/lucius.vim"))
		let g:lucius_style='light'
		let g:lucius_contrast='normal'
		let g:lucius_contrast_bg='normal'
		let g:lucius_no_term_bg='1'
		colorscheme lucius
	endif
	set nocursorcolumn
	if exists('+colorcolumn') "oznaceni sirky stranky 80-tym sloupcem
		set colorcolumn=+1
	elseif has("autocmd")
		au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%80v.\+', -1)
	endif
else
	set nocursorcolumn
endif

if has('syntax') && !exists('g:syntax_on') && (&t_Co > 2 || has("gui_running"))
	syntax on
	set hlsearch
	set incsearch
endif

if &term=="xterm"
	set t_Co=8
	set t_Sb=^[[4%dm
	set t_Sf=^[[3%dm
endif

if &t_Co == 8 && $TERM !~# '^linux'
	set t_Co=16	" Allow color schemes to do bright colors without forcing bold
endif

if has("cscope")
	if filereadable("/usr/bin/cscope")
		set csprg=/usr/bin/cscope
	elseif filereadable("/usr/local/bin/cscope")
		set csprg=/usr/local/bin/cscope
	endif
	set csto=0
	set cst
	set nocsverb
	if filereadable("cscope.out")
		cs add $PWD/cscope.out
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif

fun! InitializeDirectories()
	let parent = $HOME
	let prefix = 'vim'
	let dir_list = { 'backupdir': 'tmp' , 'undodir': 'tmp', 'viewdir': 'tmp' }
	if exists('g:consolidated_directory')
		let common_dir = g:consolidated_directory . prefix
	else
		let common_dir = parent . '/.' . prefix . '/'
	endif
	if exists("*mkdir")
		if !isdirectory(common_dir)
			call mkdir(common_dir)
		endif
	endif
	for [settings, subdir] in items(dir_list)
		let dir = common_dir . subdir . '/'
		if exists("*mkdir")
			if !isdirectory(dir)
				call mkdir(dir)
			endif
		endif
		if !isdirectory(dir)
			echo "Warning: Unable to create backup directory: " . dir
		else
			let dir = substitute(dir, " ", "\\\\ ", "g")
			exec "set " . settings . "=" . dir
		endif
	endfor
endfun
call InitializeDirectories()

fun! GuiTabLabel()
	let label = ''
	let bufnrlist = tabpagebuflist(v:lnum)
	for bufnr in bufnrlist
		if getbufvar(bufnr, "&modified")
			let label = '+'
			break
		endif
	endfor
	let label .= v:lnum.': '
	let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
	if name == ''
		if &buftype=='quickfix'
			let name = '[Quickfix List]'
		else
			let name = '[No Name]'
		endif
	else
		let name = fnamemodify(name,":t")
	endif
	let label .= name
	let wincount = tabpagewinnr(v:lnum, '$')
	return label . '  [' . wincount . ']'
endfun
set guitablabel=%{GuiTabLabel()}

fun! MapCR()
	nnoremap <silent><cr> :nohlsearch<cr>
endfun
call MapCR()

fun! ToggleBackground()
	if (g:lucius_style=="dark")
		LuciusLight
	elseif (g:lucius_style=="light")
		LuciusDarkLowContrast
	endif
endfun
nnoremap <F6> :call ToggleBackground()<CR>
inoremap <F6> <ESC>:call ToggleBackground()<CR>
vnoremap <F6> <ESC>:call ToggleBackground()<CR>

fun ShowSpaces(...)
	let @/='\v(\s+$)|( +\ze\t)'
	let oldhlsearch=&hlsearch
	if !a:0
		let &hlsearch=!&hlsearch
	else
		let &hlsearch=a:1
	end
	return oldhlsearch
endfun
command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
nnoremap <F12> :ShowSpaces 1<CR>

fun TrimSpaces() range
	let oldhlsearch=ShowSpaces(1)
	execute a:firstline.",".a:lastline."substitute ///gec"
	let &hlsearch=oldhlsearch
endfun
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <S-F12> m`:TrimSpaces<CR>``
vnoremap <S-F12> :TrimSpaces<CR>

" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
function! Indenting(indent, what, cols)
	let spccol = repeat(' ', a:cols)
	let result = substitute(a:indent, spccol, '\t', 'g')
	let result = substitute(result, ' \+\ze\t', '', 'g')
	if a:what == 1
		let result = substitute(result, '\t', spccol, 'g')
	endif
	return result
endfunction

" Convert whitespace used for indenting (before first non-whitespace).
" what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
" cols = string with number of columns per tab, or empty to use 'tabstop'.
" The cursor position is restored, but the cursor will be in a different
" column when the number of characters in the indent of the line is changed.
function! IndentConvert(line1, line2, what, cols)
	let savepos = getpos('.')
	let cols = empty(a:cols) ? &tabstop : a:cols
	execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
	call histdel('search', -1)
	call setpos('.', savepos)
endfunction
command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)
command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g

"syn clear Repeat | g/^\(.*\)\n\ze\%(.*\n\)*\1$/exe 'syn match Repeat "^' . escape(getline('.'), '".\^$*[]') . '$"' | nohlsearch
function! HighlightRepeats() range
  let lineCounts = {}
  let lineNum = a:firstline
  while lineNum <= a:lastline
    let lineText = getline(lineNum)
    if lineText != ""
      let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
    endif
    let lineNum = lineNum + 1
  endwhile
  exe 'syn clear Repeat'
  for lineText in keys(lineCounts)
    if lineCounts[lineText] >= 2
      exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
    endif
  endfor
endfunction

" Do not use Ex mode, use Q for formatting
map Q gq

" Exit
nmap <F4> :q<CR>

" Help key annoyance
"inoremap <F1> <ESC>
"nnoremap <F1> <ESC>
"vnoremap <F1> <ESC>

" Toggle paste mode on and off
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Open next buffer
nmap <F3> :bn<cr>
imap <F3> <ESC>:bn<cr>

" Redo
map <silent> r :red<CR>

" New tab
map <silent> <leader>t <ESC>:tabnew<CR>

" Fix keycodes
"map ^[[1~ <Home>
"map ^[[4~ <End>
"imap ^[[1~ <Home>
"imap ^[[4~ <End>

" No macro recorder
nnoremap q <NOP>

fun! SecVim()
	set secure
endfun
call SecVim()
