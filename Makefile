prefix=~

install:
	cp -R bin $(prefix)/
	cp -R .vim $(prefix)/
	cp .vimrc $(prefix)/
	cp .profile $(prefix)/

.PHONY: install

