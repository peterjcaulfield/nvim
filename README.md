My neovim setup. Plugins are managed by Plug and include:

- Deoplete - tab completion
- Airline - status/tab line
- Oceanic - themeing
- FZF - fuzzy search

### install
```
mkdir -p ~/.config/nvim \
git clone https://github.com/peterjcaulfield/nvim ~/.config/nvim \
cd ./install.sh \
nvim +PlugClean +PlugInstall +qa
```
