# ~/.bashrc: for non-login shells.

# Die unless interactive
case $- in
    *i*) ;;
      *) return;;
esac

# Speshul case for speshul mac osx crusty version of bash. >.<
function bash_is_crusty_af() {
	if [ ${BASH_VERSION:0:1} -gt 3 ] ; then
		return 1
	else
		return 0
	fi
}

function on_a_mac() {
	[ $(uname) == "Darwin" ]
}

# Colors to use later. TODO make this less shitty
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

function gitstatus() {
	STATUS=`git status --porcelain`
	# tr -d needed for bsd wc
	MOD=`echo "$STATUS" | grep '^ M\|^MM' | wc -l | tr -d ' '`
	if [[ $MOD == 0 ]] ; then MOD="" ; fi
	NEW=`echo "$STATUS" | grep '^??' | wc -l | tr -d ' '`
	if [[ $NEW == 0 ]] ; then NEW="" ; fi
	STG=`echo "$STATUS" | grep '^A \|^M ' | wc -l | tr -d ' '`
	if [[ $STG == 0 ]] ; then STG="" ; fi
}

if on_a_mac ; then TIMECOLOR="$RST$YEL" ; else TIMECOLOR="$RST$BLU" ; fi

export PROMPT_COMMAND='
RET=$?
BRANCH=""
GITS=""
ERR=""
if [[ $RET != 0 ]] ; then ERR="\[$YEL\]$RET\[$RST\]" ; fi
if git branch &>/dev/null; then
 BRANCH=$(git branch 2>/dev/null | grep \* |  cut -d " " -f 2)
 BRANCH="($BRANCH)"
 gitstatus
 GITS="\[$RST\][\[$RED\]$MOD\[$WHT\]$NEW\[$GRN\]$STG\[$RST\]]"
fi
HOSTCOLOR=$RED
if [[ $(whoami) == "root" ]] ; then HOSTCOLOR=$GRN ; fi
PS1="\[$TIMECOLOR\]\t \[$HOSTCOLOR\]\h \[$RST\]\w \[$BLU\]$BRANCH$GITS$ERR\[$RST\]\\$"
'
# Note that newline before the ' is important for the history prompt_command diddle below

# Avoid duplicates
# export HISTCONTROL=ignoredups:erasedups

if bash_is_crusty_af ; then
	echo Setting old bash histsize because bash is crusty
	# "unlimited" size
	export HISTSIZE=50000
else
	# unlimited size
	export HISTFILESIZE=-1
	export HISTSIZE=-1
fi

export HISTTIMEFORMAT="%Y-%m-%d %T "

# when shell exits, append vs overwrite
shopt -s histappend

# Append to hist file and re-read it after each cmd
export PROMPT_COMMAND="${PROMPT_COMMAND}history -a; history -c; history -r"

# update the values of LINES and COLUMNS after each cmd
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# For BSD/mac ls
export CLICOLOR=1

# For linux
if [ -x /usr/bin/dircolors ] ; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

# TODO set LSCOLORS on mac/bsd to be consistent with linux colors

# Works for both linux and mac/bsd
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

if [ -f ~/.bash_aliases ] ; then . ~/.bash_aliases ; fi
if [ -f ~/.bash_aliases_private ] ; then . ~/.bash_aliases_private ; fi

# Install smoeller's up command
if ! bash_is_crusty_af ; then
	if [ -r ~/bin/up.sh ] ; then . ~/bin/up.sh ; fi
else
	echo Not sourcing up because of bashcrusty result
fi

