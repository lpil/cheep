#!/usr/bin/env ruby
# encoding: utf-8

# Require all .rb files in this lib directory
Dir.glob('**/*.rb').each { |lib| require_relative lib }

puts 'Cheep cheep!'
