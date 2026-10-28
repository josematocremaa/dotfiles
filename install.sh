#!/usr/bin/env bash
set -e
DOTFILES="$(cd "$(dirname "$0")" && pwd)"

# Paquetes (solo Debian/Ubuntu)
if command -v apt >/dev/null; then
  sudo apt install -y zsh tmux git curl fzf ripgrep fd-find tldr
fi

# Plugins de zsh (no se guardan en el repo, se clonan)
mkdir -p ~/.zsh/plugins
clone() { [ -d "$2" ] || git clone --depth=1 "$1" "$2"; }
clone https://github.com/zsh-users/zsh-autosuggestions          ~/.zsh/plugins/zsh-autosuggestions
clone https://github.com/zsh-users/zsh-syntax-highlighting      ~/.zsh/plugins/zsh-syntax-highlighting
clone https://github.com/zsh-users/zsh-completions              ~/.zsh/plugins/zsh-completions
clone https://github.com/zsh-users/zsh-history-substring-search ~/.zsh/plugins/zsh-history-substring-search
clone https://github.com/romkatv/powerlevel10k                  ~/.zsh/plugins/powerlevel10k

# Symlinks (hace copia de seguridad si ya existía un fichero real)
link() {
  [ -e "$2" ] && [ ! -L "$2" ] && mv "$2" "$2.bak"
  ln -sfn "$1" "$2"
}
link "$DOTFILES/zsh/.zshrc"       ~/.zshrc
link "$DOTFILES/tmux/.tmux.conf"  ~/.tmux.conf
link "$DOTFILES/git/.gitconfig"   ~/.gitconfig
[ -f "$DOTFILES/zsh/.p10k.zsh" ] && link "$DOTFILES/zsh/.p10k.zsh" ~/.p10k.zsh

# zsh como shell por defecto
[ "$SHELL" != "$(command -v zsh)" ] && chsh -s "$(command -v zsh)"
echo "Listo. Cierra sesión y vuelve a entrar."
