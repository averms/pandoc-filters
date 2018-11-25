OLDSCHOOL := oldschool-readme.md
PLAIN := out/plain.txt
OG := alpha.md
HTML := out/out.html
MD := out/out.txt
JSON := out/out.json

test: build test_html test_markdown test_json find_diffs

test_html: $(OG)
	@pandoc \
		--verbose \
		--no-highlight \
		--lua-filter ../transclude.lua \
		--lua-filter ../code-includes.lua \
		--lua-filter ../standard-code.lua \
		-o $(HTML) $<

test_markdown: $(OG)
	@pandoc \
		--verbose \
		-f markdown -t markdown \
		--atx-headers \
		--lua-filter ../transclude.lua \
		--lua-filter ../code-includes.lua \
		--lua-filter ../standard-code.lua \
		-o $(MD) $<

test_json: $(OG)
	@pandoc \
		--verbose \
		--lua-filter ../transclude.lua \
		--lua-filter ../code-includes.lua \
		--lua-filter ../standard-code.lua \
		-o $(JSON) $<	

test_plain: $(OLDSCHOOL) build
	@pandoc \
		--verbose \
		-s -t plain \
		--lua-filter ../src/oldschool-readme.lua \
		$<

build:
	@$(MAKE) -C..

find_diffs:
	@cd out && bash find_diffs.sh

clean:
	rm -f $(HTML)
	rm -f $(MD)
	rm -f $(JSON)

.PHONY: clean test_markdown test_html test_json
