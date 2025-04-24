CONFIG_PATH := $${XDG_CONFIG_HOME:-$$HOME/.config}

brew:
	if ! command -v brew &> /dev/null; then \
		echo "Installing Homebrew..."; \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	else \
		echo "Homebrew already installed"; \
	fi

	brew bundle

dot:
	$(MAKE) -C dotfiles all

apple:
	xcode-select --install || true
	softwareupdate --install rosetta

uv:
	curl -LsSf https://astral.sh/uv/install.sh | sh

.PHONY: nvim
nvim:
	git submodule init
	git submodule update
	rm -rf "$(CONFIG_PATH)/nvim"
	ln -sf "$(PWD)/nvim" "$(CONFIG_PATH)/nvim"

run: brew nvim dot apple uv

git-update:
	cd nvim && git add . && git commit -m "automated dev commit" || echo "No changes to commit in nvim repo" && git push
	git add . && git commit -m "automated dev commit" || echo "No changes to commit in dev repo" && git push
