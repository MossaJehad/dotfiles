########################################
# ENVIRONMENT BASE
########################################

# 42-like shared storage (override if needed)
export SGOINFRE="${SGOINFRE:-/sgoinfre/$USER}"

# Shell
export SHELL=/bin/bash

# Temp
export TMPDIR="$SGOINFRE/.tmp"

########################################
# PATH
########################################

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.scripts:$PATH"
export PATH="$HOME/apps/bin:$PATH"
export PATH="$HOME/apps/wezterm/bin:$PATH"
export PATH="$HOME/local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$SGOINFRE/yarn-global/bin:$PATH"
export PATH="$SGOINFRE/.local/bin:$PATH"
export PATH="$SGOINFRE/.npm-global/bin:$PATH"

########################################
# NODE / PACKAGE MANAGERS
########################################

# NVM
export NVM_DIR="$SGOINFRE/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# PNPM
export PNPM_HOME="$SGOINFRE/.pnpm"
export PNPM_STORE_PATH="$SGOINFRE/.pnpm-store"
export PATH="$PNPM_HOME:$PATH"

# Yarn & npm cache
export yarn_cache_folder="$SGOINFRE/.yarn"
export npm_config_cache="$SGOINFRE/.npm-cache"

########################################
# UI / CURSOR
########################################

export XCURSOR_THEME="Posy_Cursor_Mono_Black"

########################################
# PROMPT (CHOOSE ONE)
########################################

# Starship (default)
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init bash)"
fi

# Oh My Posh (optional)
# if command -v oh-my-posh >/dev/null 2>&1; then
#   eval "$(oh-my-posh init bash --config ~/OhMyPoshTheme/agnosterplus.omp.json)"
# fi

########################################
# ALIASES
########################################

# Terminal
alias wez="wezterm-gui"

# Editors
alias vim="nvim"

# ls replacement (eza)
if command -v eza >/dev/null 2>&1; then
  alias ls="eza --icons"
  alias l="eza --icons"
  alias ll="eza -lg --icons"
  alias la="eza -lag --icons"
  alias lt="eza -lTg --icons"
  alias lt1="eza -lTg --level=1 --icons"
  alias lt2="eza -lTg --level=2 --icons"
  alias lt3="eza -lTg --level=3 --icons"
  alias lta="eza -lTag --icons"
  alias lta1="eza -lTag --level=1 --icons"
  alias lta2="eza -lTag --level=2 --icons"
  alias lta3="eza -lTag --level=3 --icons"
  alias larth="eza -lag --time-style=iso --sort newest"
fi

alias fpid="lsof"

########################################
# ZOXIDE (SMART CD)
########################################

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init bash)"
  alias cd="z"
fi

########################################
# BLE.SH (BASH LINE EDITOR)
########################################

if [ -f "$HOME/.local/share/blesh/ble.sh" ]; then
  source "$HOME/.local/share/blesh/ble.sh"
  bleopt complete_auto_complete=1
fi

########################################
# KEYBINDS
########################################

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

########################################
# GIT HELPERS
########################################

if [ -x "$HOME/dotfiles/scripts/git_push.sh" ]; then
  alias push="$HOME/dotfiles/scripts/git_push.sh"
fi

########################################
# FILES MAKE HELPERS
########################################

ffclean() {
  shopt -s nullglob
  for dir in ex*; do
    if [ -f "$dir/Makefile" ]; then
      printf "🧹 %-6s ... " "$dir"
      if make -C "$dir" fclean >/dev/null; then
        echo "✅"
      else
        echo "❌"
      fi
    fi
  done
  shopt -u nullglob
}

fmake() {
  shopt -s nullglob
  for dir in ex*; do
    if [ -f "$dir/Makefile" ]; then
      printf "🔨 %-6s ... " "$dir"
      if make -C "$dir" >/dev/null; then
        echo "✅"
      else
        echo "❌"
      fi
    fi
  done
  shopt -u nullglob
}
