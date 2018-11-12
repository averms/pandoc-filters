FILTERS := ${wildcard *.lua}

all:
	@$(MAKE) -Csrc

copy: all
	cp $(FILTERS) ~/.pandoc/filters/

clean:
	@$(MAKE) -Csrc clean

.PHONY: clean
