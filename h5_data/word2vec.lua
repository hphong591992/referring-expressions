
local file = io.open("UNC_RefExp_vocabulary.txt", "r")
local w2vutils = require('w2vutils')
local tds = require 'tds'

local idx2word, word2idx = tds.Vec(), tds.Hash()

local cnt = 0
while true do
   local line = file:read()

   if not line then
      break
   end

   cnt = cnt + 1
   idx2word[cnt] = line
   word2idx[line] = cnt
end
file:close()
local w2vsample = w2vutils:word2vec('a')
local w2vdim = w2vsample:nElement()
local w2vtensor = torch.Tensor(cnt, w2vdim)

for i = 1, #idx2word do
   local word = idx2word[i]
   local vector = w2vutils:word2vec(word)
   w2vtensor[i]:copy(vector)
end

torch.save('UNC_RefExp_vocab_vector.t7', {
   _idx2word = idx2word,
   _word2idx = word2idx,
   wordvec = w2vtensor
})
