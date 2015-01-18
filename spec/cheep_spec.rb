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
end
