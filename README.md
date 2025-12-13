# 🛠️ Dotfiles

A clean, fast, and portable development environment focused on **Bash**, **WezTerm**, and modern CLI tooling.

Optimized for **42 school environments**, while remaining usable on any Linux or macOS system.

---

## ⚠️ Environment Assumptions

- Linux or macOS
- Bash shell
- Nerd Font installed
- Optional: 42-style shared storage (`/sgoinfre/$USER`)

> If `/sgoinfre` does not exist, you can override it:
```sh
export SGOINFRE="$HOME/.cache"

📦 Dependencies
Core

sudo apt install -y \
  git \
  curl \
  unzip \
  make \
  lsof

macOS:

brew install git curl make

🖥 Terminal
WezTerm

Linux:

curl -LO https://wezfurlong.org/wezterm/install/linux

macOS:

brew install --cask wezterm

🎨 Fonts (Required)

Install FiraCode Nerd Font

macOS:

brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font

Linux:

https://www.nerdfonts.com/font-downloads

✨ Shell Enhancements
Starship (Prompt)

curl -sS https://starship.rs/install.sh | sh

eza (ls replacement)

brew install eza
# or
sudo apt install eza

zoxide (smart cd)

brew install zoxide
# or
sudo apt install zoxide

Neovim

brew install neovim
# or
sudo apt install neovim

🟢 Node.js Tooling
NVM

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

PNPM

curl -fsSL https://get.pnpm.io/install.sh | sh -

Yarn

npm install -g yarn

📁 Installation

git clone https://github.com/yourname/dotfiles.git
cd dotfiles

Create symlinks:

ln -s ~/dotfiles/bash/.bashrc ~/.bashrc
ln -s ~/dotfiles/wezterm/wezterm.lua ~/.wezterm.lua

Reload:

source ~/.bashrc

⌨️ WezTerm Keybindings
Shortcut	Action
Ctrl + Alt + S	Vertical split
Ctrl + Shift + S	Horizontal split
Ctrl + Arrow Keys	Move between panes
Ctrl + Shift + N	New window
Ctrl + E	Close pane
🧠 Notes

    Uses $SGOINFRE for caches and temp files

    Guards against missing tools

    macOS-only features enabled conditionally

    Designed for shared / low-storage environments
