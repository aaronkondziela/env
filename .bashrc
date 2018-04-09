# .profile 

PATH=$PATH:$HOME/bin
export PATH=/Users/Administrator/repos/elib1/bin:/opt/local/bin:/opt/local/sbin:/opt/local/libexec/perl5.12/sitebin:$PATH

CLICOLOR=YES; export CLICOLOR
GREP_OPTIONS='--color=auto'; export GREP_OPTIONS

alias l='ls -al';
alias ll='l';
alias myps='ps -auxf | grep `id -u`'
alias pp='python -c "import sys, json; print json.dumps( json.load( sys.stdin ), sort_keys=True, indent=4)"'

alias htd='cd /usr/local/apache/htdocs'

[ -f ~/bin/up.sh ] && . ~/bin/up.sh

# from mcanz/env

alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cd)%C(cyan) %an%Creset' --abbrev-commit --date=format:'%Y-%b-%d %H:%m'"
alias gs="git status"
alias gco="git checkout"
alias gcm="git commit"
alias gb="git branch"
alias gba="git branch -a"

alias rot13="tr a-zA-Z n-za-mN-ZA-M"

_dir_chomp () {
	local IFS=/ c=1 n d
	local p=(${1/#$HOME/\~}) r=${p[*]}
	local s=${#r}
	while (( s > $s && c < ${#p[*]} - 1 ))
	do
		d=${p[c]}
		n=1;[[ $d = .* ]]&&n=2
		((s-=${#d}-n))
		p[c++]=${d:0:n}
	done
	echo "${p[*]}"
}

export PATH=$HOME/env:$PATH
export PS0='\[\e[0;36m\]\t\[\e[0m\] \[\e[0;31m\]\h\[\e[0m\] {\[\e[1;33m\]\w\[\e[0m\]}\[\e[0;36m\]%{(%b\[\e[1;37m\]%m\[\e[0;36m\])[%u%c%f%t\[\e[0;36m\]]%}\[\e[0m\]$'
export PROMPT_COMMAND='export PS1=$(gitprompt.pl statuscount=1 u=%[%e[31m%] c=%[%e[32m%] f=%[%e[1\;37m%])'

# Avoid duplicates
# export HISTCONTROL=ignoredups:erasedups

# unlimited size
export HISTFILESIZE=-1
export HISTSIZE=-1
export HISTTIMEFORMAT="%Y-%m-%d %T "

# when shell exits, append vs overwrite
shopt -s histappend

# After each cmd append to hist file and re-read it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
