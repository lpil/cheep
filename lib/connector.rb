class Cheep::Connector
  attr_reader :objects

  def initialize(objects)
    @objects = objects
  end

  def resolve_connections
    objects.each_with_object([]) do |obj, patch|
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
  end

  private

  def connection(sender, reciever, sender_input)
    "#X connect #{sender.num} 0 #{reciever.num} #{sender_input};"
  end
end
