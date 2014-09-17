#!/usr/bin/env ruby
# encoding: utf-8

# Require all .rb files in subdirectories of the lib dir
this_dir = File.expand_path(File.dirname(__FILE__))
Dir.glob("#{this_dir}/*/**/*.rb").each do |lib|
  require lib
end

puts 'Cheep cheep!'
