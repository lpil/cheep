# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

require_relative 'spec_helper'

describe Cheep::Object do
  describe '.initialize' do
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



  describe '.to_patch' do
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



  describe '.each_upstream_object' do
    it 'iterates through senders connected to ins, with an input num' do
      obj = Cheep.dac!
      in1 = Cheep.osc! 1
      in2 = Cheep.osc! 2
      in3 = Cheep.osc! 3
      # Test with a bare object in input 1, and an array in input 2
      obj[
        in1,
        [in2, in3]
      ]

      connected_senders = [in1, in2, in3]
      input_numbers = [0, 1, 1]

      obj.each_upstream_object do |sender, reciever_input|
        expect(sender).to eq(connected_senders.shift)

        expect(reciever_input).to eq(input_numbers.shift)
      end
    end
  end



  describe '#ensure_collection' do
    it 'does not modify arrays' do
      arr = Array.new(10) { rand 100 }

      expect(Cheep::Object.ensure_collection arr).to eq(arr)
    end

    it 'wraps single objects in an array' do
      obj = rand 100

      expect(Cheep::Object.ensure_collection obj).to eq([obj])
    end
  end
end
