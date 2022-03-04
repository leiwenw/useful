# use zshrc
# export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[34;1m\]\w\[\033[m\]\$ "
export PS1="\[\033[36;1m\]\h:\[\033[34;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=exFxBxDxCxegedabagacad
# alias ls='ls -GFh'
alias ll='ls -al'
alias grep='grep --color=auto'
alias g='grep'
alias gr='g -r'
alias c='clear'
alias gv='gvim'
alias sb='source ~/.bash_profile'
# git commamands simplified
alias gst='git status'
alias gco='git checkout'
alias gci='git commit'
alias grb='git rebase'
alias gbr='git branch'
alias gad='git add -A'
alias gpl='git pull'
alias gpu='git push'
alias glg='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
alias glg2='git log --date-order --all --graph --name-status --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
