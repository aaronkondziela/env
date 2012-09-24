# .profile 

PATH=$PATH:$HOME/bin
export PATH=/opt/local/bin:/opt/local/sbin:/opt/local/libexec/perl5.12/sitebin:$PATH

CLICOLOR=YES; export CLICOLOR
GREP_OPTIONS='--color=auto'; export GREP_OPTIONS

alias l='ls -al';
alias ll='l';
alias myps='ps -auxf | grep `id -u`'

alias htd='cd /usr/local/apache/htdocs'

[ -f ~/git/up/up.bash ] && . ~/git/up/up.bash

# from mcanz/env

alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(cyan) %an%Creset' --abbrev-commit --date=relative"
alias gs="git status"
alias gco="git checkout"
alias gcm="git commit"
alias gb="git branch"
alias gba="git branch -a"

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
