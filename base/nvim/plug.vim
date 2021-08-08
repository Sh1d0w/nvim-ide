if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

if has("nvim")
  Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile', 'branch': 'release'}
  Plug 'antoinemadec/coc-fzf'
  Plug 'itchyny/lightline.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'ryanoasis/vim-devicons'
  Plug 'preservim/nerdcommenter'
  Plug 'voldikss/vim-floaterm'
  Plug 'itchyny/vim-gitbranch'
  Plug 'glepnir/dashboard-nvim'
endif
 
call plug#end()

" get neovim version
let g:neovim_version = matchstr(execute('version'), 'NVIM v\zs[^\n]*')

" Pluging specific configuration
" -------------------------------------------------------

" NerdCommenter
" #######################################################

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Vim Floaterm
" #######################################################

let g:floaterm_keymap_toggle = '<Leader>ft'

let g:floaterm_title = 'Sh1d0w Term: $1/$2'

" Lightline
" #######################################################
"
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

function! LightlineTruncatedFileName()
let l:filePath = expand('%')
    if winwidth(0) > 100
        return l:filePath
    else
        return pathshorten(l:filePath)
    endif
endfunction

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'currentfunction', 'readonly', 'filename', 'cocstatus', 'modified' ] ],
      \   'right': [ ['lineinfo'],
      \              ['gitbranch'],
      \              ['filetype'] ]
      \ },
      \ 'inactive': {
      \   'left': [ ['mode', 'paste'],
      \             ['filename', 'modified'] ]
      \      },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'gitbranch': 'gitbranch#name',
      \   'currentfunction': 'CocCurrentFunction',
      \   'filename': 'LightlineTruncatedFileName',
      \ },
      \ }

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

" Dashboard nvim
" #######################################################

let g:dashboard_default_executive ='fzf'

let g:dashboard_custom_section = {
      \ 'find_history': {
        \ 'description': ['  Recently opened files                 SPC f h'],
        \ 'command': 'History',
      \ },
      \ 'find_word': {
        \ 'description': ['  Find  word                            SPC f d'],
        \ 'command': 'CocFzfList grep'
      \ },
      \ 'find_file': {
        \ 'description': ['  Find  File                            SPC f f'],
        \ 'command': 'CocFzfList files'
      \ }
\ }

let g:dashboard_custom_header = [
\"",
\"       ▄▄        ▄▄ ",
\"     ▄████       ███▄                                            ▄▄ ",
\"   ▄ ▀█████▄     █████                                           ▀▀ ",
\"   ▌ ▀▄██████    █████     ▌ ▄▀▀▄▄   ▄▄▀▀ ▄    ▄ ▀▀▄▄ ▓█▄    ▄█▌▐██ ▐██▄███▄▄▓███▄ ",
\"   ▌    ▀█████▄  █████     ▌     ▐  ▓      █ ▄▀     ▐▌ ██▄  ▄█▌ ▐██ ▐██   ▐██   ▓██ ",
\"   ▌   ▐  ██████ █████     ▌     ▐▌ █▀▀▀▀▀▀▀ █       █  ██ ▐██  ▐██ ▐██   ▐██   ▐██ ",
\"   ▌   ▐   ▀█████▄████     ▌     ▐▌ █        ▀▄      █   ████   ▐██ ▐██   ▐██   ▐██ ",
\"   ▌   ▐    ▀█████▄▀██     ▌     ▐   ▀▀▄▄▄▀▀   ▀▄▄▄▀▀    ▐▀▀    ▐▀▀ ▐▀▀   ▐▀▀   ▐▀▀ ",
\"   ▀   ▐      ▀█████ █ ",
\"     ▀▄▐       ▀████ ",
\"       ▀         ▀ ",
\"",
\"                                                             version: ". g:neovim_version ."",
\"",
\"",
\"",
\"",
\"",
\ ]

"headercolor
hi! dashboardHeader guifg=#c3e88d
hi! dashboardCenter guifg=#89ddff
hi! dashboardShortcut guifg=#c792ea
hi! dashboardFooter guifg=#676E95

autocmd VimEnter * Dashboard
