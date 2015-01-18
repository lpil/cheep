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
end
