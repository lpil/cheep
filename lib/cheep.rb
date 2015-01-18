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

  def self.to_patch
    @@objects.each_with_object('#N canvas 400 400 400 400 10;') do |obj, patch|
      patch << "\n"
      patch << obj.to_patch.values.first
    end
  end
end

require_relative 'object'
