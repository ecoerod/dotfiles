
########################################################
## General variables

DOTFILES := $(shell pwd)
VIMPLUG := https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
SPACEMACS := https://github.com/syl20bnr/spacemacs
BASE16 := https://github.com/chriskempson/base16-shell.git
.PHONY: emacs vim fish bash git fonts pacaur


########################################################
## Main recipes

all: emacs fish git fonts
clean: clean-emacs clean-fish clean-vim clean-git clean-fonts clean-bash

########################################################
## Emacs recipes

emacs:
	ln -fs $(DOTFILES)/emacs/spacemacs $(HOME)/.spacemacs
	git clone $(SPACEMACS) $(HOME)/.emacs.d/ --branch develop
	rm -rf $(HOME)/.emacs.d/private/snippets
	ln -fs $(DOTFILES)/emacs/snippets $(HOME)/.emacs.d/private

clean-emacs:
	-rm $(HOME)/.spacemacs
	-rm $(HOME)/.emacs.d/private/snippets
	-rm -r $(HOME)/.emacs.d

########################################################
## Vim recipes

vim:
	ln -fs $(DOTFILES)/vim/vimrc $(HOME)/.vimrc
	curl -fLo $(HOME)/.vim/autoload/plug.vim --create-dirs $(VIMPLUG)

clean-vim:
	-rm $(HOME)/.vimrc
	-rm -r $(HOME)/.vim

########################################################
## Fish recipes

fish: _common-shell
	ln -fs $(DOTFILES)/fish/config.fish $(HOME)/.config/fish/config.fish
	ln -fs $(DOTFILES)/fish/functions/fish_prompt.fish $(HOME)/.config/fish/functions/fish_prompt.fish

clean-fish: _clean-shell
	-rm $(HOME)/.config/fish/config.fish
	-rm $(HOME)/.config/fish/functions/fish_prompt.fish

########################################################
## Bash recipes

bash: _common-shell
	-mv -f $(HOME)/.bashrc $(HOME)/.bashrc.bak
	ln -fs $(DOTFILES)/bash/bashrc $(HOME)/.bashrc

clean-bash: _clean-shell
	-rm $(HOME)/.bashrc
	-mv $(HOME)/.bashrc.bak $(HOME)/.bashrc

########################################################
## Gitconfig recipes

git:
	ln -fs $(DOTFILES)/git/gitconfig $(HOME)/.gitconfig

clean-git:
	-rm $(HOME)/.gitconfig

########################################################
## Fonts recipes

fonts:
	mkdir -p $(HOME)/.config/fontconfig
	ln -fs $(DOTFILES)/fonts/fonts.conf $(HOME)/.config/fontconfig/fonts.conf
	ln -fs $(DOTFILES)/fonts/.Xresources $(HOME)/.Xresources

clean-fonts:
	-rm $(HOME)/.config/fonts.conf
	-rm $(HOME)/.Xresources

#########################################################
## Pacaur recipes

pacaur:
	mkdir -p $(HOME)/.config/pacaur
	ln -fs $(DOTFILES)/pacaur/config $(HOME)/.config/pacaur/config


clean-pacaur:
	-rm $(HOME)/.config/pacaur/config

#########################################################
## Not directly used recipes

_common-shell:
	git clone $(BASE16) $(HOME)/.config/base16-shell

_clean-shell:
	-rm -r $(HOME)/.config/base16-shell
