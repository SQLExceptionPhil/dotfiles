if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  fzf-tab
)

[[ ! -f ~/.envs.zsh ]] || source ~/.envs.zsh
[[ ! -f ~/.aliases.zsh ]] || source ~/.aliases.zsh
source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f "$HOME/.zsh_work" ] && source "$HOME/.zsh_work"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ $TERM != "linux" && $TERM_PROGRAM != "vscode" && -z "$TMUX" ]]; then
  # Auto attach to tmux session
  if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    # Only attach if not inside tmux already
    if tmux has-session -t main 2>/dev/null; then
      tmux attach-session -t main
    else
      tmux new-session -s main
    fi
  fi
fi
