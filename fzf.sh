if [ "$INSIDE_EMACS" ]
then
  :
elif [ -n "$ZSH_VERSION" ]; then
  . /usr/share/fzf/shell/key-bindings.zsh
elif [ -n "$BASH_VERSION" ]; then
  . /usr/share/fzf/shell/key-bindings.bash
else
  :
fi
