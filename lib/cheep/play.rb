require 'wavefile'

#
module Cheep
  def self.play(samples, filename = 'cheep.wav')
    writer_format = WaveFile::Format.new :mono, :pcm_16, SAMPLE_RATE
    buffer_format = WaveFile::Format.new :mono, :float,  SAMPLE_RATE

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
