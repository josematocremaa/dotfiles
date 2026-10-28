# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Historial
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE

# PATH
export PATH="$HOME/.local/bin:$PATH"

# Completado (zsh-completions va ANTES de compinit)
fpath=(~/.zsh/plugins/zsh-completions/src $fpath)
autoload -Uz compinit && compinit

# Prompt
source ~/.zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Plugins
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# fzf (Ctrl-R fuzzy, Ctrl-T ficheros)
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ]   && source /usr/share/doc/fzf/examples/completion.zsh

# Aliases
alias ll="ls -lh"
alias la="ls -A"
alias gs="git status"
alias mv="mv -i"
alias mkdir="mkdir -p"
command -v fdfind >/dev/null && alias fd=fdfind   # en Ubuntu fd se llama fdfind

# Lo que tuvieras en .bashrc (ROS 2, variables...) va aquí, por ejemplo:
# source /opt/ros/<tu_distro>/setup.zsh

# Este SIEMPRE el último
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
