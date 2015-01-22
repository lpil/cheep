# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

require_relative '../lib/cheep'

def reset_patch
  Cheep.class_eval '@@objects = []'
end

def test_patch(patch, patch_patterns)
  lines = patch.split "\n"

  expect(lines.size).to eq(patch_patterns.size)

  lines.zip(patch_patterns).each do |line, pattern|
    expect(line).to match(/\A#{pattern}\z/)
  end
end
