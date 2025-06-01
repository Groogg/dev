UNAME := $(shell uname)
DOTFILE_PATH := $(shell pwd)

$(HOME)/.%: %
	ln -sf $(DOTFILE_PATH)/$^ $@

zsh: $(HOME)/.zshrc
git: $(HOME)/.gitconfig $(HOME)/.gitignore

$(HOME)/.config/ghostty/config:
	mkdir -p $(HOME)/.config/ghostty
	ln -sf $(DOTFILE_PATH)/ghostty_config $(HOME)/.config/ghostty/config

ghostty: $(HOME)/.config/ghostty/config

$(HOME)/.config/jj/config.toml:
	mkdir -p $(HOME)/.config/jj
	ln -sf $(DOTFILE_PATH)/jj_config.toml $(HOME)/.config/jj/config.toml

jj: $(HOME)/.config/jj/config.toml

all: zsh git ghostty jj
