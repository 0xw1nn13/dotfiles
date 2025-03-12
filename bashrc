#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
[ -r /home/w1nn13/.config/byobu/prompt ] && . /home/w1nn13/.config/byobu/prompt   #byobu-prompt#

alias gs='git status'
alias update='sudo pacman -Syu'

parse_git_branch() {
  git branch 2>/dev/null | sed -n '/\* /s///p'
}
export PS1='\[\e[32m\]\u@\h \[\e[34m\]\w\[\e[33m\] $(parse_git_branch)\[\e[0m\] $ '

export EDITOR=nvim
export VISUAL=nvim

shopt -s cdspell
bind 'TAB:menu-complete'

function ranger_cd() {
    tempfile=$(mktemp)
    ranger --choosedir="$tempfile" "$@"
    if [ -s "$tempfile" ]; then
        cd "$(cat "$tempfile")"
    fi
    rm -f "$tempfile"
}
alias rcd='ranger_cd'

alias obsidian="~/obsidian/appimage/Obsidian-1.8.9.AppImage"
