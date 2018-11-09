FILTERS := ${wildcard *.lua}

all:
	@$(MAKE) -Csrc

test: $(FILTERS)
	@$(MAKE) -Ctest test

copy:
	cp $(FILTERS) ~/.pandoc/filters/

clean:
	@$(MAKE) -Csrc clean

.PHONY: clean
