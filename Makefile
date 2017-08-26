

validate: validate-yaml .azure.json
	for t in $(shell find . -iname "*.packer.json" -type f); do \
		./scripts/packer validate --var-file=.azure.json $$t; \
	done;

validate-yaml:
	for t in $(shell find . -iname "*.yml" -type f); do \
		echo ">> Validating $$t"; \
		docker run --rm -v $$PWD:$$PWD -w $$PWD \
			ruby:2-alpine ruby -e "require 'yaml'; puts YAML.load(File.read('$$t'));"; \
	done;


all: validate
	for t in $(shell find . -iname "*.packer.json" -type f); do \
		./scripts/packer build --var-file=.azure.json $$t; \
	done;

.azure.json:
	echo ">> .azure.json doesn't exist, you'll probably want to generate it yourself"
	touch .azure.json

clean:


.PHONY: all validate clean validate-yaml
