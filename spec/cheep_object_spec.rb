# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

require_relative 'spec_helper'

describe Cheep::Object do
  describe 'initialize' do
    it 'assigns the name to the @name instance var' do
      obj = Cheep.print 'Hello'
      expect(obj.instance_variable_get :@name).to eq(:print)
    end

    it 'assigns the arg to the @args instance var' do
      obj = Cheep.foo 1, 3, 3, 7
      expect(obj.instance_variable_get :@args).to eq([1, 3, 3, 7])
    end

    it 'increments the Cheep object number' do
      expect { Cheep.foo }.to change { Cheep.class_eval '@@objects.size' }.by 1
    end

    it 'assigned the Cheep object number to @num' do
      num = Cheep.class_eval('objects').size
      expect(Cheep.foo.num).to eq(num)
    end
  end

  describe 'to_patch' do
    it 'returns a hash with num as the key and the string as the value' do
      obj = Cheep.print 'Hello'
      expect(obj.to_patch).to match(
        obj.num => /\A#X obj \d+ \d+ print Hello;\z/
      )
    end

    it 'replaces ! for ~ in the name' do
      expect(Cheep.dac!.to_patch.values.first).to match(/dac~/)
    end
  end
end
