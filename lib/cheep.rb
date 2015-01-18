#!/usr/bin/env ruby

require 'blankslate'

class Cheep < BlankSlate
  @@objects = []

  def self.method_missing(name, *args)
    self[name, *args]
  end

  def self.[](name, *args)
    name = name.to_sym
    object = Cheep::Object.new name, @@objects.size, *args
    @@objects << object
    object
  end
end

require_relative 'object'
