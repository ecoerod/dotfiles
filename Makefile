
########################################################
## General variables

DOTFILES := $(shell pwd)
VIMPLUG := https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
SPACEMACS := https://github.com/syl20bnr/spacemacs
BASE16 := https://github.com/chriskempson/base16-shell.git
TPM := https://github.com/tmux-plugins/tpm
.PHONY: emacs vim fish bash git fonts pacaur tmux alacritty pandoc


########################################################
## Main recipes

all: emacs vim fish bash git fonts pacaur tmux alacritty
clean: clean-emacs clean-fish clean-vim clean-git clean-fonts clean-bash clean-pacaur clean-tmux clean-alacritty

########################################################
## Emacs recipes

emacs:
	ln -fs $(DOTFILES)/emacs/spacemacs $(HOME)/.spacemacs
	git clone $(SPACEMACS) $(HOME)/.emacs.d/ --branch develop
	rm -rf $(HOME)/.emacs.d/private/snippets
	ln -fs $(DOTFILES)/emacs/snippets $(HOME)/.emacs.d/private
	mkdir -p $(HOME)/.config/systemd/user
	ln -fs $(DOTFILES)/emacs/emacs.service $(HOME)/.config/systemd/user/emacs.service
	systemctl --user enable emacs.service

clean-emacs:
	-systemctl --user disable --now emacs.service
	-rm $(HOME)/.spacemacs
	-rm $(HOME)/.emacs.d/private/snippets
	-rm -rf $(HOME)/.emacs.d

########################################################
## Vim recipes

vim:
	ln -fs $(DOTFILES)/vim/vimrc $(HOME)/.vimrc
	curl -fLo $(HOME)/.vim/autoload/plug.vim --create-dirs $(VIMPLUG)

clean-vim:
	-rm $(HOME)/.vimrc
	-rm -r $(HOME)/.vim

########################################################
## Pandoc recipes

pandoc:
	mkdir -p $(HOME)/.pandoc/templates
	ln -fs $(DOTFILES)/pandoc/class.tex $(HOME)/.pandoc/templates/class.tex

clean-pandoc:
	-rm -r $(HOME)/.pandoc

########################################################
## Fish recipes

fish: _common-shell
	mkdir -p $(HOME)/.config/fish
	ln -fs $(DOTFILES)/fish/config.fish $(HOME)/.config/fish/config.fish
	ln -fs $(DOTFILES)/fish/functions $(HOME)/.config/fish/

clean-fish: _clean-shell
	-rm $(HOME)/.config/fish/config.fish
	-rm $(HOME)/.config/fish/functions

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
	ln -fs $(DOTFILES)/fonts/.Xresources $(HOME)/.Xresources

clean-fonts:
	-rm $(HOME)/.Xresources

#########################################################
## Pacaur recipes

pacaur:
	mkdir -p $(HOME)/.config/pacaur
	ln -fs $(DOTFILES)/pacaur/config $(HOME)/.config/pacaur/config


clean-pacaur:
	-rm $(HOME)/.config/pacaur/config

#########################################################
## Tmux recipes

tmux:
	ln -fs $(DOTFILES)/tmux/tmux.conf $(HOME)/.tmux.conf
	git clone $(TPM) $(HOME)/.tmux/plugins/tpm

clean-tmux:
	-rm $(HOME)/.tmux.conf
	-rm -r $(HOME)/.tmux/

#########################################################
## Alacritty recipes

alacritty:
	mkdir -p $(HOME)/.config/alacritty
	-mv $(HOME)/.config/alacritty/alacritty.yml $(HOME)/.config/alacritty/alacritty.yml.bak
	ln -fs $(DOTFILES)/alacritty/alacritty.yml $(HOME)/.config/alacritty/alacritty.yml

clean-alacritty:
	-rm $(HOME)/.config/alacritty/alacritty.yml
	-mv $(HOME)/.config/alacritty/alacritty.yml.bak $(HOME)/.config/alacritty/alacritty.yml

#########################################################
## Not directly used recipes

_common-shell:
	git clone $(BASE16) $(HOME)/.config/base16-shell

_clean-shell:
	-rm -r $(HOME)/.config/base16-shell
