" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Normal mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" save file
nmap <leader>s :w!<cr>
" nuke the focused buffer
nmap <leader>x :bd!<cr>
" paste from default yank buffer
nmap <leader>p "0p

" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>
" Open terminal
" nmap <leader>t :terminal<cr>
" make it easer to execute commands
nmap ; :

" open an 80 column split in terminal mode
func TermSplit()
  execute "vsplit"
  execute "vertical resize 80"
  execute "terminal"
endfunc
nmap <leader>t :exec TermSplit()<cr>

" fzf mappings
nmap <leader>f :Files<cr> 
nmap <leader>c :Commands<cr>

" Airline buffer navigation
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>= <Plug>AirlineSelectNextTab

" Window navigation function
" Make ctrl-h/j/k/l move between windows and auto-insert in terminals
func! s:mapMoveToWindowInDirection(direction)
    func! s:maybeInsertMode(direction)
        stopinsert
        execute "wincmd" a:direction
        " when moving to terminal mode window start in insert mode
        if &buftype == 'terminal' 
            startinsert!
        endif
    endfunc

    execute "tnoremap" "<silent>" "<C-" . a:direction . ">"
                \ "<C-\\><C-n>"
                \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
    execute "nnoremap" "<silent>" "<C-" . a:direction . ">"
                \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
endfunc
for dir in ["h", "j", "l", "k"]
    call s:mapMoveToWindowInDirection(dir)
endfor

"nnoremap <silent> <Leader>+ :exe "vertical resize " . (&columns * 1/2)<CR>
"nnoremap <silent> <Leader>- :exe "vertical resize " . (&columns * 1/3)<CR>
nmap <Leader>+ :echo '' . &columns<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy escaping to normal mode
imap jj <esc>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Terminal mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" close terminal window easy
tnoremap jj <C-\><C-n>:q<CR>
" close terminal buffer easy
tnoremap jx <C-\><C-n>:bd!<CR>
" easily jump back to normal window
tnoremap <Space><Space> <C-\><C-n><C-w><C-p>

