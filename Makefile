
########################################################
## General variables

DOTFILES := $(shell pwd)
VIMPLUG := https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
SPACEMACS := https://github.com/syl20bnr/spacemacs
DOOM := https://github.com/hlissner/doom-emacs
BASE16 := https://github.com/chriskempson/base16-shell.git
TPM := https://github.com/tmux-plugins/tpm
PANDOCMINTED := https://github.com/nick-ulle/pandoc-minted.git 
.PHONY: emacs vim fish bash git fonts pacaur tmux alacritty pandoc


########################################################
## Main recipes

all: emacs nvim fish bash git fonts pacaur tmux alacritty
clean: clean-emacs clean-fish clean-nvim clean-git clean-fonts clean-bash clean-pacaur clean-tmux clean-alacritty
reset: clean all

########################################################
## Emacs recipes

emacs:
	# ln -fs $(DOTFILES)/emacs/spacemacs $(HOME)/.spacemacs
	-rm -r $(HOME)/.doom.d.bak
	-mv $(HOME)/.doom.d $(HOME)/.doom.d.bak
	ln -fs $(DOTFILES)/emacs/doom $(HOME)/.doom.d
	# git clone $(SPACEMACS) $(HOME)/.emacs.d/ --branch develop
	-git clone $(DOOM) $(HOME)/.emacs.d/ --branch develop
	cd $(HOME)/.emacs.d && make install 
	# rm -rf $(HOME)/.emacs.d/private/snippets
	# ln -fs $(DOTFILES)/emacs/snippets $(HOME)/.emacs.d/private
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
	-rm -rf $(HOME)/.vim


########################################################
## Neovim recipes

nvim:
	mkdir -p $(HOME)/.config/nvim
	ln -fs $(DOTFILES)/vim/vimrc $(HOME)/.config/nvim/init.vim
	curl -fLo $(HOME)/.config/nvim/autoload/plug.vim --create-dirs $(VIMPLUG)

clean-nvim:
	-rm $(HOME)/.config/nvim/init.vim
	-rm -rf $(HOME)/.config/nvim

########################################################
## Pandoc recipes

pandoc:
	mkdir -p $(HOME)/.pandoc/templates
	ln -fs $(DOTFILES)/pandoc/class.tex $(HOME)/.pandoc/templates/class.tex
	git clone $(PANDOCMINTED) $(HOME)/.local/bin/pandoc-filters/pandoc-minted
	ln -fs $(HOME)/.local/bin/pandoc-filters/pandoc-minted/pandoc-minted.py $(HOME)/.local/bin/pandoc-minted

clean-pandoc:
	-rm -r $(HOME)/.pandoc
	-rm $(HOME)/.local/bin/pandoc-minted
	-rm -rf $(HOME)/.local/bin/pandoc-filters

########################################################
## Fish recipes

fish: _common-shell
	mkdir -p $(HOME)/.config/fish
	ln -fs $(DOTFILES)/fish/config.fish $(HOME)/.config/fish/config.fish
	ln -fs $(DOTFILES)/fish/functions $(HOME)/.config/fish/
	-mkdir -p $(HOME)/.local/bin

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
