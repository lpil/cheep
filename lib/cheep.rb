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
    patch << resolve_connections(@@objects)

    patch.flatten.join "\n"
  end

  def self.resolve_connections(objects)
    patch = []
    objects.each do |obj|
      obj.ins.each.with_index do |sender_or_senders, sender_input|
        if sender_or_senders.class == Array
          sender_or_senders.each do |sender|
            patch << connection(sender, obj, sender_input)
          end
        else
          patch << connection(sender_or_senders, obj, sender_input)
        end
      end
    end
    patch
  end

  def self.connection(sender, reciever, sender_input)
    "#X connect #{sender.num} 0 #{reciever.num} #{sender_input};"
  end

  private_class_method :connection, :resolve_connections
end

require_relative 'object'
