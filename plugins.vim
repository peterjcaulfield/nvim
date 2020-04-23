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
" Nerd Commenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDSpaceDelims = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setup fzf to use ag with an ignore file
let $FZF_DEFAULT_COMMAND = 'ag --path-to-ignore ~/.ignore -g ""'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Goyo / Limelight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc aka autocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load extensions
let s:coc_extensions = [
			\ 'coc-tsserver',
			\ 'coc-dictionary',
			\ 'coc-json',
			\ 'coc-tag',
            \ 'coc-snippets',
            \ 'coc-prettier',
            \ 'coc-eslint',
			\]

for extension in s:coc_extensions
	call coc#add_extension(extension)
endfor
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" comment highlighting in json
autocmd FileType json syntax match Comment +\/\/.\+$+
" global coc config
let g:coc_user_config = {}
let g:coc_user_config['coc.preferences.jumpCommand'] = ':vsp'
" prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:coc_user_config['coc.preferences.formatOnSaveFiletypes'] = [
    \'javascript',
    \'typescript',
    \'typescriptreact'
    \'typescript.tsx'
\]
let g:coc_user_config['coc.preferences.formatOnSaveFiletypes'] = ['*']
" eslint
let g:coc_user_config['eslint.enable'] = 'true'
let g:coc_user_config['eslint.filetypes'] = [
    \'javascript',
    \'typescript',
    \'typescriptreact'
    \'typescript.tsx'
\]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimwiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let wiki1 = {}
let wiki1.path = '~/wikis/life'
let wiki1.syntax = 'markdown'
let wiki1.ext = '.md'
let wiki1.auto_diary_index = 1

let wiki2 = {}
let wiki2.path = '~/code/job-hunt-prep'
let wiki2.syntax = 'markdown'
let wiki2.ext = '.md'

let g:vimwiki_list = [wiki1, wiki2]
" make vim wiki use diary template for new entries
let diaryWildCard = wiki1.path . '/diary/*'. wiki1.ext
au BufNewFile ~/wikis/life/diary/*.md :silent 0r !~/.config/nvim/bin/generate-vimwiki-diary-template '%'
