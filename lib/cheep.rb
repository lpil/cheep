#!/usr/bin/env ruby

require 'blankslate'
# require 'yaml'

# methods = YAML.load_file 'resource/pd_objects.yml'

class Cheep < BlankSlate
  @@objects = []

  def self.method_missing(name, *args)
    self[name, *args]
  end

  def self.[](name, *args)
    name = name.to_sym
    PureDataObject.new name, *args
  end
end

class PureDataObject
  def initialize(name, *args)
    @name = name
    @args = args
  end
end
