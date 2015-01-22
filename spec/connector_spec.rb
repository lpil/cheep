describe Cheep::Connector do
  before(:each) { reset_patch }

  it 'adds the connections' do
    osc = Cheep.osc! 440
    dac = Cheep.dac!
    dac[osc, osc]
    patch = Cheep.to_patch

    patch_patterns = [
      /#N canvas \d+ \d+ \d+ \d+ \d+;/,
      /#X obj \d+ \d+ osc~ 440;/,
      /#X obj \d+ \d+ dac~;/,
      /#X connect 0 0 1 0;/,
      /#X connect 0 0 1 1;/
    ]

    test_patch patch, patch_patterns
  end

  it 'allows multiple objects to be connected to one input' do
    osc1 = Cheep.osc! 440
    osc2 = Cheep.osc! 220
    dac = Cheep.dac!
    dac[[osc1, osc2]]
    patch = Cheep.to_patch

    patch_patterns = [
      /#N canvas \d+ \d+ \d+ \d+ \d+;/,
      /#X obj \d+ \d+ osc~ 440;/,
      /#X obj \d+ \d+ osc~ 220;/,
      /#X obj \d+ \d+ dac~;/,
      /#X connect 0 0 2 0;/,
      /#X connect 1 0 2 0;/
    ]

    test_patch patch, patch_patterns
  end

  describe '.connection' do
    it 'builds the correct connection string' do
      connector = Cheep::Connector.new []

      expect(connector.send :connection, 1, 2, 3)
        .to eq('#X connect 1 0 2 3;')
    end
  end
end
