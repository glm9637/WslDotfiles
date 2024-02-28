setup:
	sudo apt update
	sudo apt upgrade
	sudo apt install zsh
	sudo apt install stow
	stow zsh tmux p10k oh-my-zsh
	sudo apt install build-essential
	sudo apt install tmux
	curl https://sh.rustup.rs -sSf | sh -s -- -y
	. "$${HOME}/.cargo/env"
	cargo install exa
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	if [ ! -d "~/.oh-my-zsh/custom/plugins/zsh-exa"]; then \
		git clone https://github.com/ptavares/zsh-exa.git ~/.oh-my-zsh/custom/plugins/zsh-exa; \
	fi
	if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k"]; then \
		git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k; \
	fi
	if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"]; then \
		git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions; \
	fi
	exec zsh
