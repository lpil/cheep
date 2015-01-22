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

  def self.objects
    @@objects
  end

  def self.to_patch
    patch = ['#N canvas 400 400 400 400 10;']

    # Objects
    # i.e. #X obj 97 131 print;
    objects.each do |obj|
      patch << obj.to_patch.values.first
    end

    # Connections
    # i.e. #X connect 1 0 1 0;
    patch << Connector.new(objects).resolve_connections

    patch.flatten.join "\n"
  end

  private_class_method :objects
end

require_relative 'object'
require_relative 'connector'
