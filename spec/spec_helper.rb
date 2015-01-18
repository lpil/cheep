require_relative '../lib/cheep'

def reset_patch
  Cheep.class_eval '@@objects = []'
end
