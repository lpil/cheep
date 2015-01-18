#!/usr/bin/env ruby

require 'blankslate'
# require 'yaml'

# methods = YAML.load_file 'resource/pd_objects.yml'

class Cheep < BlankSlate
  def self.method_missing(name, *args)
    self[name, *args]
  end

  def self.[](name, *args)
    name = name.to_sym
    puts name
    puts args
  end
end
