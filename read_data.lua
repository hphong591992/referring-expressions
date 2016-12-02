local cjson = require 'cjson'

-- TODO(hphong): Make the path become a parameter
local file = io.open('/home/phong/Data/annotations/instances_val2014.json')

-- TODO(hphong): Read and convert the json file to t7
local table = cjson.decode(file:read('*'))
