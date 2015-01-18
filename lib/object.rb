class Cheep::Object
  attr_reader :name, :num

  def initialize(name, num, *args)
    @name = name
    @args = args
    @num = num
  end

  def to_patch
    name = @name.to_s.sub '!', '~'
    { @num => "#X obj 0 0 #{name} #{@args.join ' ' }" }
  end
end
