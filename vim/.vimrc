" BEFORE ALL
""""""""""""
" Install:
" - vim-plug
" - a powerline font (at least) like Hack or ryanoasis/nerd-fonts for OSX via brew
" - run :PlugInstall
" - (optional) source vimrc file: :source %

set encoding=UTF-8
set number
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" NerdTree config
"autocmd vimenter * NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"map <C-n> :NERDTreeToggle<CR>

" Remap arrow keys to buffer switching etc.
nnoremap <S-Up> :tabprevious<CR>
nnoremap <S-Down> :tabnext<CR>
nnoremap <S-Left> :bprevious<CR>
nnoremap <S-Right> :bnext<CR>
"nnoremap <S-f> :Files<CR>
nnoremap <S-w> :bd<CR>
nmap <S-f> <Plug>(fzf_tags)
nmap <S-z> :pop<CR>

" gitgutter config
let g:gitgutter_override_sign_column_highlight = 1
highlight SignColumn guibg=white
highlight SignColumn ctermbg=black
set updatetime=200

" Airline.vim {{{
augroup airline_config
    autocmd!
    let g:airline_powerline_fonts = 1
    let g:airline_enable_syntastic = 1
    let g:airline#extensions#tabline#buffer_nr_format = '%s '
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#fnamecollapse = 0
    let g:airline#extensions#tabline#fnamemod = ':t'
augroup END
" }}}

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'zackhsi/fzf-tags'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
"Plug 'preservim/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ryanoasis/vim-devicons'
call plug#end()
