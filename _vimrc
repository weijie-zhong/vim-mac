execute pathogen#infect()
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

filetype plugin on
syntax on
filetype plugin indent on

"�ַ����ã���������ʾ�й�
set ambiwidth=double

"�����ޱ����ļ�
set writebackup
set nobackup

"��ʾ�к�
set nu!

"�������⼰�﷨����
set background=light
colorscheme molokai
syntax enable
syntax on
if has("gui_running")
	set guifont=Monaco:h14
	if has("gui_gtk2")
		set guifont=Monaco\ 12, Monospace\ 12
	endif
	set guioptions-=T
	set t_Co=256
endif

"����������
set list
set listchars=tab:\|\ 

"��������
set encoding=utf8

"�趨�ļ������Ŀ¼Ϊ��ǰĿ¼
set autochdir

"���ò��Զ����У����·��ĺ��������
set wrap
set guioptions+=b

"TagList��������
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

"Fortran��������
let fortran_have_tabs=1
let fortran_fold=1

"���ô����۵�
set foldmethod=syntax
set foldlevelstart=99

"��NERD_commenter�����ã�Ctrl+hΪ����ע��/ȡ��ע��
map <c-h> ,c<space>

"ʹ��NeoComplete
let g:NeoComplCache_EnableAtStartup = 1 

"���ùؼ��ִʿ�λ�ã�����OmniComplete
set dictionary+=X:\Project\tags
set dictionary+=X:\Project\Dict.txt
let g:SuperTabDefaultCompletionType = "<c-x><c-k>"


"���ù��Tags
set tags+=X:\Project\tags

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

"�ڶ�buffer����µĹر�
map fc <Esc>:call CleanClose(1)<CR>
map fq <Esc>:call CleanClose(0)<CR>
function! CleanClose(tosave)
if (a:tosave == 1)
    w!
endif
let todelbufNr = bufnr("%")
let newbufNr = bufnr("#")
if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
    exe "b!".newbufNr
else
    bnext
endif
if (bufnr("%") == todelbufNr)
    new
endif
exe "bd!".todelbufNr
endfunction






set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

  " REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'


let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf = 'pdflatex --synctex=1 -src-specials -interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf = 'Skim'

let g:Tex_CompileRule_pdf = 'pdflatex --synctex=1 -src-specials -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_MultipleCompileFormats='pdf'
let g:no_atp=1
let g:livepreview_previewer = 'Skim'
nmap <F12> :LLPStartPreview<cr>
autocmd Filetype tex setl updatetime=5

au BufRead *.py inoremap () ()<LEFT>
au BufRead *.py inoremap [] []<LEFT>
au BufRead *.py inoremap {} {}<LEFT>
au BufRead *.py inoremap "" ""<LEFT>

autocmd filetype python scource ~/.vim/ftplugin/python.vim
