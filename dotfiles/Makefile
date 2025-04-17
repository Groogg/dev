UNAME := $(shell uname)
DOTFILE_PATH := $(shell pwd)

$(HOME)/.%: %
	ln -sf $(DOTFILE_PATH)/$^ $@

zsh: $(HOME)/.zshrc $(HOME)/.zsh_profile

$(HOME)/.hammerspoon:
	mkdir -p $(HOME)/.hammerspoon
	ln -sfn $(DOTFILE_PATH)/hammerspoon_init.lua $(HOME)/.hammerspoon/init.lua

hammerspoon: $(HOME)/.hammerspoon/init.lua

$(HOME)/.config/zed/settings.json:
	mkdir -p $(HOME)/.config/zed
	ln -sf $(DOTFILE_PATH)/zed_settings.json $(HOME)/.config/zed/settings.json

$(HOME)/.config/zed/keymap.json:
	mkdir -p $(HOME)/.config/zed
	ln -sf $(DOTFILE_PATH)/zed_keymap.json $(HOME)/.config/zed/keymap.json

zed: $(HOME)/.config/zed/keymap.json $(HOME)/.config/zed/settings.json

$(HOME)/.config/ghostty/config:
	mkdir -p $(HOME)/.config/ghostty
	ln -sf $(DOTFILE_PATH)/ghostty_config $(HOME)/.config/ghostty/config

ghostty: $(HOME)/.config/ghostty/config

all: zsh hammerspoon zed ghostty
