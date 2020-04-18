My neovim setup. Plugins are managed by Plug and include:

- Coc.vim - tab completion/linting
- Airline - status/tab line
- Oceanic - themeing
- FZF - fuzzy search

### install
```
mkdir -p ~/.config/nvim &&\
git clone https://github.com/peterjcaulfield/nvim ~/.config/nvim &&\
cd ~/.config/nvim && ./install.sh &&\
nvim +PlugClean +PlugInstall +qa
```
