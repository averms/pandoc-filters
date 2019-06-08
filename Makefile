srcs := $(wildcard src/*.lua)
outs := $(srcs:src/%.lua=dist/%.lua)

all: $(outs)
$(outs): dist/%.lua : src/%.lua
	@# remove any debugging
	@# add languages.txt
	m4 -Isrc -P .m4 $< | sed '/= require(.inspect.)/d' > $@

test:
	@make -Ctest

install: all
	cp $(outs) ~/.local/share/pandoc/filters/

clean:
	$(RM) dist/*.lua

.PHONY: clean install test all
