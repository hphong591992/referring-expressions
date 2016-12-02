local cjson = require 'cjson'

-- TODO(hphong): Make the path become a parameter
local file = io.open('/home/phong/Data/annotations/instances_val2014.json')

local table = cjson.decode(file:read('*'))
