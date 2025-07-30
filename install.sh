# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# add homebrew to path
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/[username]/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# install packages
brew tap homebrew/cask-fonts
brew install --cask \
  font-hack-nerd-font \
  insomnia

brew install \
  warp \
  node \
  tree \
  typescript \
  fd \
  neovim \
  git \
  zsh \
  yarn \
  tmux \
  ripgrep \
  stow \
  yamllint \
  nvm

npm install -g \
  jsonlint \
  markdownlint

# ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# stow dotfiles
stow git
stow nvim
stow p10k
stow tmux
stow zsh

# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# install zsh plugins
## zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

## zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install neovim plugins
nvim --headless +PlugInstall +qall
