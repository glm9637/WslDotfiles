setup:
	sudo apt update
	sudo apt upgrade
	sudo apt install zsh
	sudo apt install stow
	stow zsh tmux ohmyposh
	sudo apt install build-essential
	sudo apt install tmux
	sudo apt install unzip
	curl -s https://ohmyposh.dev/install.sh | sudo bash -s
	if [ ! -d "~/.fzf" ]; then git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install; fi
	if [ ! -d "~/.tmux" ]; then git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; fi
	curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
	exec zsh
	chsh -s $(which zsh)

cargo:
	curl https://sh.rustup.rs -sSf | sh -s -- -y
	. "${HOME}/.cargo/env"