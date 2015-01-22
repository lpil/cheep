class Cheep::Connector
  attr_reader :objects

  def initialize(objects)
    @objects = objects
  end

  def resolve_connections
    objects.each_with_object([]) do |obj, patch|
      obj.ins.each.with_index do |sender_or_senders, sender_input|
        patch << connect_or_recurse(
          sender_or_senders, obj, sender_input
        )
      end
    end
  end

  private

  def connection(sender_num, reciever_num, sender_input)
    "#X connect #{sender_num} 0 #{reciever_num} #{sender_input};"
  end

  def connect_or_recurse(sender_or_senders, reciever, sender_input)
    patch = []
    if sender_or_senders.class == Array
      sender_or_senders.each do |sender|
        patch << connection(sender.num, reciever.num, sender_input)
      end
    else
      patch << connection(sender_or_senders.num, reciever.num, sender_input)
    end
    patch
  end
end
