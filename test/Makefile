# oldschool-readme
OS_SRC := oldschool-readme.md
OS     := ${OS_SRC:%.md=out/%.txt}
# standard-code, code-includes, and transclude
M_SRC  := alpha.md
M_HTML := ${M_SRC:%.md=out/%.html}
M_MD   := ${M_SRC:%.md=out/%.pandoc}
M_JSON := ${M_SRC:%.md=out/%.json}

test: build $(M_HTML) $(M_MD) $(M_JSON) $(OS) find_diffs

$(M_HTML): $(M_SRC)
	@pandoc \
		--verbose \
		--no-highlight \
		--lua-filter ../transclude.lua \
		--lua-filter ../code-includes.lua \
		--lua-filter ../standard-code.lua \
		-o $(M_HTML) $<

$(M_MD): $(M_SRC)
	@pandoc \
		--verbose \
		-f markdown -t markdown \
		--atx-headers \
		--lua-filter ../transclude.lua \
		--lua-filter ../code-includes.lua \
		--lua-filter ../standard-code.lua \
		-o $(M_MD) $<

$(M_JSON): $(M_SRC)
	@pandoc \
		--verbose \
		--lua-filter ../transclude.lua \
		--lua-filter ../code-includes.lua \
		--lua-filter ../standard-code.lua \
		-o $(M_JSON) $<	

$(OS): $(OS_SRC) build
	@pandoc \
		--verbose \
		-s -t plain \
		--lua-filter ../src/oldschool-readme.lua \
		-o $(OS) $<

build:
	@$(MAKE) -C..

find_diffs:
	@cd out && bash find_diffs.sh "${M_SRC:%.md=%}"
	@cd out && bash find_diffs.sh "${OS_SRC:%.md=%}"

clean:
	rm -f $(M_HTML)
	rm -f $(M_MD)
	rm -f $(M_JSON)
	rm -f $(OS)

debug:
	@echo '$(OS)'

.PHONY: clean find_diffs
