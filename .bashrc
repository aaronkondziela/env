# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
BLK='\e[0;30m' # Black - Regular
RED='\e[0;31m' # Red
GRN='\e[0;32m' # Green
YEL='\e[0;33m' # Yellow
BLU='\e[0;34m' # Blue
MAG='\e[0;35m' # Magenta
CYN='\e[0;36m' # Cyan
WHT='\e[0;37m' # White
BLK_B='\e[1;30m' # Black - Bold
RED_B='\e[1;31m' # Red
GRN_B='\e[1;32m' # Green
YEL_B='\e[1;33m' # Yellow
BLU_B='\e[1;34m' # Blue
MAG_B='\e[1;35m' # Magenta
CYN_B='\e[1;36m' # Cyan
WHT_B='\e[1;37m' # White
BLK_U='\e[4;30m' # Black - Underline
RED_U='\e[4;31m' # Red
GRN_U='\e[4;32m' # Green
YEL_U='\e[4;33m' # Yellow
BLU_U='\e[4;34m' # Blue
MAG_U='\e[4;35m' # Magenta
CYN_U='\e[4;36m' # Cyan
WHT_U='\e[4;37m' # White
BLK_BG='\e[40m'   # Black - Background
RED_BG='\e[41m'   # Red
GRN_BG='\e[42m'   # Green
YEL_BG='\e[43m'   # Yellow
BLU_BG='\e[44m'   # Blue
MAG_BG='\e[45m'   # Magenta
CYN_BG='\e[46m'   # Cyan
WHT_BG='\e[47m'   # White
RST='\e[0m'    # Text Reset

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Avoid duplicates
# export HISTCONTROL=ignoredups:erasedups

# unlimited size
export HISTFILESIZE=-1
export HISTSIZE=-1
export HISTTIMEFORMAT="%Y-%m-%d %T "

# when shell exits, append vs overwrite
shopt -s histappend

# After each cmd append to hist file and re-read it
#export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
#	color_prompt=yes
#    else
#	color_prompt=
#    fi
#fi

#if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -lF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

. ~/bin/up.sh
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cd)%C(cyan) %an%Creset' --abbrev-commit --date=format:'%Y-%b-%d %H:%m'"
alias gs="git status"
alias gco="git checkout"
alias gcm="git commit"
alias gb="git branch"
alias gba="git branch -a"
export NODE_PATH=/usr/lib/node_modules

function gitstatus() {
	STATUS=`git status --porcelain`
	MOD=`echo "$STATUS" | grep '^ M\|^MM' | wc -l`
	if [[ $MOD == 0 ]] ; then MOD="" ; fi
	NEW=`echo "$STATUS" | grep '^??' | wc -l`
	if [[ $NEW == 0 ]] ; then NEW="" ; fi
	STG=`echo "$STATUS" | grep '^A \|^M ' | wc -l`
	if [[ $STG == 0 ]] ; then STG="" ; fi
}

export PROMPT_COMMAND='\
RET=$? ;\
BRANCH="" ;\
GITS="";\
ERR="" ;\
if [[ $RET != 0 ]] ; then ERR=" \[\e[0;30;43m\] $RET \[$RST\]" ; fi ;\
if git branch &>/dev/null; then\
 BRANCH=$(git branch 2>/dev/null | grep \* |  cut -d " " -f 2);\
 BRANCH="($BRANCH)";\
 gitstatus;\
 GITS="\[$RST\][\[$RED\]$MOD\[$WHT\]$NEW\[$GRN\]$STG\[$RST\]]";\
fi;\
HOSTCOLOR=$RED;\
if [[ $(whoami) == 'root' ]] ; then HOSTCOLOR=$GRN ; fi
PS1="\[$RST$BLU\]\t \[$HOSTCOLOR\]\h \[$RST\]\w \[$BLU\]$BRANCH$GITS$ERR\[$RST\]\$"
'
