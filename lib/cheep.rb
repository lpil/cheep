#!/usr/bin/env ruby

require 'blankslate'
# require 'yaml'

# methods = YAML.load_file 'resource/pd_objects.yml'

class Cheep < BlankSlate
  def method_missing(name, *args)
    puts name
    puts args
  end

  def [](name, *args)
    __send__ name.to_sym, *args
  end
end
