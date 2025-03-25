#!/usr/bin/env ruby
# frozen_string_literal: true

begin
  require 'origami'
rescue LoadError
  $: << File.join(__dir__, "/../../lib")
  require 'origami'
end
include Origami

#
# Displays a message box when the document is opened.
#

OUTPUT_FILE = "#{File.basename(__FILE__, ".rb")}.pdf"

# Creating a new file
PDF.new
  .onDocumentOpen(Action::JavaScript('app.alert("Hello world");'))
  .save(OUTPUT_FILE)

puts "PDF file saved as #{OUTPUT_FILE}."
