"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Oceanic theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
silent! colorscheme OceanicNext
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" theme
let g:airline_theme='minimalist'
" enable tabline
let g:airline#extensions#tabline#enabled = 1
" show numbered buffers
let g:airline#extensions#tabline#buffer_idx_mode = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
" make path completion relative to current file/buffer path
let g:deoplete#file#enable_buffer_path = 1
" tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
" setup deoplete-tern js completetion engine
let g:tern_request_timeout = 1
" disable full signature type on autocomplete
let g:tern_show_signature_in_pum = '0'
"Add extra filetypes
let g:tern#filetypes = [
				\ 'jsx',
				\ 'javascript.jsx',
				\ 'vue',
				\ '...'
				\ ]
" close tip window after selecting a completion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setup fzf to use ag with an ignore file 
let $FZF_DEFAULT_COMMAND = 'ag --path-to-ignore ~/.ignore -g ""'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = { 'javascript': ['eslint', 'flow'], 'typescript': ['tslint', 'tsserver'] }
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-terraform
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1
