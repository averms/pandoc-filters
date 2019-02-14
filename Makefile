srcs := $(wildcard src/*.lua)
outs := ${srcs:src/%.lua=dist/%.lua}

all: $(outs)

$(outs): dist/%.lua : src/%.lua
	@# remove any debugging
	@# add languages.txt
	m4 -Isrc -P .m4 $< | sed '/= require(.pl/d' > $@

test:
	@make -Ctest

copy: all
	cp $(outs) ~/.pandoc/filters/

clean:
	$(RM) dist/*.lua

.PHONY: clean copy test all
