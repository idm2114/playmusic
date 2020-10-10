export PS1="\W $ "

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ian/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ian/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/ian/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ian/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias idmssh="ssh -i "snowflakes.pem" ubuntu@ec2-3-12-139-241.us-east-2.compute.amazonaws.com"
alias ..="cd .."
alias oaktree_ssh="ssh -i oaktrees.pem ubuntu@ec2-3-23-32-52.us-east-2.compute.amazonaws.com"
alias jae="ssh idm2114@clac.cs.columbia.edu"
alias ll="ls -alF"


#for competitive programming
alias gxx="g++ -std=c++14 -Wall -Werror -Wextra -Wshadow -Wno-sign-compare"

#for playing music from terminal
play () {
    osascript ~/.playmusic.scpt "$@"
}

#for making new directories and cding into them
mkcdir ()
{
    mkdir -p -- "$1" &&
        cd -P -- "$1"
}

addtogit () 
{
    "git init ." && "git remote add origin '$1'"  && 
        "git add ." && "git commit -m '$2'" && "git pull origin master" &&
            "git push origin master"
}

#for broot
source /Users/ian/.config/broot/launcher/bash/br

export PATH="$HOME/.poetry/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ian/google-cloud-sdk/path.bash.inc' ]; then . '/Users/ian/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ian/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/ian/google-cloud-sdk/completion.bash.inc'; fi
