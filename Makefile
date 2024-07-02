setup:
	sudo apt update
	sudo apt upgrade
	sudo apt install zsh
	sudo apt install stow
	stow zsh tmux ohmyposh
	sudo apt install build-essential
	sudo apt install tmux
	sudo apt install unzip
	curl https://sh.rustup.rs -sSf | sh -s -- -y
	. "${HOME}/.cargo/env"
	sh -c "$(curl -s https://ohmyposh.dev/install.sh | bash -s)"
	exec zsh
	chsh -s $(which zsh)
