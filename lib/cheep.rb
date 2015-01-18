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
    patch = ['#N canvas 400 400 400 400 10;']

    # Objects
    # i.e. #X obj 97 131 print;
    @@objects.each do |obj|
      patch << obj.to_patch.values.first
    end

    # Connections
    # i.e. #X connect 1 0 1 0;
    @@objects.each do |obj|
      obj.ins.each.with_index do |sender, r_i|
        patch << "#X connect #{sender.num} 0 #{obj.num} #{r_i};"
      end
    end

    patch.join "\n"
  end
end

require_relative 'object'
