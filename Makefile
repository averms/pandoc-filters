FILTERS := ${wildcard *.lua}

all:
	@$(MAKE) -Csrc

copy:
	cp $(FILTERS) ~/.pandoc/filters/

clean:
	@$(MAKE) -Csrc clean

.PHONY: clean
