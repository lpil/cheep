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
end
