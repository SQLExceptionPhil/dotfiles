if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LC_CTYPE="en_US.UTF-8"
export ZSH="/Users/$USER/.oh-my-zsh"
export JAVA_HOME="/Users/$USER/Library/Java/JavaVirtualMachines/adopt-openjdk-16.0.1/Contents/Home/"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  fzf-tab
)

source $ZSH/oh-my-zsh.sh


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="/Users/$USER/.bin:/opt/homebrew/opt/node@12/bin:/Users/$USER/go/bin:$PATH"
export HOMEBREW_NO_ENV_HINTS="1"

[ -f "$HOME/.zsh_work" ] && source "$HOME/.zsh_work"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("/Users/$USER/miniconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/$USER/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/$USER/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/$USER/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# aliases
alias vic="vim -c 'execute \"silent \!echo \" . &fileencoding | q'"
alias k="kubectl"
alias kn="kubens"
alias kc="kubectx"
alias klogs='kubectl logs -f $(kubectl get pods | fzf | awk "{print \$1}")'
alias kdescribe='kubectl describe pod -f $(kubectl get pods | fzf | awk "{print \$1}")'
alias cls="clear"
alias vi="nvim"
alias vim="nvim"

# Added by Windsurf
export PATH="/Users/$USER/.codeium/windsurf/bin:$PATH"
