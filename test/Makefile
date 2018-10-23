# test

OG := test.md
AUX := test.lua
HTML := out.html
MD := out.markdown
JSON := out.json

test: test_html test_markdown test_json

test_html: $(OG)
	pandoc \
		--verbose \
		--no-highlight \
		--lua-filter ../src/code-includes.lua \
		--lua-filter ../src/md-includes.lua \
		-o $(HTML) $<

test_markdown: $(OG)
	pandoc \
		--verbose \
		-f markdown -t markdown \
		--lua-filter ../src/code-includes.lua \
		--lua-filter ../src/md-includes.lua \
		-o $(MD) $<

test_json: $(OG)
	pandoc \
		--verbose \
		--lua-filter ../src/code-includes.lua \
		--lua-filter ../src/md-includes.lua \
		-o $(JSON) $<	

clean:
	rm -f $(HTML)
	rm -f $(MD)
	rm -f $(JSON)

.PHONY: clean test test_markdown test_html test_json
