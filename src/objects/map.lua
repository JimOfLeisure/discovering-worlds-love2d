Map = {}

vec2 = require("objects/vec2")

-- Local referecnes for speed improvements
local love_noise = love.math.noise
local graphics = love.graphics

function Map:new()
    local map = {}
    map.seed = vec2:new(0.1, 0.1)
    map.noise_mult = 0.002
    function map:noise(pos)
        return love_noise(pos.x * self.noise_mult + self.seed.x, pos.y * self.noise_mult + self.seed.y)
    end
    function map:draw()
        for j=0,600,5 do
            for i=0,800,5 do
                local y = self:noise(vec2:new(i,j))
                graphics.setColor(y, y, y)
                graphics.rectangle("fill", i, j, 5, 5)
            end
        end
    end
    return map
end

return Map