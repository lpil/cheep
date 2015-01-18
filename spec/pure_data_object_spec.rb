require_relative 'spec_helper'

describe PureDataObject do
  describe 'initialize' do
    it 'assigns the name to the @name instance var' do
      obj = Cheep.print 'Hello'
      expect(obj.instance_variable_get :@name).to eq(:print)
    end

    it 'assigns the arg to the @args instance var' do
      obj = Cheep.list 1, 3, 3, 7
      expect(obj.instance_variable_get :@args).to eq([1, 3, 3, 7])
    end
  end
end
