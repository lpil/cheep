# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

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
    add_objects patch

    # Connections
    # i.e. #X connect 1 0 1 0;
    patch << Connector.new(objects).resolve_connections

    patch.flatten.join "\n"
  end

  def self.add_objects(patch)
    objects.each do |obj|
      patch << obj.to_patch.values.first
    end
    patch
  end

  private_class_method :objects, :add_objects
end

require_relative 'object'
require_relative 'connector'
