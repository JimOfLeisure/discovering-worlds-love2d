Map = {}

vec2 = require("objects/vec2")

-- Local referecnes for speed improvements
local love_noise = love.math.noise
local graphics = love.graphics

function Map:new()
    local map = {}
    map.seed = vec2:new(0.1, 0.1)
    function map:noise(pos)
        return love_noise(pos.x + self.seed.x, pos.y + self.seed.y)
    end
    function map:draw()
        for i=0,800 do
            for j=0,600 do
                local y = self:noise(vec2.new(i,j))
                graphics.setColor(y, y, y)
                graphics.points(i,j)
            end
        end
    end
    return map
end

return Map