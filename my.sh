alias c=cat
alias f=find
alias d=date
alias du="du -sh"
alias s=systemctl
alias fh="free -h"
alias cx="chmod +x"
alias r="readlink -f"
alias p="ps -ef | grep"
alias em="emacsclient -c -F \"'(fullscreen . maximized)\" -a=\"\""

alias rqa="rpm -qa"
alias rqf="rpm -qf"
alias rql="rpm -ql"

alias ua="uname -a"
alias ur="uname -r"

alias ia="ip a"
alias ir="ip route"

alias st="ss -nltp"
alias su="ss -nlup"
alias sl="ss -nltup"

alias hg="history | grep"
alias hr="history -r"
alias hw="history -w"

alias pk="pkill -9"
alias k2="kill -s 2"
alias k6="kill -s 6"
alias k9="kill -s 9"

alias ll="ls -l"
alias ls="ls -F"
alias la="ls -aF"

alias pc="proxychains4 -q"
alias pb="proxychains4 -q bash"

alias gs="git status"
alias gd="git diff"
alias gl="git log"
alias gacp="git add . && git commit -m u &> /dev/null && git push"

alias dy="dnf install -y --nogpgchec"
alias ds="dnf search"
alias dp="dnf provides"
alias pdy="proxychains4 -q dnf install -y --nogpgchec"

if [ "$INSIDE_EMACS" ]
then
  :
elif [ -n "$BASH_VERSION" ] && [ -f /usr/share/fzf/shell/key-bindings.bash ]; then
  . /usr/share/fzf/shell/key-bindings.bash
else
  :
fi
