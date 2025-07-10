# Define a variable for the shell, defaulting to the user's current shell.
SHELL := $(shell which bash)

# Phony targets don't represent files.
.PHONY: ubuntu alma cargo

ubuntu:
	sudo apt update
	sudo apt-get install -y zsh stow build-essential tmux unzip git curl
	@if ! command -v oh-my-posh > /dev/null; then \
		curl -s https://ohmyposh.dev/install.sh | sudo bash -s; \
	fi
	stow zsh tmux ohmyposh
	@if [ ! -d "$(HOME)/.fzf" ]; then \
		git clone --depth 1 https://github.com/junegunn/fzf.git $(HOME)/.fzf && $(HOME)/.fzf/install; \
	fi
	@if [ ! -d "$(HOME)/.tmux/plugins/tpm" ]; then \
		git clone https://github.com/tmux-plugins/tpm $(HOME)/.tmux/plugins/tpm; \
	fi
	@if ! command -v zoxide > /dev/null; then \
		curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh; \
	fi
	@if [ "$$(basename $$SHELL)" != "zsh" ]; then \
		sudo chsh -s $(shell which zsh) $(USER); \
		echo "Shell changed to zsh. Please log out and log back in for the changes to take effect."; \
	fi

alma:
	sudo dnf update -y
	sudo dnf config-manager --set-enabled crb
	sudo dnf install -y 'https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm'
	sudo dnf install -y zsh stow git tmux unzip curl
	@if ! command -v oh-my-posh > /dev/null; then \
		curl -s https://ohmyposh.dev/install.sh | sudo bash -s -- -d /usr/local/bin; \
	fi
	stow zsh tmux ohmyposh
	@if [ ! -d "$(HOME)/.fzf" ]; then \
		git clone --depth 1 https://github.com/junegunn/fzf.git $(HOME)/.fzf && $(HOME)/.fzf/install; \
	fi
	@if [ ! -d "$(HOME)/.tmux/plugins/tpm" ]; then \
		git clone https://github.com/tmux-plugins/tpm $(HOME)/.tmux/plugins/tpm; \
	fi
	@if ! command -v zoxide > /dev/null; then \
		curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh; \
	fi
	@if [ "$$(basename $$SHELL)" != "zsh" ]; then \
		sudo chsh -s $(shell which zsh) $(USER); \
		echo "Shell changed to zsh. Please log out and log back in for the changes to take effect."; \
	fi

cargo:
	@if ! command -v cargo > /dev/null; then \
		curl https://sh.rustup.rs -sSf | sh -s -- -y; \
		. "$(HOME)/.cargo/env"; \
	else \
		echo "Cargo is already installed."; \
	fi
