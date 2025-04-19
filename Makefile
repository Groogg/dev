CONFIG_PATH := $${XDG_CONFIG_HOME:-$$HOME/.config}

brew:
	if ! command -v brew &> /dev/null; then \
		echo "Installing Homebrew..."; \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	else \
		echo "Homebrew already installed"; \
	fi

dot: 
	$(MAKE) -C dotfiles all

apple:
	xcode-select --install || true
	softwareupdate --install rosetta

uv: 
	curl -LsSf https://astral.sh/uv/install.sh | sh

nvim:
	rm -rf "$(CONFIG_PATH)/nvim"
	git clone https://github.com/nvim-lua/kickstart.nvim.git "$(CONFIG_PATH)/nvim"
	
run: brew dot apple uv nvim
