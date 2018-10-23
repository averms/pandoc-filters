# test

OUTDIR := .
MD := test1.md
CODE := test1.lua
HTML:= $(MD:.md=.html)

all: $(HTML)

$(HTML): $(MD)
	pandoc \
		--section-divs \
		--toc \
		--lua-filter ../src/code-includes.lua \
		-o $@ $<

clean:
	rm $(HTML)

.PHONY: clean
