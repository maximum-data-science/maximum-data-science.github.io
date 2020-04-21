---
layout: page
title: Menu of this website
date: 2020-04-21
summary: This page describes the ideas behind the menu of this website and why tags not the optimal. Brief words to the implementation in liquid are mentioned.
noimage: true
---

The ideas behind the menu of this website are:

1. A page is part of a context which can be part of a wider context and so forth, meaning there are different levels of abstraction which cannot be depicted with *tags*.
1. There are different ways to get to a page.

Because of the first point the structure of the menu was stored in a Jekyll data file [_data/nav.yml]({{site.github-src}}_data/nav.yml).

As the following [YAML](https://en.wikipedia.org/wiki/YAML) snippet shows: The `venn-diagram-generator-x` page can be reached by `programming` or `projects`. `programming` itself has other items than the `venn-diagram-generator-x`.

``` yaml
items:
  - id: programming
    items:
      - id: javascript
        items:
          - id: venn-diagram-generator-x
      - id: jekyll
        items:
          - id: menu-website
  - id: projects
    items:
      - id: venn-diagram-generator-x
```
In order to find the current page and its items in the menu structure `page.url` and `item.id` have to be matched on a code level. Unfortunately *Arrays* in [Liquid](https://shopify.github.io/liquid) can only be extended by creation of a *new reference*. This means the menu structure cannot be traversed by *subcalls*. As [nav-default.html]({{site.github-src}}_layouts/nav-default.html) shows, this was solved by code repetition.
