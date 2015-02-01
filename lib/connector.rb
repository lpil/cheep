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
    obj.each_upstream_object do |sender, reciever_input|
      patch << connection(sender.num, obj.num, reciever_input)
    end
    patch
  end

  def connection(sender_num, reciever_num, reciever_input)
    "#X connect #{sender_num} 0 #{reciever_num} #{reciever_input};"
  end
end
