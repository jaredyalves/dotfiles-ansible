# Clear the initial message displayed when fish shell starts up
set -g fish_greeting ""

# Use neovim as the default terminal editor
set -x EDITOR nvim

# Define a different path for go
set -x GOPATH $HOME/.local/share/go

# Aliases
alias lg="lazygit"

# Load asdf
source ~/.asdf/asdf.fish

# Load starship
starship init fish | source
