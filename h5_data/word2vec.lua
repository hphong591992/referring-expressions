io.input("UNC_RefExp_vocabulary.txt")

local w2vutils = require('w2vutils')

local dictionary = {}

while true do
  local line = io.read()

  if (line == nil) then
    break
  end

  local vector = w2vutils:word2vec(line)
  dictionary[line] = vector
end

torch.save('UNC_RefExp_vocab_vector.t7', dictionary, 'ascii')


