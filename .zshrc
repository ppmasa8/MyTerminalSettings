# environment variable
export LANG=ja_JP.UTF-8

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

# Remove duplicates of the previous command.
setopt hist_ignore_dups

# Do not leave the same command in the history
setopt hist_ignore_all_dups

# Share history between simultaneously launched zsh
setopt share_history

# Enable the completion function.
autoload -Uz compinit
compinit -u
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

# Use completion to match uppercase with lowercase.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Fill and display completion suggestions
setopt list_packed

# Display the list of completion candidates in color
autoload colors
zstyle ':completion:*' list-colors ''

# Corrected the spelling of the command
setopt correct

# No beeping
setopt no_beep

# directory stack
DIRSTACKSIZE=100
setopt AUTO_PUSHD

# Make the zsh prompt cool and show Git branches
export CLICOLOR=1

echo hello.

# Enable Git completion.
autoload -Uz compinit && compinit

function left-prompt {
  name_t='179m%}'      # user name text clolr
  name_b='000m%}'    # user name background color
  path_t='255m%}'     # path text clolr
  path_b='031m%}'   # path background color
  arrow='087m%}'   # arrow color
  text_color='%{\e[38;5;'    # set text color
  back_color='%{\e[30;48;5;' # set background color
  reset='%{\e[0m%}'   # reset
  sharp='\uE0B0'      # triangle
  
  user="${back_color}${name_b}${text_color}${name_t}"
  dir="${back_color}${path_b}${text_color}${path_t}"
  echo "${user}%n%#@%m${back_color}${path_b}${text_color}${name_b}${sharp} ${dir}%~${reset}${text_color}${path_b}${sharp}${reset}\n${text_color}${arrow}→ ${reset}"
}

PROMPT=`left-prompt` 

# New line for each command execution
function precmd() {
    # Print a newline before the prompt, unless it's the
    # first prompt in the process.
    if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
        NEW_LINE_BEFORE_PROMPT=1
    elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
        echo ""
    fi
}

# Method to display git branch names in color
function rprompt-git-current-branch {
  local branch_name st branch_status
  
  branch='\ue0a0'
  color='%{\e[38;5;' #  Set text color
  green='114m%}'
  red='001m%}'
  yellow='227m%}'
  blue='033m%}'
  reset='%{\e[0m%}'   # reset
  
  if [ ! -e  ".git" ]; then
    # git Returns nothing for unmanaged directories
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # Everything is committed and clean.
    branch_status="${color}${green}${branch}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # git with unmanaged files
    branch_status="${color}${red}${branch}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # You have a file that has not been git added
    branch_status="${color}${red}${branch}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # There are some files that have not been git committed
    branch_status="${color}${yellow}${branch}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # A state of conflict.
    echo "${color}${red}${branch}!(no branch)${reset}"
    return
  else
    # For conditions other than the above
    branch_status="${color}${blue}${branch}"
  fi
  # Display the branch name in color.
  echo "${branch_status}$branch_name${reset}"
}
 
# Evaluate and replace the prompt string whenever prompted
setopt prompt_subst
 
# Display the result of the method on the right side of the prompt
RPROMPT='`rprompt-git-current-branch`'

# Alias
alias ll='ls -l'
alias cd..='cd ..'
alias goland='/usr/local/bin/goland'

# rbenv
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

export PATH=$HOME/.nodebrew/current/bin:$PATH

eval "$(rbenv init -)"

# goenv
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
export PATH=$HOME/.goenv/bin:$PATH
eval "$(goenv init -)"

# flutter path
export PATH="$PATH:[PATH_OF_FLUTTER_GIT_DIRECTORY]/bin"

# add ssh-key for git
plugins=(git ssh-agent)
