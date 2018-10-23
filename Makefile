FILTERS := code-includes.lua

all: $(FILTERS)

$(FILTERS): %.lua: src/%.lua
	@# remove any debugging
	sed '/require("inspect/d' $< > $@

clean:
	rm $(FILTERS)

debug: ; $(info var is [$(FILTERS)])
.PHONY: all
