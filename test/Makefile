# test

OG := alpha.md
HTML := out/out.html
MD := out/out.markdown
JSON := out/out.json

test: test_html test_markdown test_json

test_html: $(OG) build
	pandoc \
		--verbose \
		--no-highlight \
		--lua-filter ../code-includes.lua \
		--lua-filter ../md-includes.lua \
		--lua-filter ../standard-code.lua \
		-o $(HTML) $<

test_markdown: $(OG)
	pandoc \
		--verbose \
		-f markdown -t markdown \
		--lua-filter ../code-includes.lua \
		--lua-filter ../md-includes.lua \
		--lua-filter ../standard-code.lua \
		-o $(MD) $<

test_json: $(OG)
	pandoc \
		--verbose \
		--lua-filter ../code-includes.lua \
		--lua-filter ../md-includes.lua \
		--lua-filter ../standard-code.lua \
		-o $(JSON) $<	

build:
	@$(MAKE) -C..

clean:
	rm -f $(HTML)
	rm -f $(MD)
	rm -f $(JSON)

.PHONY: clean test test_markdown test_html test_json
