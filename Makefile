DOTFILES := $(shell pwd)
VIMPLUG := https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
SPACEMACS := https://github.com/syl20bnr/spacemacs
BASE16 := https://github.com/chriskempson/base16-shell.git
.PHONY: emacs vim fish bash git


all: emacs fish git

emacs:
	ln -fs $(DOTFILES)/emacs/spacemacs $(HOME)/.spacemacs
	git clone $(SPACEMACS) $(HOME)/.emacs.d/ --branch develop
	rm -rf $(HOME)/.emacs.d/private/snippets
	ln -fs $(DOTFILES)/emacs/snippets $(HOME)/.emacs.d/private

vim:
	ln -fs $(DOTFILES)/vim/vimrc $(HOME)/.vimrc
	curl -fLo $(HOME)/.vim/autoload/plug.vim --create-dirs $(VIMPLUG)

fish: _common-shell
	ln -fs $(DOTFILES)/fish/config.fish $(HOME)/.config/fish/config.fish
	ln -fs $(DOTFILES)/fish/functions/fish_prompt.fish $(HOME)/.config/fish/functions/fish_prompt.fish

bash: _common-shell
	ln -fs $(DOTFILES)/bash/bashrc $(HOME)/.bashrc

git:
	ln -fs $(DOTFILES)/git/gitconfig $(HOME)/.gitconfig

_common-shell:
	git clone $(BASE16) $(HOME)/.config/base16-shell
