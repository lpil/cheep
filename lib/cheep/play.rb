require 'wavefile'

#
module Cheep
  def self.play(samples, sample_rate = 44_100, filename = 'cheep.wav')
    writer_format = WaveFile::Format.new :mono, :pcm_16, sample_rate
    buffer_format = WaveFile::Format.new :mono, :float,  sample_rate

    WaveFile::Writer.new filename, writer_format do |writer|
      writer.write(WaveFile::Buffer.new samples, buffer_format)
    end

    platform = `uname`.chomp
    case platform
    when 'Darwin'
      system "afplay #{filename}"
    when 'Linux'
      system "aplay #{filename}"
    else
      abort "I don't know how to play wavs on #{platform}"
    end
  end
end
