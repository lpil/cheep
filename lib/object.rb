# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class Cheep::Object
  attr_reader :name, :num, :ins

  def initialize(name, num, *args)
    @name = name
    @args = args
    @num = num
    @ins = []
  end

  def to_patch
    name = @name.to_s.sub '!', '~'
    { @num => "#X obj 0 0 #{name} #{@args.join ' ' }".strip << ';' }
  end

  def [](*args)
    @ins = args
    self
  end

  def each_upstream_object
    ins.each.with_index do |senders, reciever_input|
      senders = self.class.ensure_collection senders

      senders.each do |sender|
        yield sender, reciever_input
      end
    end
  end

  def self.ensure_collection(col)
    if col.class == Array
      col
    else
      [col]
    end
  end

  # private_class_method :ensure_collection
end
