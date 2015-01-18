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

class Cheep::Object
  def initialize(name, num, *args)
    @name = name
    @args = args
    @num = num
  end

  def to_patch
    { @num => "#X obj 0 0 #{@name} #{@args.join ' ' }" }
  end
end
