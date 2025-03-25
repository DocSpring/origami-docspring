# frozen_string_literal: true

require_relative 'lib/origami/version'

Gem::Specification.new do |s|
  s.name = "origami-docspring"
  s.version = Origami::VERSION
  s.author = "Guillaume Delugré"
  s.email = "support@docspring.com"
  s.homepage = "http://github.com/DocSpring/origami-docspring"
  s.platform = Gem::Platform::RUBY

  s.summary = "Ruby framework to manipulate PDF documents"
  s.description = "Origami is a pure Ruby library to parse, modify and generate PDF documents."

  s.files = Dir[
    'README.md',
    'CHANGELOG.md',
    'COPYING.LESSER',
    "{lib,bin,test,examples}/**/*",
    "bin/shell/.irbrc"
                  ]

  s.require_path = "lib"
  s.test_file = "test/test_pdf.rb"
  s.license = "LGPL-3.0-or-later"

  s.required_ruby_version = '>= 3.2'
  s.add_runtime_dependency "colorize", "~> 0.8"
  s.add_runtime_dependency "rexml", "~> 3.2"
  s.add_runtime_dependency "matrix", "~> 0.4"
  s.add_development_dependency "minitest", "~> 5.20"
  s.add_development_dependency 'rake', '~> 13.1'
  s.add_development_dependency 'rdoc', '~> 6.6'
  s.add_development_dependency 'rubocop', '~> 1.60'
  s.add_development_dependency 'standard', '~> 1.35'

  s.bindir = "bin"
  s.executables = %w[pdfsh
    pdf2pdfa pdf2ruby
    pdfcop pdfmetadata
    pdfdecompress pdfdecrypt pdfencrypt
    pdfexplode pdfextract]
end
