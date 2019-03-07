.PHONY: all install clean install_dirs install_files

PREFIX := ~


DOTFILES := $(wildcard files/.??*)
FILES := $(DOTFILES) $(wildcard files/*)

DOTDIRS := $(wildcard dirs/.??*)
DIRS := $(DOTDIRS) $(wildcard dirs/*)

.PHONY: $(DIRS)
.PHONY: $(FILES)


all:
	@echo "Nothing needs building yet. Try 'make install' if you know what I mean, and times being what they are..."

install: install_dirs install_files

clean:
	@echo "Pff, no?"


install_dirs: $(DIRS)

$(DIRS):
	cp -R $@ $(PREFIX)


install_files: $(FILES)

$(FILES):
	cp $@ $(PREFIX)

