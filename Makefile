BUNDLE := bundle
JEKYLL := $(BUNDLE) exec jekyll
HTMLPROOF := $(BUNDLE) exec htmlproofer

.PHONY: all clean install update

all : serve

check:
	$(JEKYLL) build
#	$(JEKYLL) doctor
	$(HTMLPROOF) \
	--assume-extension \
	_site

install:
	$(BUNDLE) install

update:
	$(BUNDLE) update

build:
	$(JEKYLL) build

serve:
	$(JEKYLL) serve  --draft --baseurl ''

clean:
	rm -fr _site/
	rm -fr .sass_cache
