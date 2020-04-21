BUNDLE := bundle
JEKYLL := $(BUNDLE) exec jekyll
HTMLPROOF := $(BUNDLE) exec htmlproofer

README_NAMES := venn-diagram-generator-x data-science-quiz
DIR_README_NAMES := $(addprefix _project-readmes/,$(README_NAMES))
READMES := $(addsuffix .txt,$(DIR_README_NAMES))

.PHONY: all clean install update readmes build

all : serve

readmes: ${READMES}

_project-readmes/%.txt:_docs/%.md
	@echo "input" $<
	@echo "output" $@
	cp $< $@
	sed -i 's/layout: *page */layout: readme/g' $@

check-local:
	$(JEKYLL) build --config "_config.localhost.yml"
	$(HTMLPROOF) --assume-extension _site

check-online:
	$(JEKYLL) build
	$(JEKYLL) doctor
	$(HTMLPROOF) --assume-extension _site

install:
	$(BUNDLE) install

update:
	$(BUNDLE) update

build:
	$(JEKYLL) build

serve:
	$(JEKYLL) serve --draft --baseurl ''

git:
	git add .
	git commit -m "$m"
	git push -u origin master

clean:
	rm -fr _site/
	rm -fr .sass_cache
