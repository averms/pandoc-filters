SRC := $(wildcard *.lua)
FILTERS := ${SRC:%.lua=../%.lua}

all: $(FILTERS)

test: all
	@$(MAKE) -Ctest test

$(FILTERS): ../%.lua: %.lua
	@# remove any debugging
	@# add copyright and stuff
	m4 -P ../.m4 "$<" | sed '/= require(.pl/d' > $@

clean:
	rm $(FILTERS)

debug:
	@echo '$(SRC)'

.PHONY: clean copy
