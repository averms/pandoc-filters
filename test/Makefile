# standard-code, code-includes, and transclude
M_SRC  := alpha.md
M_HTML := $(M_SRC:%.md=out/%.html)
M_MD   := $(M_SRC:%.md=out/%.txt)
M_JSON := $(M_SRC:%.md=out/%.json)
# oldschool
OS_SRC := oldschool.md
OS     := $(OS_SRC:%.md=out/%.txt)

all: build $(M_HTML) $(M_MD) $(M_JSON) $(OS) find_diffs

$(M_HTML): $(M_SRC) build
	@pandoc \
		--verbose \
		-f markdown -t html \
		--no-highlight \
		--lua-filter ../dist/transclude.lua \
		--lua-filter ../dist/code-includes.lua \
		--lua-filter ../dist/standard-code.lua \
		-o $(M_HTML) $<

$(M_MD): $(M_SRC) build
	@pandoc \
		--verbose \
		-f markdown -t markdown \
		--atx-headers \
		--lua-filter ../dist/transclude.lua \
		--lua-filter ../dist/code-includes.lua \
		--lua-filter ../dist/standard-code.lua \
		-o $(M_MD) $<

$(M_JSON): $(M_SRC) build
	@pandoc \
		--verbose \
		-f markdown -t json \
		--lua-filter ../dist/transclude.lua \
		--lua-filter ../dist/code-includes.lua \
		--lua-filter ../dist/standard-code.lua \
		-o $(M_JSON) $<	

$(OS): $(OS_SRC) build
	@pandoc \
		--verbose \
		-s -t plain \
		--lua-filter ../dist/oldschool.lua \
		-o $(OS) $<

build:
	$(MAKE) -C..

find_diffs:
	@cd out && sh find_diffs.sh "$(M_SRC:%.md=%)"
	@cd out && sh find_diffs.sh "$(OS_SRC:%.md=%)"

clean:
	rm -f $(M_HTML)
	rm -f $(M_MD)
	rm -f $(M_JSON)
	rm -f $(OS)

debug:
	@echo '$(OS)'

.PHONY: debug clean find_diffs build all
