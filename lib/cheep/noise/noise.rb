module Cheep
  # The base noise class. Contains an array of samples. Probably not to be
  # accessed directly.
  class Noise
    # @param samples [Array] An array of samples as floats
    # @return [Noise]
    def initialize(samples)
      @samples = samples
    end
  end
end

module Cheep
  # A sine wave noise
  class Sine < Cheep::Noise
    attr_reader :samples

    # Creates a sine wave noise
    # @param frequency [Numeric] Frequency of wave in Hz
    # @param num_samples [Integer] Number of samples
    # @return [Sine]
    def initialize(frequency, num_samples)
      cycles_per_sample = frequency.to_f / SAMPLE_RATE

      samples = []
      phase = 0.0
      num_samples.times do
        samples << Math::sin(2 * Math::PI * phase)
        phase += cycles_per_sample
      end

      @samples = samples
    end
  end
end
