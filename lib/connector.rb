class Cheep::Connector
  attr_reader :objects

  def initialize(objects)
    @objects = objects
  end

  def resolve_connections
    objects.each_with_object([]) do |obj, patch|
      obj.ins.each.with_index do |senders, sender_input|

        senders = [senders] unless senders.class == Array

        senders.each do |sender|
          patch << connection(sender.num, obj.num, sender_input)
        end
      end
    end
  end

  private

  def connection(sender_num, reciever_num, sender_input)
    "#X connect #{sender_num} 0 #{reciever_num} #{sender_input};"
  end
end
