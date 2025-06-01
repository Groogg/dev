CONFIG_PATH := $${XDG_CONFIG_HOME:-$$HOME/.config}

brew:
	if ! command -v brew &> /dev/null; then \
		echo "Installing Homebrew..."; \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	else \
		echo "Homebrew already installed"; \
	fi

	brew bundle

.PHONY: shell
shell:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

dot:
	$(MAKE) -C dotfiles all

apple:
	xcode-select --install || true
	softwareupdate --install rosetta

uv:
	curl -LsSf https://astral.sh/uv/install.sh | sh

run: brew shell dot apple uv