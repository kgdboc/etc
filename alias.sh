alias c=cat
alias d=date
alias l=less
alias n=ncdu
alias du="du -sh"
alias s=systemctl
alias fh="free -h"
alias top="top -c"
alias ia="ip a"
alias ir="ip route"
alias st="ss -nltp"
alias su="ss -nlup"
alias sl="ss -nltup"
alias cx="chmod +x"
alias r="readlink -f"
alias p="ps -ef | grep"
alias f="find . | grep"
alias m="MANWIDTH=165 man"
alias cip="curl https://ipinfo.io/ip"

alias em="emacsclient -c -F \"'(fullscreen . maximized)\" -a=\"\""
alias eq="emacs -nw -q --eval \"(setq make-backup-files nil)\""

alias h="history | grep"
alias hr="history -r"
alias hw="history -w"

alias pk="pkill -9"
alias k9="kill -9"

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
alias pdy="proxychains4 -q dnf install -y --nogpgchec"
alias ds="dnf search"
alias dp="dnf provides"
