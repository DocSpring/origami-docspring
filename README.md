Origami
=====

> **Note**: This is a maintained fork of the original Origami library, released as the gem [origami-docspring](https://rubygems.org/gems/origami-docspring) on RubyGems. Despite the name change, you still `require 'origami'` and use the `Origami` module in your code.

[![Gem Version](https://badge.fury.io/rb/origami-docspring.svg)](https://rubygems.org/gems/origami-docspring)
[![Build Status](https://github.com/DocSpring/origami-docspring/actions/workflows/ci.yml/badge.svg)](https://github.com/DocSpring/origami-docspring/actions/workflows/ci.yml)
[![Downloads](https://img.shields.io/gem/dt/origami-docspring.svg)](https://rubygems.org/gems/origami-docspring)
[![License: LGPL v3](https://img.shields.io/badge/License-LGPL%20v3-blue.svg)](https://www.gnu.org/licenses/lgpl-3.0)

Overview
--------

Origami is a framework written in pure Ruby to manipulate PDF files.

It offers the possibility to parse the PDF contents, modify and save the PDF
structure, as well as creating new documents.

Origami supports some advanced features of the PDF specification:

  * Compression filters with predictor functions
  * Encryption using RC4 or AES, including the undocumented Revision 6 derivation algorithm
  * Digital signatures and Usage Rights
  * File attachments
  * AcroForm and XFA forms
  * Object streams

Origami is able to parse PDF, FDF and PPKLite (Adobe certificate store) files.

Requirements
------------

As of version 2.3.0, the minimal version required to run origami-docspring is Ruby 3.2.

Some optional features require additional gems:

  * [therubyracer][the-ruby-racer] for JavaScript emulation of PDF scripts

Quick start
-----------

First install the gem:

    $ gem install origami-docspring

Then import Origami with:

```ruby
require 'origami'
```

To process a PDF document, you can use the ``PDF.read`` method:

```ruby
pdf = Origami::PDF.read "something.pdf"

puts "This document has #{pdf.pages.size} page(s)"
```

The default behavior is to parse the entire contents of the document at once. This can be changed by passing the ``lazy`` flag to parse objects on demand.

```ruby
pdf = Origami::PDF.read "something.pdf", lazy: true

pdf.each_page do |page|
    page.each_font do |name, font|
        # ... only parse the necessary bits
    end
end
```

You can also create documents directly by instanciating a new PDF object:

```ruby
pdf = Origami::PDF.new

pdf.append_page
pdf.pages.first.write "Hello", size: 30

pdf.save("example.pdf")

# Another way of doing it
Origami::PDF.write("example.pdf") do |pdf|
    pdf.append_page do |page|
        page.write "Hello", size: 30
    end
end
```

Take a look at the [examples](examples) and [bin](bin) directories for some examples of advanced usage.

Tools
-----

Origami comes with a set of tools to manipulate PDF documents from the command line.

  * [pdfcop](bin/pdfcop): Runs some heuristic checks to detect dangerous contents.
  * [pdfdecompress](bin/pdfdecompress): Strips compression filters out of a document.
  * [pdfdecrypt](bin/pdfdecrypt): Removes encrypted contents from a document.
  * [pdfencrypt](bin/pdfencrypt): Encrypts a PDF document.
  * [pdfexplode](bin/pdfexplode): Explodes a document into several documents, each of them having one deleted resource. Useful for reduction of crash cases after a fuzzing session.
  * [pdfextract](bin/pdfextract): Extracts binary resources of a document (images, scripts, fonts, etc.).
  * [pdfmetadata](bin/pdfmetadata): Displays the metadata contained in a document.
  * [pdf2ruby](bin/pdf2ruby): Converts a PDF into an Origami script rebuilding an equivalent document (experimental).
  * [pdfsh](bin/pdfsh): An IRB shell running inside the Origami namespace.

**Note**: Since version 2.1, [pdfwalker][pdfwalker-gem] has been moved to a [separate repository][pdfwalker-repo].

License
-------

Origami is distributed under the [LGPL](COPYING.LESSER) license.

Copyright © 2019 Guillaume Delugré.
Copyright © 2025 DocSpring, Inc.

[the-ruby-racer]: https://rubygems.org/gems/therubyracer
[pdfwalker-gem]: https://rubygems.org/gems/pdfwalker
[pdfwalker-repo]: https://github.com/gdelugre/pdfwalker
