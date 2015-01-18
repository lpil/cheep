require_relative '../lib/cheep'

def reset_patch
  Cheep.class_eval '@@objects = []'
end

def test_patch(patch, patch_patterns)
  patch.split("\n").zip(patch_patterns).each do |line, pattern|
    expect(line).to match(/\A#{pattern}\z/)
  end
end
