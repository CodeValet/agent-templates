


validate:
	for t in $(shell find . -iname "*.packer.json" -type f); do \
		./scripts/packer validate --var-file=.azure.json $$t; \
	done;

all: validate
	for t in $(shell find . -iname "*.packer.json" -type f); do \
		./scripts/packer build --var-file=.azure.json $$t; \
	done;



.PHONY: all validate clean
