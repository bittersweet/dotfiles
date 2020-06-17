# ln -s ~/dotfiles/zsh ~/.zsh
# ln -s ~/dotfiles/zshrc ~/.zshrc
# ln -s ~/dotfiles/ackrc ~/.ackrc
# ln -s ~/dotfiles/gemrc ~/.gemrc
# ln -s ~/dotfiles/gitconfig ~/.gitconfig
# ln -s ~/dotfiles/gitignore ~/.gitignore
# ln -s ~/dotfiles/irbrc ~/.irbrc
# ln -s ~/dotfiles/rspec ~/.rspec
# ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
# ln -s ~/dotfiles/vim ~/.vim
# ln -s ~/dotfiles/vimrc ~/.vimrc
# ln -s ~/dotfiles/ctags ~/.ctags

OS=$(uname)
if test "$OS" = "Linux"; then
  ln -s ~/dotfiles/linux/config/alacritty ~/.config/alacritty
  ln -s ~/dotfiles/linux/config/bspwm ~/.config/bspwm
  ln -s ~/dotfiles/linux/config/sxhkd ~/.config/sxhkd
  ln -s ~/dotfiles/linux/config/rofi ~/.config/rofi
  ln -s ~/dotfiles/linux/config/mpv ~/.config/mpv
  ln -s ~/dotfiles/linux/config/gtk-2.0 ~/.config/gtk-2.0
  ln -s ~/dotfiles/linux/config/gtk-3.0 ~/.config/gtk-3.0

  ln -s ~/dotfiles/linux/gtkrc-2.0 ~/.gtkrc-2.0
  ln -s ~/dotfiles/linux/gtkrc-2.0.mine ~/.gtkrc-2.0.mine

  ln -s ~/dotfiles/linux/xinitrc ~/.xinitrc
  ln -s ~/dotfiles/linux/Xresources ~/.Xresources
  ln -s ~/dotfiles/linux/themes ~/.themes

  ln -s ~/dotfiles/linux/mozilla/user.js ~/.mozilla/user.js
fi

echo "Files linked"
