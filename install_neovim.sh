#!/bin/bash

# Creating a directory for installation
mkdir -p .install
pushd .install

# Determine OS and install dependencies
OS="$(uname)"
if [ "$OS" = "Linux" ]; then
    apt update
    apt install cmake git gettext -y
elif [ "$OS" = "Darwin" ]; then
    # Install Homebrew if not installed
    which -s brew
    if [ $? != 0 ]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew install cmake git
else
    echo "Unsupported operating system: $OS"
    exit 1
fi

# Install neovim
git clone https://github.com/neovim/neovim.git --depth 1
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
popd

# Backup existing neovim configuration if it exists
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null
mv ~/.local/share/nvim ~/.local/share/nvim.bak 2>/dev/null

# Install new neovim configurations
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
git clone https://github.com/FarizKesten/nvim_config/ ~/.config/nvim/lua/user
