# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class Cheep::Connector
  attr_reader :objects

  def initialize(objects)
    @objects = objects
  end

  def resolve_connections
    objects.each_with_object([]) do |obj, patch|
      patch.concat connections_for_object(obj)
    end
  end

  private

  def connections_for_object(obj)
    patch = []
    obj.ins.each.with_index do |senders, sender_input|

      senders = [senders] unless senders.class == Array

      senders.each do |sender|
        patch << connection(sender.num, obj.num, sender_input)
      end
    end
    patch
  end

  def connection(sender_num, reciever_num, sender_input)
    "#X connect #{sender_num} 0 #{reciever_num} #{sender_input};"
  end
end
