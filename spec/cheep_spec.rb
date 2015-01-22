# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

require_relative 'spec_helper'

describe Cheep do
  describe 'method call syntax for object creation' do
    it 'calls :[]' do
      expect(Cheep).to receive(:[])
      Cheep.print
    end

    it 'passes the method name as the first arg' do
      expect(Cheep).to receive(:[]) do |name|
        expect(name).to eq(:list)
      end
      Cheep.list 1, 2, 3, 4
    end

    it 'passes the args' do
      expect(Cheep).to receive(:[]) do |_, *args|
        expect(args).to eq([4, 3, 2, 1])
      end
      Cheep.list 4, 3, 2, 1
    end
  end

  describe ':[] syntax for object creation' do
    it 'returns a Cheep::Object' do
      expect(Cheep[:print].class).to eq(Cheep::Object)
    end

    it 'adds the Object to the @@objects array' do
      obj = Cheep.pow
      expect(Cheep.class_eval('@@objects').last).to eq(obj)
    end
  end

  describe 'to_patch' do
    before(:each) { reset_patch }

    it 'starts with the canvas declaration' do
      Cheep.osc! 440
      Cheep.dac!

      expect(Cheep.to_patch).to match(/\A#N canvas \d+ \d+ \d+ \d+ \d+;$/)
    end

    it 'Adds the objects' do
      Cheep.osc! 440
      Cheep.dac!
      patch = Cheep.to_patch

      patch_patterns = [
        /#N canvas \d+ \d+ \d+ \d+ \d+;/,
        /#X obj \d+ \d+ osc~ 440;/,
        /#X obj \d+ \d+ dac~;/
      ]

      test_patch patch, patch_patterns
    end

    it 'calls Cheep::Connector.new with objects' do
      osc = Cheep.osc! 440
      dac = Cheep.dac!
      dac[osc, osc]

      expect(Cheep::Connector).to receive(:new)
        .with(Cheep.instance_eval 'objects')
        .and_call_original

      Cheep.to_patch
    end
  end
end
