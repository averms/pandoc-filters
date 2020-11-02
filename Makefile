root := $(PWD)
srcs := $(wildcard src/*.lua)
outs := $(srcs:src/%.lua=dist/%.lua)

all: $(outs)
$(outs): dist/%.lua : src/%.lua
# m4 -Isrc -P .m4 $< | sed '/= require(.inspect.)/d' > $@
	@# remove any debugging and add languages.txt
	m4 --include src/ --prefix-builtins config.m4 $< >$@

check: all
	cd test && ./t.bash

install: all
	mkdir -p ~/.local/share/pandoc/filters
	cp $(outs) ~/.local/share/pandoc/filters

clean:
	$(RM) dist/*.lua

.PHONY: clean install check all
