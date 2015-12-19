alias l="ls"
alias ll="ls -lah"
alias ..='cd ..'
alias ...='cd ../..'
alias sbp='source ~/.bash_profile'
alias bp='vim ~/.bash_profile'

alias simple="python -m SimpleHTTPServer"
alias emptypackage="echo '{}' > package.json"

# git aliases
alias gd="git diff"
alias gs="git status"
alias gl='git log --pretty=format:"%Cgreen%h %Creset %s %Cblueby %an (%ar) %Cred %d"'

# git commands autocomplete
if [ -f ~/.git-completion.bash ]; then
	source ~/.git-completion.bash
fi

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# g++ headers include
export CPLUS_INCLUDE_PATH=/usr/local/include/

function parse_git_branch {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'
}

function last_two_dirs {
        pwd |rev| awk -F / '{print $1,$2}' | rev | sed s_\ _/_
}

# display branch with last two dirs in terminal
export PS1='\[\e[0;30m\]\u\[\e[0;30m\]-\[\e[0;30m\]$(last_two_dirs)\[\e[1;34m\]\[\033[1;31m\]$(parse_git_branch)\[\e[0;30m\] $ \[\e[0;30m\]'

