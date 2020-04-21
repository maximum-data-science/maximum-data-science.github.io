BUNDLE := bundle
JEKYLL := $(BUNDLE) exec jekyll
HTMLPROOF := $(BUNDLE) exec htmlproofer

.PHONY: all clean install update

all : serve

check:
	$(JEKYLL) build
	$(JEKYLL) doctor
	$(HTMLPROOF) --assume-extension _site

install:
	$(BUNDLE) install

update:
	$(BUNDLE) update

serve:
	$(JEKYLL) serve --draft --baseurl ''

git:
	git add .
	git commit -m "$m"
	git push -u origin master

clean:
	rm -fr _site/
	rm -fr .sass_cache
